#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\UI\WindowsAndMessaging\HICON.ahk" { HICON }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PROPSHEETUI_INFO_HEADER {
    #StructPack 8

    cbSize : UInt16 := this.Size

    Flags : UInt16

    pTitle : IntPtr

    hWndParent : HWND

    hInst : HINSTANCE

    hIcon : HICON

    static __New() {
        DefineProp(this.Prototype, 'IconID', { type: IntPtr, offset: 32 })
        this.DeleteProp("__New")
    }
}
