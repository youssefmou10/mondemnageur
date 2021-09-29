<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use App\Models\Carte;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use Illuminate\Support\Facades\Storage;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use PDF;
use File;
use ZipArchive;
use Illuminate\Support\Facades\Validator;



class Cartes extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        echo "hello cartes";
    }
     /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function activate(Request $request)
    {  
        $request->validate([
            'qr_codes_select' => 'required',
        ]);

        $codes_cards = $request['qr_codes_select'];
        $table_lenght = 0;
        foreach ((array) $codes_cards as $key => $value) {
            $table_lenght++ ;
        }
        // $table_lenght = $codes_cards.length;
    //    dd($table_lenght );  //to check all the datas dumped from the form

        return view('activate', ['qr_codes' => $codes_cards,'table_lenght'=> $table_lenght ]);
    }
      /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function validateData(Request $request)
    {   
        
        // $request->validateWithBag([
        //     'nom' => 'required|min:3|max:20|alpha',
        //     'prenom' => 'required|min:3|max:20|alpha',
        //     'adresse' => 'required|min:3|max:50',
        //     'ville' => 'required',
        //     // 'qr_codes_select[]' => 'required',
        //     'tel' => 'size:10',  
        // ]);

        // Validator::make($request->all(), [
        //     'nom' => 'required|min:3|max:20|alpha',
        //     'prenom' => 'required|min:3|max:20|alpha',
        //     'adresse' => 'required|min:3|max:50',
        //     'ville' => 'required',
        //     // 'qr_codes_select[]' => 'required',
        //     'tel' => 'size:10', 

        // ])->validateWithBag('activer');
        
        $codes_cards = $request['qr_codes_select'];
        $table_lenght = 0;
        foreach ((array) $codes_cards as $key => $value) {
            $table_lenght++ ;
        }
        
        $validator = Validator::make($request->all(), [
               'nom' => 'required|min:3|max:20|alpha',
                'prenom' => 'required|min:3|max:20|alpha',
                'ville' => 'required',
                'tel' => 'size:10', 
                'rue' => 'required|',
                'residances' => 'required|',
                'quartier' => 'required|',
        ]);
        // dd($validator);
        if ($validator->fails()) {

             return view('activate', ['qr_codes' => $codes_cards,'table_lenght'=> $table_lenght ])->withErrors($validator);
        }
      
        
        $codes_cards = $request['qr_codes_select'];
        $table_lenght = 0;

        foreach ((array) $codes_cards as $key => $value) {
            $table_lenght++ ;
        }

        // dd( $table_lenght);
        $fake_codes = [];
        $validCodes = [];
         $j = 0;
         $f = 0;

        for ($i=0; $i < $table_lenght ; $i++) { 

            $carte = new Carte;
            $code_unique = $carte::where('CodeUnique', '=', $codes_cards[$i])->first();

            if ($code_unique === null) {

                $fake_codes[$j] = $codes_cards[$i];
                $j++;

            }else {

                $carte = Carte::where('CodeUnique', $codes_cards[$i])->first();

                if(substr( $codes_cards[$i], 0, 2 ) === "CV" )
                {

                    $carte['NomApporteur'] = $request->input("nom");
                    $carte['PrenomApporteur'] = $request->input("prenom");
                    $carte['rue'] = $request->input("rue");
                    $carte['residances'] = $request->input("residances");
                    $carte['quartier'] = $request->input("quartier");
                    $carte['ville'] = $request->input("ville");
                    $carte['tel'] = $request->input("tel");
                    // $carte['ActivationCodeUnique'] = true;
                    $carte['DejaUtliliser'] = false;
                    $validCodes[$f] = $codes_cards[$i];
                    $f++;
                    $carte->save();

                }else {
                        if($carte['ActivationCodeUnique'] != true){

                        $carte['NomApporteur'] = $request->input("nom");
                        $carte['PrenomApporteur'] = $request->input("prenom");
                        $carte['rue'] = $request->input("rue");
                        $carte['residances'] = $request->input("residances");
                        $carte['quartier'] = $request->input("quartier");
                        $carte['ville'] = $request->input("ville");
                        $carte['tel'] = $request->input("tel");
                        $carte['ActivationCodeUnique'] = true;
                        $carte['DejaUtliliser'] = false;
                        $validCodes[$f] = $codes_cards[$i];
                        $f++;
                        $carte->save();

                        }else{
                            
                            $fake_codes[$j] = $codes_cards[$i];
                            $j++;
                        }
                    
                   }
            }
        }
        return view('validate',['validCodes'=> $validCodes ,'fake_codes' => $fake_codes]);

    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    // public function addRendomData()
    // {  
        
    //    for( $i=0;$i<2;$i++){
    //     $carte = new Carte;
    //     $random_code = "CC_".rand(100000, 999999)."";
    //     $code_unique = $carte::where('CodeUnique', '=', $random_code)->first();
        
    //     if ($code_unique === null) {

    //         $carte['CodeUnique'] = $random_code;
    //         $carte['Description'] = "Carte Cadeau ";
    //         $carte['NomApporteur'] = " ";       
    //         $carte['PrenomApporteur'] = " ";
    //         $carte['tel'] = " ";
    //         $carte['EntreprisePartenaire'] = " ";
    //         $carte['ville'] = " ";
    //         $carte['EntreprisePartenaire'] = " ";
                // $carte['rue']= " ";
                // $carte['residances'] == " ";
                // $carte['quartier'] = = " ";
    //         $carte['ActivationCodeUnique'] = false;
    //         $carte['MontantMissionRecto'] = 0;
    //         $carte['MontantremiseCo'] = "100% à definir";
    //         $carte['PrixDeVenteCarte'] = "5000 dhs à définir";
    //         $carte['RectoMissionEnvViaCashplus'] = false;
    //         $carte['VenteDesCartesEff'] = false;
    //         $carte['DejaUtliliser'] = true;
    //         $carte['DateExperation'] = date('Y-m-d',mktime(11, 14, 54, 29, 12, 2022));
    //         $carte['NomActivateur'] = "Hamid  ";
    //         $carte->save();
    //     }
           
    //    }
       
       
    // }

    public function addfiles()
    {  
          $cartes = Carte::select('CodeUnique')->get();
        //   dd($cartes);
          foreach ($cartes as $carte) {

            if(Storage::disk('public')->exists("qr_codes/".$carte['CodeUnique'].".eps")) {
                
                echo 'file esxists';
            } else {
                $qr =  QrCode::format('eps')->size(100)->generate($carte['CodeUnique'],'../public/qr_codes/'.$carte['CodeUnique'].'.eps');
                echo 'no file found';
            }
            // 
          }
   
    }

    public function downloadall()
    {   
        // $cartes = Carte::select('CodeUnique')->get();
        // //   dd($cartes);
        //   foreach ($cartes as $carte) {

        //     if(Storage::disk('public')->exists("qr_codes/".$carte['CodeUnique'].".eps")) {
                
        //         echo 'file esxists';
        //     } else {
        //         $qr =  QrCode::format('eps')->size(100)->generate($carte['CodeUnique'],'../public/qr_codes/'.$carte['CodeUnique'].'.eps');
        //         echo 'no file found';
        //     }
        //     // 
        //   }

        $zip = new ZipArchive;
   
        $fileName = 'qr_codes.zip';
   
        if ($zip->open(public_path($fileName), ZipArchive::CREATE) === TRUE)
        {
            $files = File::files(public_path('qr_codes'));
   
            foreach ($files as $key => $value) {
                $relativeNameInZipFile = basename($value);
                $zip->addFile($value, $relativeNameInZipFile);
            }
             
            $zip->close();
        }
    
        return response()->download(public_path($fileName));
    }

    public function dashboardData()
    {
        $carte = new Carte;

        $nbr_cartes_active = count($carte::where('ActivationCodeUnique', '1')->get());
        $nbr_cartes_no_active = count($carte::where('ActivationCodeUnique', '0')->get());
        $nbr_total_des_cartes = $nbr_cartes_active + $nbr_cartes_no_active ;
        $nbr_cartes_utilise_dans_zoho_crm = count($carte::where('DejaUtliliser', '1')->get());  

        $users = DB::table('users')->where('id', '!=', auth()->id())->get();
        $Users_nbr = count(DB::table('users')->where('id', '!=', auth()->id())->get());

        // $users = array($users);

        $users_names = [];

        for ($i=0; $i < $Users_nbr; $i++) { 

            $users_names[$i] = $users[$i]->name;
        }
        $nbr_apporteurs_par_villes = [];

        $nbr_apporteurs_par_villes['Casablanca'] = count($carte->where('NomApporteur', '<>', '')
        ->where('ville', '=', 'casablanca')
        ->get());
        $nbr_apporteurs_par_villes['Rabat'] = count($carte->where('NomApporteur', '<>', '')
        ->where('ville', '=', 'Rabat')
        ->get());
        $nbr_apporteurs_par_villes['Mohemadia'] = count($carte->where('NomApporteur', '<>', '')
        ->where('ville', '=', 'Mohemadia')
        ->get());
        $nbr_apporteurs_par_villes['Kenitra'] = count($carte->where('NomApporteur', '<>', '')
        ->where('ville', '=', 'Kenitra')
        ->get());
        $nbr_apporteurs_par_villes['Agadir'] = count($carte->where('NomApporteur', '<>', '')
        ->where('ville', '=', 'Agadir')
        ->get());
        $nbr_apporteurs_par_villes['Tanger'] = count($carte->where('NomApporteur', '<>', '')
        ->where('ville', '=', 'Agadir')
        ->get());
        $nbr_apporteurs_par_villes['Fes'] = count($carte->where('NomApporteur', '<>', '')
        ->where('ville', '=', 'Fes')
        ->get());
        $nbr_apporteurs_par_villes['Meknes'] = count($carte->where('NomApporteur', '<>', '')
        ->where('ville', '=', 'Meknes')
        ->get());
        $nbr_apporteurs_par_villes['Tetouan'] = count($carte->where('NomApporteur', '<>', '')
        ->where('ville', '=', 'Tetouan')
        ->get());
        $nbr_apporteurs_par_villes['El Jadida'] = count($carte->where('NomApporteur', '<>', '')
        ->where('ville', '=', 'El Jadida')
        ->get());
        $nbr_apporteurs_par_villes['Sale'] = count($carte->where('NomApporteur', '<>', '')
        ->where('ville', '=', 'Sale')
        ->get());
        $nbr_apporteurs_par_villes['Laayoun'] = count($carte->where('NomApporteur', '<>', '')
        ->where('ville', '=', 'Laayoun')
        ->get());
        $nbr_apporteurs_par_villes['Marrakech'] = count($carte->where('NomApporteur', '<>', '')
        ->where('ville', '=', 'Marrakech')
        ->get());

        
        //le nombre des carte active selon le type
        $nbr_cartes_CV_actv=count(DB::table('cartes')
        ->where('Description', '=', 'Carte Vsite')
        ->where('ActivationCodeUnique', '=', 1)
        ->get());
        $nbr_cartes_CPG_actv=count(DB::table('cartes')
        ->where('Description', '=', 'Carte Parinage Gold')
        ->where('ActivationCodeUnique', '=', 1)
        ->get());
        $nbr_cartes_CC_actv=count(DB::table('cartes')
        ->where('Description', '=', 'Carte Cadeau')
        ->where('ActivationCodeUnique', '=', 1)
        ->get());
        $nbr_cartes_CPP_actv=count(DB::table('cartes')
        ->where('Description', '=', 'Carte Parinage Premium')
        ->where('ActivationCodeUnique', '=', 1)
        ->get());
        $nbr_total_carte_actv = $nbr_cartes_CV_actv+$nbr_cartes_CPG_actv+$nbr_cartes_CC_actv+$nbr_cartes_CPP_actv;

        //  dd($nbr_apporteurs_par_villes);
        return view('admin',[

            'nbr_cartes_active' => $nbr_cartes_active ,
            'nbr_cartes_no_active' => $nbr_cartes_no_active ,
            'nbr_total_des_cartes' => $nbr_total_des_cartes ,
            'nbr_cartes_utilise_dans_zoho_crm' => $nbr_cartes_utilise_dans_zoho_crm,
            'users' => $users_names,
            'nbr_apporteurs_par_villes' => $nbr_apporteurs_par_villes,
            'nbr_cartes_CV_actv' => $nbr_cartes_CV_actv,
            'nbr_cartes_CPP_actv' => $nbr_cartes_CPP_actv,
            'nbr_cartes_CPG_actv' => $nbr_cartes_CPG_actv,
            'nbr_cartes_CC_actv' => $nbr_cartes_CC_actv,
            'nbr_total_carte_actv' => $nbr_total_carte_actv
        
        ]);
    }

    
    public function datatable()
    {
        $carte = new Carte;
        
        $apporteurs_data = $carte->where('NomApporteur', '<>', '')->get();
        $nbr_apporteurs = count($apporteurs_data);
        // dd($promoteurs_data[0]['NomApporteur']);

        return view('datatable',[

            'promoteurs_data' => $apporteurs_data,
            'nbr_promoteurs' => $nbr_apporteurs
        ]);
    }
}
