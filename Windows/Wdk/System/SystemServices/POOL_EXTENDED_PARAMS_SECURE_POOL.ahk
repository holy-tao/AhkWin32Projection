#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct POOL_EXTENDED_PARAMS_SECURE_POOL {
    #StructPack 8

    SecurePoolHandle : HANDLE

    Buffer : IntPtr

    Cookie : IntPtr

    SecurePoolFlags : UInt32

}
