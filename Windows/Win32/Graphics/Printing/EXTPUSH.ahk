#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct EXTPUSH {
    #StructPack 8

    cbSize : UInt16 := this.Size

    Flags : UInt16

    pTitle : IntPtr

    DlgProc : IntPtr

    IconID : IntPtr

    DlgTemplateID : UInt16

    dwReserved : IntPtr[3]

    static __New() {
        DefineProp(this.Prototype, 'pfnCallBack', { type: IntPtr, offset: 16 })
        DefineProp(this.Prototype, 'hDlgTemplate', { type: HANDLE, offset: 32 })
        this.DeleteProp("__New")
    }
}
