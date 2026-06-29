#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }

/**
 * The WMPContextMenuInfo structure contains data about a context menu command.
 * @remarks
 * This structure is retrieved by a call to <a href="https://docs.microsoft.com/windows/desktop/api/contentpartner/nf-contentpartner-iwmpcontentpartner-getcommands">IWMPContentPartner::GetCommands</a>.
 * @see https://learn.microsoft.com/windows/win32/api/contentpartner/ns-contentpartner-wmpcontextmenuinfo
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct WMPContextMenuInfo {
    #StructPack 8

    /**
     * The ID of the command.
     */
    dwID : UInt32

    /**
     * The menu text to display for the command.
     */
    bstrMenuText : BSTR

    /**
     * The help text to display for the command.
     */
    bstrHelpText : BSTR

}
