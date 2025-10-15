#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk

/**
 * The WMPContextMenuInfo structure contains data about a context menu command.
 * @remarks
 * 
  * This structure is retrieved by a call to <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartner-getcommands">IWMPContentPartner::GetCommands</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//contentpartner/ns-contentpartner-wmpcontextmenuinfo
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class WMPContextMenuInfo extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The ID of the command.
     * @type {Integer}
     */
    dwID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The menu text to display for the command.
     * @type {BSTR}
     */
    bstrMenuText{
        get {
            if(!this.HasProp("__bstrMenuText"))
                this.__bstrMenuText := BSTR(this.ptr + 8)
            return this.__bstrMenuText
        }
    }

    /**
     * The help text to display for the command.
     * @type {BSTR}
     */
    bstrHelpText{
        get {
            if(!this.HasProp("__bstrHelpText"))
                this.__bstrHelpText := BSTR(this.ptr + 16)
            return this.__bstrHelpText
        }
    }
}
