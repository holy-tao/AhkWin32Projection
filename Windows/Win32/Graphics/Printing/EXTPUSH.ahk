#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FARPROC.ahk" { FARPROC }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\UI\WindowsAndMessaging\DLGPROC.ahk" { DLGPROC }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct EXTPUSH {
    #StructPack 8

    cbSize : UInt16 := this.Size

    Flags : UInt16

    pTitle : IntPtr

    DlgProc : DLGPROC

    IconID : IntPtr

    DlgTemplateID : UInt16

    dwReserved : IntPtr[3]

    static __New() {
        DefineProp(this.Prototype, 'pfnCallBack', { type: FARPROC, offset: 16 })
        DefineProp(this.Prototype, 'hDlgTemplate', { type: HANDLE, offset: 32 })
        this.DeleteProp("__New")
    }
}
