#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.System.IO
 */
export default struct IO_STATUS_BLOCK {
    #StructPack 8

    Status : NTSTATUS

    Information : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'Pointer', { type: IntPtr, offset: 0 })
        this.DeleteProp("__New")
    }
}
