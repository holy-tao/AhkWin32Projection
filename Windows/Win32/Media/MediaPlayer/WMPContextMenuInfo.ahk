#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WMPContextMenuInfo structure contains data about a context menu command.
 * @remarks
 * This structure is retrieved by a call to <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartner-getcommands">IWMPContentPartner::GetCommands</a>.
 * @see https://learn.microsoft.com/windows/win32/api/contentpartner/ns-contentpartner-wmpcontextmenuinfo
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
     * @type {Pointer<Char>}
     */
    bstrMenuText {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The help text to display for the command.
     * @type {Pointer<Char>}
     */
    bstrHelpText {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
