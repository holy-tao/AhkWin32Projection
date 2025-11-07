#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Use this structure to specify one or more ALink names or KLink keywords that you want to search for.
 * @remarks
 * 
 * <ul>
 * <li>ALink name and KLink keyword lookups are case sensitive, and multiple keywords are delimited by a semicolon.</li>
 * <li>If the lookup yields one or more matching topics, the topic titles appear in the Topics Found dialog box.</li>
 * </ul>
 * If the lookup yields no matching topics, <b>HtmlHelp()</b> checks the values of the following <b>HH_AKLINK</b> members to determine what alternative action to take: 
 * 
 * <ul>
 * <li><i>fIndexOnFail</i>. If <i>fIndexOnFail</i> is TRUE, the Index tab is selected in the help window specified in <i>pszWindow</i>, and the keyword specified in <i>pszKeyword</i> is selected in the entry field. </li>
 * <li><i>pszURL</i>. If <i>fIndexOnFail</i> is FALSE, the topic file specified in <i>pszURL</i> appears in the help window specified in <i>pszWindow</i>. </li>
 * <li><i>pszMsgText</i> and <i>pszMsgTitle</i>. If <i>fIndexOnFail</i> is FALSE and <i>pszURL</i> is NULL, a message box appears using the text and caption specified in <i>pszMsgText</i> and <i>pszMsgTitle</i>. </li>
 * </ul>
 * <h3><a id="Used_by"></a><a id="used_by"></a><a id="USED_BY"></a>Used by</h3>
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/htmlhelp/hh-alink-lookup-command">HH_ALINK_LOOKUP</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/htmlhelp/hh-keyword-lookup-command">HH_KEYWORD_LOOKUP</a>
 * </li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//htmlhelp/ns-htmlhelp-hh_aklink
 * @namespace Windows.Win32.Data.HtmlHelp
 * @version v4.0.30319
 */
class HH_AKLINK extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Specifies the size of the structure. This value must always be filled in before passing the structure to the HTML Help API.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * This parameter must be set to FALSE.
     * @type {BOOL}
     */
    fReserved {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Specifies one or more ALink names or KLink keywords to look up. Multiple entries are delimited by a semicolon.
     * @type {Pointer<Integer>}
     */
    pszKeywords {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies the topic file to navigate to if the lookup fails. <i>pszURL</i> refers to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/htmlhelp/about-html-help-urls">valid topic</a> within the specified compiled help (.chm) file and does not support Internet protocols that point to an HTML file.
     * @type {Pointer<Integer>}
     */
    pszUrl {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies the text to display in a message box if the lookup fails and <i>fIndexOnFail</i> is FALSE and <i>pszURL</i> is NULL.
     * @type {Pointer<Integer>}
     */
    pszMsgText {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Specifies the caption of the message box in which the <i>pszMsgText</i> parameter appears.
     * @type {Pointer<Integer>}
     */
    pszMsgTitle {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Specifies the name of the window type in which to display one of the following: 
     * 
     * 
     * <ul>
     * <li>The selected topic, if the lookup yields one or more matching topics.</li>
     * <li>The topic specified in <i>pszURL</i>, if the lookup fails and a topic is specified in <i>pszURL</i>.</li>
     * </ul>
     * The Index tab, if the lookup fails and <i>fIndexOnFail</i> is specified as TRUE.
     * @type {Pointer<Integer>}
     */
    pszWindow {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Specifies whether to display the keyword in the Index tab of the HTML Help Viewer if the lookup fails. The value of <i>pszWindow</i> specifies the Help Viewer.
     * @type {BOOL}
     */
    fIndexOnFail {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }
}
