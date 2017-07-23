<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="provaBootstrap._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1><%: Title %>.</h1>
                <h2>Modify this template to jump-start your ASP.NET application.</h2>
            </hgroup>
            <p>
                To learn more about ASP.NET, visit <a href="http://asp.net" title="ASP.NET Website">http://asp.net</a>.
                The page features <mark>videos, tutorials, and samples</mark> to help you get the most from ASP.NET.
                If you have any questions about ASP.NET visit
                <a href="http://forums.asp.net/18.aspx" title="ASP.NET Forum">our forums</a>.
            </p>
        </div>
    </section>
</asp:Content>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2">
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
    <script>
        function show_modal() {
            $('#myModal').modal('show');
        }
        function hide_modal() {
            $('#myModal').modal('hide');
        }
        //$(window).load(function () {
        //    $('#myModal').modal('show');
        //    window.setTimeout(hide_modal, 60000);
        //});
        function closepopup() {
            //   $('#myModal').modal();
            $('#btnprova').click();
            $('.modal-auto-clear').on('shown.bs.modal', function () {
                // if data-timer attribute is set use that, otherwise use default (7000)
                var timer = $(this).data('timer') ? $(this).data('timer') : 7000;
                $(this).delay(timer).fadeOut(200, function () {
                    $(this).modal('hide');
                });
            })
            return false;
        }
        function pageLoad() {
            var mpe = $find("MPE");
            mpe.add_shown(onShown);


        }
        function onShown() {
            var background = $find("MPE")._backgroundElement;
            background.onclick = function () { $find("MPE").hide(); }
        }

    </script>

    <cc1:ModalPopupExtender ID="mdlMsgBox" runat="server" BehaviorID="MPE" PopupControlID="pnlMessageBox" BackgroundCssClass="jsMpeBackground"
        TargetControlID="Button1" >
      <Animations>
      <OnShown>
         <FadeIn Duration="0.5" Fps="40" />
      </OnShown>
      <OnHiding>
         <FadeOut Duration="0.5" Fps="40" />
      </OnHiding>
        </Animations>
    </cc1:ModalPopupExtender>
    <cc1:AnimationExtender ID="popupAnimation" runat="server" TargetControlID="Button1">
        <Animations>
                <OnClick>
                    <Parallel AnimationTarget="pnlMessageBox" 
                    Duration="0.3" Fps="25">
                    <FadeIn />                                        
                    <Move Horizontal="500" Vertical="250"></Move>
                    </Parallel>                   
                </OnClick>
        </Animations>
    </cc1:AnimationExtender>
     <asp:Panel ID="pnlMessageBox" runat="server" CssClass="modalPopup" align="center" Style="display: none">
        This is an ASP.Net AJAX ModalPopupExtender Example<br />
        
    </asp:Panel>

    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Modal Header</h4>
                </div>
                <div class="modal-body">
                    <p>Some text in the modal.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btnprova" class="btn btn-default" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnCloseModal" CssClass="btn btn-default" runat="server" Text="Close & Reopen"
                        OnClick="btnCloseModal_Click" />
                </div>
            </div>
        </div>
    </div>



    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>
    <asp:Button class="btn btn-primary" ID="svsd" runat="server" data-toggle="modal" data-target="#myModal" OnClientClick="return closepopup()" Text="prova" />
       <asp:Button class="btn btn-primary" ID="Button1" runat="server"   Text="provampe" OnClick="Button1_Click" />

     <!-- Modal -->
    <%-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>--%>
</asp:Content>
