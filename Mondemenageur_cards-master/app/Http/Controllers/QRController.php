<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use SimpleSoftwareIO\QrCode\Facades\QrCode;

class QRController extends Controller
{
    public function generateQrCode() 
    {
        //QrCode::size(500)->generate('CV_12345');
        $codes = [];
         
        for($i=0;$i<4;$i++)
        {
            $codes[$i]["code_unique"] = 'CV_000'.$i.'';
            $codes[$i]["qr_code"] = QrCode::size(100)->generate('CV_000'.$i.'');
            
        }
        // dd($codes);
        return view('qr_code',['codes' => $codes]);
    }
}
