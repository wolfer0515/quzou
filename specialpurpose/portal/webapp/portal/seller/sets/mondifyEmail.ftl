<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0069)http://seller.dhgate.com/merchant/changeemail.do?dhpath=10008,31,3102
-->
<html xmlns="http://www.w3.org/1999/xhtml">
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- <link href="css/seller.css" rel="stylesheet" type="text/css">
        <link href="css/common20111215.css" rel="stylesheet" type="text/css">
        <link href="css/general_popup_box.css" rel="stylesheet" type="text/css">
        -->
        <script type="text/javascript" async="" src="../seller/js/dc.js">
        </script>
        <script type="text/javascript" src="js/common.js">
        </script>
        <script type="text/javascript" src="../seller/js/menu-common_20111226.js">
        </script>
        <script type="text/javascript" src="../seller/js/jquery.simplemodal2.js">
        </script>
        <title>
            修改邮箱
        </title>
        <meta charset="utf-8">
        <link href="../seller/css/setauthentication.css" rel="stylesheet" type="text/css">
        <link href="../seller/css/general_popup_box(1).css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="js/poplayer.js">
        </script>
        <script type="text/javascript">
            $(document).ready(function() {
                var valPopVid = new Pop({
                    oPop: "valPopVidBox",
                    zIndex: 1001,
                    mode: ["center", "center"],
                    idOpen: "valPopVidBtn",
                    idClose: ["close_popvalVid01", "close_popvalVid02"],
                    cover: true,
                    beCover: false,
                    zIndexCover: 1000,
                    colorCover: "#d8d8d8",
                    opactiyCover: 0.4
                });
            });

            $(document).ready(function() {
                var valPopVid2 = new Pop({
                    oPop: "valPopVidBox2",
                    zIndex: 1001,
                    mode: ["center", "center"],
                    idOpen: "valPopVidBtn2",
                    idClose: ["close_popvalVid03", "close_popvalVid04"],
                    cover: true,
                    beCover: false,
                    zIndexCover: 1000,
                    colorCover: "#d8d8d8",
                    opactiyCover: 0.4
                });
            });

            function openserverurl() {
                if ($('#serverurl').val() == "") {
                    $("#err_mobile2").show();
                    $("#err_mobile2").html("<span class=\"tips-error\">邮箱地址无效</span>");
                } else {
                    window.open($('#serverurl').val());
                }

            }
        </script>
    </head>
    
    <body>
        <!-- Google Analytics Tracking Code - 20111216 - START -->
        <script type="text/javascript">
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-425001-1'], ['_setDomainName', '.dhgate.com'], ['_trackPageview', location.pathname + location.search + escape(location.hash)]); (function() {
                var ga = document.createElement('script');
                ga.type = 'text/javascript';
                ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://': 'http://') + 'stats.g.doubleclick.net/dc.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(ga, s);
            })();
        </script>
        <!-- Google Analytics Tracking Code - 20111216 - END -->
        <script type="text/javascript">
            function know() {
                $("#iKnow").click(function() {

                    $("#mapRemind").hide();
                })
            }
            var sellerAuth = {};
            sellerAuth = {
                alert: function(title, msg, isClose) {
                    $("#auth_alert_content").html(msg);

                    if (title == '') {
                        title = '提示信息';
                    }
                    $("#auth_alert_title").html(title);

                    $("#auth_alert_btn1").hide();
                    $("#auth_alert_btn2").hide();

                    if (isClose) {
                        $("#auth_alert_btn1").show();
                        $("#auth_alert_btn2").show();

                    }
                    $("#auth_alert").modal({
                        close: false
                    });
                },
                checkAuth: function(funcid, catePubId) {
                    var result = true;
                    var url = "http://seller.dhgate.com/mydhgate/sellerauth.do?act=ajaxCheckFuncAuth";
                    jQuery.ajax({
                        url: url,
                        data: {
                            "funcid": funcid,
                            "catePubId": catePubId,
                            "isblank": true
                        },
                        dataType: 'json',
                        async: false,
                        //timeout: 3000,
                        type: 'POST',
                        success: function(data) {
                            if (data.result == '1') {
                                var msg = data.authLimitFuncDto.limitMsg;
                                msg = "您的账户已被“" + msg + "”无法进行此操作";
                                sellerAuth.alert('', msg, true);
                                result = false;
                            }

                        },
                        error: function(xhr, status, error) {}
                    });

                    return result;
                },
                getCurrentModelid: function() {
                    var result = "";
                    result = $("#currentPath").val();
                    if (result) {
                        if (result.indexOf(",") > 0) {
                            var models = result.split(",");
                            result = models[models.length - 1]
                        }
                    }
                    return result;
                }

            }

            //初始化数量信息（站内信，客服留言）
            $(document).ready(function() {
                //产品管理黄金展位菜单提示
                $(document).ready(function(e) {
                    var text = $("#Menu_10004 .nav-directory a:last").text();
                    if (text == "类目黄金展位产品") {
                        $("#Menu_10004 .nav-directory a:last").attr("title", "增值卖家专属的类目黄金展位产品")
                    }
                });

                jQuery.ajax({
                    url: "http://seller.dhgate.com/usr/signin.do?act=ajaxmessage&beforeday=150",
                    data: {
                        "isblank": true
                    },
                    dataType: 'json',
                    async: true,
                    timeout: 10000,
                    type: 'POST',
                    success: function(result) {
                        try {
                            //客服留言-未读
                            if (result.unreadcsmsg > 0) {
                                $("#customServiceMessage").text(result.unreadcsmsg).show(); //页头
                                $("#dhunreadCsMsg1").text(result.unreadcsmsg); //摘要首页 v1 & v2
                                $("#dhunreadCsMsg2").text('(' + result.unreadcsmsg + ')').show(); //横向一级菜单
                                $("#dhunreadCsMsg3").text('(' + result.unreadcsmsg + ')').show(); //左侧二级菜单
                            }
                            //所有站内信-未读
                            if (result.unReadOfAll > 0) {
                                $("#newsletter").text(result.unReadOfAll).show(); //页头
                                $("#dhunreadall1").text(result.unReadOfAll); //摘要首页 v1 & v2
                                $("#dhunreadall1").addClass("a1");
                                $("#dhunreadall2").text('(' + result.unReadOfAll + ')').show(); //横向一级菜单
                                $("#dhunreadall3").text('(' + result.unReadOfAll + ')').show(); //左侧二级菜单
                            }
                            //买家消息-未读
                            if (result.unReadOfSellerBuyer > 0) {
                                $("#dhunReadProduct1").text('(' + result.unReadOfSellerBuyer + ')').show(); //左侧二级菜单
                            }
                            //系统消息-未读
                            if (result.unReadOfSystem > 0) {
                                $("#dhunReadOrder1").text('(' + result.unReadOfSystem + ')').show(); //左侧二级菜单
                            }
                            //平台公告-未读
                            if (result.unReadOfDhgate > 0) {
                                $("#dhunReadPayment1").text('(' + result.unReadOfDhgate + ')').show(); //左侧二级菜单
                            }
                            //垃圾箱-未读
                            if (result.unReadOfDustbin > 0) {
                                $("#dhunReadDustbin1").text('(' + result.unReadOfDustbin + ')').show(); //左侧二级菜单
                            }
                            /*
				var phpmail = result.phpmail;
    	     	var unreadmsg = result.unreadcsmsg;
    			var noReadOrder = result.noReadOrder;
    			var noReadProduct = result.noReadProduct;
    			var noReadSystem = result.noReadSystem;
    			var noReadDustbin = result.noReadDustbin;
    			var noReadPayment = result.noReadPayment;
    			var noReadAll = result.noReadAll;
    			if($("#customServiceMessage").length > 0){
    				$("#customServiceMessage").html(unreadmsg);
    			}
    			if($("#dhunreadCsMsg2").length > 0){
    				$("#dhunreadCsMsg2").html(unreadmsg);
    			}
    			if($("#dhunReadProduct1").length > 0){
    				$("#dhunReadProduct1").html(noReadProduct);
    			}
    			if($("#dhunReadOrder1").length > 0){
    				$("#dhunReadOrder1").html(noReadOrder);
    			}
    			if($("#dhunReadPayment1").length > 0){
    				$("#dhunReadPayment1").html(noReadPayment);
    			}
    			if($("#dhunReadDustbin1").length > 0){
    				$("#dhunReadDustbin1").html(noReadDustbin);
    			}
				*/
                        } catch(err) {}
                    },
                    error: function(xhr, status, error) {}
                });
            });
        </script>
        <table id="auth_alert" class="noshade-pop-table" style="width:420px;display:none;">
            <tbody>
                <tr>
                    <td class="t-lt">
                    </td>
                    <td class="t-mid">
                    </td>
                    <td class="t-ri">
                    </td>
                </tr>
                <tr>
                    <td class="m-lt">
                    </td>
                    <td class="m-mid">
                        <div class="mid-warp">
                            <div class="noshade-pop-content">
                                <div class="noshade-pop-title">
                                    <span id="auth_alert_title">
                                        提示信息
                                    </span>
                                </div>
                                <div class="noshade-pop-inner">
                                    <div class="box1">
                                        <p id="auth_alert_content" class="p1">
                                        </p>
                                        <div class="align-center pop-button" id="auth_alert_btn1" style="display:none;">
                                            <a href="javascript:void(0)" class="greybutton1 margin-r20" onclick="jQuery.modal.close();">
                                                <span>
                                                    确定
                                                </span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="noshade-pop-bot">
                                </div>
                            </div>
                            <a class="noshade-pop-close" href="javascript:void(0)" id="auth_alert_btn2"
                            style="display:none;" onclick="jQuery.modal.close();">
                            </a>
                        </div>
                    </td>
                    <td class="m-ri">
                    </td>
                </tr>
                <tr>
                    <td class="b-lt">
                    </td>
                    <td class="b-mid">
                    </td>
                    <td class="b-ri">
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="content">
            <div class="crumb">
                <a href="http://seller.dhgate.com/mydhgate/index.do">
                    我的DHgate
                </a>
                <span>
                    &gt;
                </span>
                <a href="http://seller.dhgate.com/merchant/changepwd.do?dhpath=10008,31,3101">
                    设置
                </a>
                <span>
                    &gt;
                </span>
                <a href="http://seller.dhgate.com/merchant/changepwd.do?dhpath=10008,31,3101">
                    安全设置
                </a>
                <span>
                    &gt;
                </span>
                <a href="./修改邮箱_files/修改邮箱.htm">
                    修改电子邮件
                </a>
                <span>
                    &gt;
                </span>
                修改邮箱
            </div>
            <div class="layout clearfix">
                <div class="col-main">
                    <div id="right">
                        <div class="col-boxpd col-linebom">
                            <h2>
                                修改邮箱
                            </h2>
                        </div>
                        <div class="setauthtable" id="showemail">
                            <table>
                                <tbody>
                                    <tr>
                                        <td width="40%" class="txttitle">
                                            当前邮箱：
                                        </td>
                                        <td width="60%" class="txtcontent">
                                            <b>
                                                sr_meng@sunvsoft.com
                                            </b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="txttitle">
                                        </td>
                                        <td class="txtcontent">
                                            <span class="btBtn">
                                                <input type="button" value="修改邮箱" id="valPopVidBtn">
                                            </span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="setauthtable" id="modifyemail" style="display:none;">
                            <div class="tips-common" id="err_mobile" style="display:none;">
                            </div>
                            <table>
                                <tbody>
                                    <tr>
                                        <td width="40%" class="txttitle">
                                            当前邮箱：
                                        </td>
                                        <td width="60%" class="txtcontent">
                                            <b>
                                                sr_meng@sunvsoft.com
                                            </b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="txttitle">
                                            新邮箱：
                                        </td>
                                        <td class="txtcontent">
                                            <div>
                                                <input type="text" class="seta-text addwid170" value="" id="email" name="email">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="txttitle">
                                        </td>
                                        <td class="txtcontent">
                                            <span class="btBtn">
                                                <input type="button" value="确认修改" onclick="sendEmail(&#39;email&#39;);"
                                                <="" span="">
                                            </span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="phonepadlr20 clearfix" id="validmail" style="display:none;">
                            <div class="tips-common" id="err_mobile2" style="display:none;">
                            </div>
                            <p>
                                验证信已发送到您的邮箱
                                <span id="premail">
                                </span>
                                ，点击验证信中的“确认修改邮箱”链接，即可完成修改！
                            </p>
                            <input type="hidden" id="serverurl" value="">
                            <p class="marg-t10">
                                <span class="btBtn">
                                    <input type="button" value="登录邮箱完成修改" onclick="openserverurl();">
                                </span>
                            </p>
                            <p class="marg-t10">
                                <b>
                                    还没有收到验证信或验证失败？
                                </b>
                                <br>
                                敦煌网发送给您的验证邮件可能在垃圾邮件或广告邮件中，请您注意查收。
                                <br>
                                为了确保您正常接收验证邮件，建议将Dhgate.com域名邮箱设为信任邮件，如没有请尝试以下方法：
                            </p>
                            <p>
                                <b>
                                    重新发送验证信
                                </b>
                            </p>
                            <p>
                                您修改时填写的邮箱是“
                                <span id="premail2">
                                </span>
                                ”，点此
                                <span class="byBtn">
                                    <input type="button" value="重新发送验证信" onclick="sendEmail(&#39;email&#39;)">
                                </span>
                            </p>
                        </div>
                    </div>
                    <script type="text/javascript" src="js/changeemail.js">
                    </script>
                </div>
				<#-- left bar -->
  				${screens.render("component://portal/widget/SellerScreens.xml#setsLeft")}
            </div>
        </div>
        <div id="valPopVidBox" style="display: none; position: fixed; z-index: 1001; ">
            <table style="width:510px;" class="noshade-pop-table">
                <tbody>
                    <tr>
                        <td class="t-lt">
                        </td>
                        <td class="t-mid">
                        </td>
                        <td class="t-ri">
                        </td>
                    </tr>
                    <tr>
                        <td class="m-lt">
                        </td>
                        <td class="m-mid">
                            <div class="mid-warp">
                                <div class="noshade-pop-content">
                                    <div class="noshade-pop-title">
                                        <span>
                                            验证安全问题：
                                        </span>
                                    </div>
                                    <div class="noshade-pop-inner">
                                        <div class="box1">
                                            <table class="poptable">
                                                <tbody>
                                                    <tr>
                                                        <td width="30%" class="txt-ali-r">
                                                            安全问题：
                                                        </td>
                                                        <td width="70%">
                                                            <select name="question" id="question">
                                                                <option value="我是谁">
                                                                    我是谁
                                                                </option>
                                                                <option value="我是谁？">
                                                                    我是谁？
                                                                </option>
                                                                <option value="我是？">
                                                                    我是？
                                                                </option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="txt-ali-r">
                                                            答案：
                                                        </td>
                                                        <td>
                                                            <input type="text" class="seta-text addwid150" value="" name="answer"
                                                            id="answer">
                                                            <div class="marg-t5">
                                                                <a href="http://seller.dhgate.com/merchant/loseanswer.do?from=email" class="lkundeline">
                                                                    忘记答案点这里
                                                                </a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div class="tips-common">
                                                <span class="tips-error" id="aaerror" style="display:none">
                                                </span>
                                            </div>
                                            <div class="align-center pop-button clearfix">
                                                <span class="yellowBtn valmiddle">
                                                    <input type="button" value="确 认" onclick="javascript: checkanswer();">
                                                </span>
                                                <span class="tourBtn">
                                                    <input type="button" value="取 消" id="close_popvalVid01">
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="noshade-pop-bot">
                                    </div>
                                </div>
                                <a href="javascript:void(0)" class="noshade-pop-close" id="close_popvalVid02">
                                </a>
                            </div>
                        </td>
                        <td class="m-ri">
                        </td>
                    </tr>
                    <tr>
                        <td class="b-lt">
                        </td>
                        <td class="b-mid">
                        </td>
                        <td class="b-ri">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>