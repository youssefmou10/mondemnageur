<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCartesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cartes', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('CodeUnique')->unique();
            $table->text('Description');
            $table->string('NomApporteur');
            $table->string('PrénomApporteur');
            $table->string('EntreprisePartenaire');
            $table->text('Adresse');
            $table->integer('MontantMissionRecto');
            $table->text('MontantremiseCo');
            $table->text('PrixDeVenteCarte');
            $table->boolean('ActivationCodeUnique')->default(false);
            $table->boolean('RectoMissionEnvViaCashplus')->default(false);
            $table->boolean('VenteDesCartesEff')->default(false);
            $table->boolean('DejaUtliliser')->default(false);
            $table->date('DateExperation')->default(date('Y-m-d',mktime(11, 14, 54, 29, 12, 2022)));
            $table->string('NomActivateur');
            $table->string('tel');
            $table->string('ville');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('cartes');
    }
}
