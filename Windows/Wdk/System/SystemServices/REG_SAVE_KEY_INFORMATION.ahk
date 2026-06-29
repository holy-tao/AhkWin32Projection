#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct REG_SAVE_KEY_INFORMATION {
    #StructPack 8

    Object : IntPtr

    FileHandle : HANDLE

    Format : UInt32

    CallContext : IntPtr

    ObjectContext : IntPtr

    Reserved : IntPtr

}
