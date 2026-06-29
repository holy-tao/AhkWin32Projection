#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\NMHDR.ahk" { NMHDR }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct GROUPTYPINGCHANGE {
    #StructPack 8

    nmhdr : NMHDR

    fGroupTyping : BOOL

}
