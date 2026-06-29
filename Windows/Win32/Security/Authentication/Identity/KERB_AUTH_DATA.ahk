#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_AUTH_DATA {
    #StructPack 8

    Type : UInt32

    Length : UInt32

    Data : IntPtr

}
