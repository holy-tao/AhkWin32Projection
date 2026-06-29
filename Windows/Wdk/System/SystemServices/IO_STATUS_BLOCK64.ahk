#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_STATUS_BLOCK64 {
    #StructPack 8

    Status : NTSTATUS

    Information : Int64

    static __New() {
        DefineProp(this.Prototype, 'Pointer', { type: IntPtr, offset: 0 })
        this.DeleteProp("__New")
    }
}
