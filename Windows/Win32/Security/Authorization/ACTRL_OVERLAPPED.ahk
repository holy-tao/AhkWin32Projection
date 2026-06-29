#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct ACTRL_OVERLAPPED {
    #StructPack 8

    Provider : IntPtr

    Reserved2 : UInt32

    hEvent : HANDLE

    static __New() {
        DefineProp(this.Prototype, 'Reserved1', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
