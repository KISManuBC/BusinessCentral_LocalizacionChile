codeunit 50110 Boleta_honorario
{
    TableNo = "Purchase Line";

    trigger OnRun()
    begin

    end;

    procedure CalculateRetention(base: Integer; var retencion: Integer; var retencionPlusBase: Integer; var porcentajeImpuesto: Decimal)
    var
        retencionPorcentaje: Decimal;
        retencionCalculo: Decimal;
    begin
        retencionPorcentaje := porcentajeImpuesto;
        retencionCalculo := (100 - retencionPorcentaje) / 100;
        retencion := ROUND(((base / retencionCalculo) - base), 1, '=');
        retencionPlusBase := retencion + base;
    end;
    //prueba3
}

