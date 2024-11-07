
//Verificar bien si el ID no está utilizado por otra entidad

pageextension 50127 "Page Ext. Folio Compra" extends "Purchase Invoice"
{
    layout
    {
        addfirst(General)
        {

            field(Folio; Rec.Folio)
            {
                ApplicationArea = All;
                ToolTip = 'Localización Chilena. Número de folio de compra';
                Caption = 'N° Folio';
            }

            field(codigoActividad; Rec.codigoActividad)
            {
                ApplicationArea = All;
                ToolTip = 'Localización Chilena. Actividad económica';
                Caption = 'Actividad económica';
                trigger OnLookup(var Text: Text): Boolean
                var
                    ItemRec: Record actividadEconomica;
                begin
                    ItemRec.Reset();
                    if Page.RunModal(Page::"Actividades Económicas", ItemRec) = Action::LookupOK then
                        Rec.codigoActividad := ItemRec.nombre_Actividad;
                end;


            }

            field(listFormaPago; Rec.listFormaPago)
            {
                ApplicationArea = All;
                ToolTip = 'Localización Chilena. Lista de forma de pago';
                Caption = 'Forma de pago';
            }

            field(Id; Rec.Id_Transaccion)
            {
                ApplicationArea = All;
                ToolTip = 'Localización Chilena. Tipo de transacción';
                Caption = 'Tipo de transacción';
                trigger OnLookup(var Text: Text): Boolean
                var
                    ItemRec: Record tipoTransaccion;
                begin
                    ItemRec.Reset();
                    if Page.RunModal(Page::"Tipos de Transacciones", ItemRec) = Action::LookupOK then
                        Rec.Id_Transaccion := ItemRec.descripcionTransaccion;
                end;
            }

            field(DTE; Rec.DTE)
            {
                ApplicationArea = All;
                ToolTip = 'Localización Chilena. Documento Tributario Electrónico (DTE)';
                Caption = 'DTE';
                trigger OnLookup(var Text: Text): Boolean
                var
                    ItemRec: Record tipoDocumentos;
                begin
                    ItemRec.Reset();
                    if Page.RunModal(Page::"Tipos de Documentos", ItemRec) = Action::LookupOK then
                        Rec.DTE := ItemRec.Tipo;
                end;
            }

        }

        addlast(General)
        {
            field(Transportistas; Rec.Transportistas)
            {
                ApplicationArea = All;
                ToolTip = 'Localización Chilena. Transportista';
                Caption = 'Escoger Transportista';

                trigger OnLookup(var Text: Text): Boolean
                var
                    ItemRec: Record "Shipping Agent";
                begin
                    ItemRec.Reset();
                    if Page.RunModal(Page::"Shipping Agents", ItemRec) = Action::LookupOK then
                        Rec.Transportistas := ItemRec.Name;
                end;
            }

            field(rutTransportista; Rec.RUT_Transportista)
            {
                ApplicationArea = All;
                ToolTip = 'Localización Chilena. RUT de transportista';
                Caption = 'RUT Transportista';
            }

            field(DV; Rec.DV)
            {
                ApplicationArea = All;
                ToolTip = 'Localización Chilena. Dígito verificador del RUT del transportista';
            }

            field(patenteTransportista; Rec.patenteTransportista)
            {
                ApplicationArea = All;
                ToolTip = 'Localización Chilena. Patente de transportista';
                Caption = 'Patente de transportista';
            }

            field(Sucursal; Rec.Sucursal)
            {
                ApplicationArea = All;
                ToolTip = 'Localización Chilena. Sucursal';
                Caption = 'Sucursal';
            }
        }
    }
    actions
    {
        addfirst(Processing)
        {
            action("Configurar API")
            {
                ApplicationArea = All;
                Caption = 'Configurar API';
                ToolTip = 'Abrir la página de configuración de la API';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Page.Run(Page::"API Config Lookup");
                end;
            }
        }
    }
}
