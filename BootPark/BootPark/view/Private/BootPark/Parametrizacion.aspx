 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Parametrizacion.aspx.cs" Inherits="BootPark.view.Private.BootPark.Parametrizacion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Parametrizacion</title>
</head>
<body>
    <ext:ResourceManager runat="server" Theme="Crisp" />
    <form id="Parametrizacion" runat="server">
        <div>
            <ext:Viewport runat="server" Layout="FitLayout">
                <Items>
                    <ext:Panel runat="server">
                        <Items>
                            <ext:Panel runat="server" Region="North" Title="Gestion de Vehiculos" Height="300" Layout="ColumnLayout" Icon="Car">
                                <Items>
                                    <ext:Panel runat="server" Region="West" ColumnWidth=".5" Title="Vehiculo" Padding="10" Icon="CarAdd">
                                        <Items>
                                            <ext:NumberField runat="server" Width="300" FieldLabel="Modelo" Padding="10"  MinValue="1980" MaxValue="2017" AllowDecimals="false" ID="MODELO"/>
                                            <ext:TextField runat="server" Width="300" FieldLabel="Placa" Padding="10" ID="PLACA"/>
                                            <ext:ComboBox runat="server" Width="300" FieldLabel="Marca" ValueField="MARC_ID"  DisplayField="MARC_MARCA" Padding="10" Editable="false" ID="MARCA">
                                                <Store>
                                                    <ext:Store runat="server" ID="SMARCA">
                                                        <Model>
                                                            <ext:Model runat="server">
                                                                <Fields>
                                                                    <ext:ModelField Name="MARC_ID" />
                                                                    <ext:ModelField Name="MARC_MARCA" />
                                                                </Fields>
                                                            </ext:Model>
                                                        </Model>
                                                    </ext:Store>
                                                </Store>
                                            </ext:ComboBox>
                                        </Items>
                                    </ext:Panel>
                                    <ext:Panel runat="server" Region="Center" ColumnWidth=".5" Title="Etiquetas" Padding="10" Icon="Tag">
                                        <Items>
                                            <ext:TextField runat="server" FieldLabel="Codigo" Padding="10" Width="400" EmptyText="Detector de Tags RFID" Disabled="true" ID="TAG"/>
                                            <ext:TextArea runat="server" FieldLabel="Observaciones" Padding="10" Width="400" Height="100" ID="OBSERVACION"/>
                                        </Items>
                                        <BottomBar>
                                            <ext:Toolbar runat="server">
                                                <Items>
                                                    <ext:Button runat="server" Text="Detectar" Icon="FlagChecked">
                                                        <Listeners>
                                                            <Click Handler="App.direct.DetectTag();"/>
                                                        </Listeners>
                                                    </ext:Button>
                                                    <ext:ToolbarFill />
                                                    <ext:Button runat="server" Text="Crear Vehiculo" Icon="Accept">
                                                        <Listeners>
                                                            <Click Handler="
                                                               var observacion = App.OBSERVACION.getValue();
                                                               var marca = App.MARCA.getValue();
                                                               var modelo = App.MODELO.getValue();
                                                               var placa = App.PLACA.getValue();
                                                               var tag = App.TAG.getValue();

                                                               if (observacion != '' && marca != null && modelo != null && placa != null && tag != '') {
                                                                    App.direct.CreateVehicle(observacion, marca, modelo, placa, tag);
                                                               }
                                                            "/>
                                                        </Listeners>
                                                    </ext:Button>
                                                </Items>
                                            </ext:Toolbar>
                                        </BottomBar>
                                    </ext:Panel>
                                </Items>
                            </ext:Panel>
                            <ext:Panel runat="server" Region="Center" Title="Asignación de Tag" Layout="ColumnLayout">
                                 <Items>
                                    <ext:Panel runat="server" Region="West" ColumnWidth=".5" Title="Listado de Vehiculos" Padding="10">
                                        <Items>
                                            <ext:GridPanel runat="server" Layout="FitLayout"  DDGroup="secondGridDDGroup" EnableDragDrop="true">
                                                <Store>
                                                    <ext:Store runat="server" ID="SVEHICLE">
                                                        <Model>
                                                            <ext:Model runat="server">
                                                                <Fields>
                                                                    <ext:ModelField Name="VEHI_ID"/>
                                                                    <ext:ModelField Name="VEHI_PLACA"/>
                                                                    <ext:ModelField Name="VEHI_MODELO"/>
                                                                    <ext:ModelField Name="MARC_MARCA"/>
                                                                    <ext:ModelField Name="ETIQ_CODIGO"/>
                                                                    <ext:ModelField Name="ETIQ_TIPO"/>
                                                                    <ext:ModelField Name="ETIQ_DESCRIPCION"/>
                                                                </Fields>
                                                            </ext:Model>
                                                        </Model>
                                                    </ext:Store>
                                                </Store>
                                                <ColumnModel>
                                                    <Columns>
                                                        <ext:RowNumbererColumn runat="server" />
                                                        <ext:Column runat="server" DataIndex="ETIQ_CODIGO"/>
                                                        <ext:Column runat="server" DataIndex="MARC_MARCA"/>
                                                        <ext:Column runat="server" DataIndex="VEHI_MODELO"/>
                                                        <ext:Column runat="server" DataIndex="VEHI_PLACA"/>
                                                        <ext:Column runat="server" DataIndex="ETIQ_TIPO"/>
                                                        <ext:Column runat="server" DataIndex="ETIQ_DESCRIPCION"/>
                                                    </Columns>
                                                </ColumnModel>
                                                <SelectionModel>
                                                    <ext:RowSelectionModel runat="server" />
                                                </SelectionModel>
                                            </ext:GridPanel>
                                        </Items>
                                    </ext:Panel>
                                    <ext:Panel runat="server" Region="Center" ColumnWidth=".5" Padding="10">
                                        <Items>
                                            <ext:GridPanel runat="server" Title="Lista de Usuarios" Collapsed="false" Collapsible="true" Layout="FitLayout" EnableDragDrop="true">
                                                <Store>
                                                    <ext:Store runat="server" ID="SUSER">
                                                        <Model>
                                                            <ext:Model runat="server">
                                                                <Fields>
                                                                    <ext:ModelField Name="PEGE"/>
                                                                    <ext:ModelField Name="ROL_ID"/>
                                                                    <ext:ModelField Name="IDENTIFICACION"/>
                                                                    <ext:ModelField Name="NOMBRE"/>
                                                                    <ext:ModelField Name="APELLIDO"/>
                                                                    <ext:ModelField Name="ROL_ROL"/>
                                                                </Fields>
                                                            </ext:Model>
                                                        </Model>
                                                    </ext:Store>
                                                </Store>
                                                <ColumnModel>
                                                    <Columns>
                                                        <ext:RowNumbererColumn runat="server" />
                                                        <ext:Column runat="server" DataIndex="IDENTIFICACION"/>
                                                        <ext:Column runat="server" DataIndex="NOMBRE"/>
                                                        <ext:Column runat="server" DataIndex="APELLIDO"/>
                                                        <ext:Column runat="server" DataIndex="ROL_ROL"/>
                                                    </Columns>
                                                </ColumnModel>
                                                <SelectionModel>
                                                    <ext:RowSelectionModel runat="server" />
                                                </SelectionModel>
                                            </ext:GridPanel>
                                            <ext:GridPanel runat="server" Title="Vehiculos Autorizados" Collapsed="true" Collapsible="true" DDGroup="firstGridDDGroup" EnableDragDrop="true">
                                                 <Store>
                                                    <ext:Store runat="server" ID="SAUTORIZACION">
                                                        <Model>
                                                            <ext:Model runat="server">
                                                                <Fields>
                                                                    <ext:ModelField Name="VEHI_ID"/>
                                                                    <ext:ModelField Name="VEHI_PLACA"/>
                                                                    <ext:ModelField Name="VEHI_MODELO"/>
                                                                    <ext:ModelField Name="MARC_MARCA"/>
                                                                    <ext:ModelField Name="ETIQ_CODIGO"/>
                                                                    <ext:ModelField Name="ETIQ_TIPO"/>
                                                                    <ext:ModelField Name="ETIQ_DESCRIPCION"/>
                                                                </Fields>
                                                            </ext:Model>
                                                        </Model>
                                                    </ext:Store>
                                                </Store>
                                                <ColumnModel>
                                                    <Columns>
                                                        <ext:RowNumbererColumn runat="server" />
                                                        <ext:Column runat="server" DataIndex="ETIQ_CODIGO"/>
                                                        <ext:Column runat="server" DataIndex="MARC_MARCA"/>
                                                        <ext:Column runat="server" DataIndex="VEHI_MODELO"/>
                                                        <ext:Column runat="server" DataIndex="VEHI_PLACA"/>
                                                        <ext:Column runat="server" DataIndex="ETIQ_TIPO"/>
                                                        <ext:Column runat="server" DataIndex="ETIQ_DESCRIPCION"/>
                                                    </Columns>
                                                </ColumnModel>
                                                <SelectionModel>
                                                    <ext:RowSelectionModel runat="server" />
                                                </SelectionModel>
                                            </ext:GridPanel>
                                        </Items>
                                    </ext:Panel>
                                </Items>
                            </ext:Panel>
                        </Items>
                    </ext:Panel>
                </Items>
            </ext:Viewport>

            </div>
    </form>
</body>
</html>
