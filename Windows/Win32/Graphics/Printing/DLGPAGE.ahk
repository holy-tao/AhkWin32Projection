#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct DLGPAGE {
    #StructPack 8

    cbSize : UInt16 := this.Size

    Flags : UInt16

    DlgProc : IntPtr

    pTabName : IntPtr

    IconID : IntPtr

    DlgTemplateID : UInt16

    static __New() {
        DefineProp(this.Prototype, 'hDlgTemplate', { type: HANDLE, offset: 32 })
        this.DeleteProp("__New")
    }
}
