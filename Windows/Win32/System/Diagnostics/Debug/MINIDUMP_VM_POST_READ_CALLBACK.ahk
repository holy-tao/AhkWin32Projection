#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_VM_POST_READ_CALLBACK {
    #StructPack 8

    Offset : Int64

    Buffer : IntPtr

    Size : UInt32

    Completed : UInt32

    Status : HRESULT

}
