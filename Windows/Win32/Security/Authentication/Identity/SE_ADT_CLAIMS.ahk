#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SE_ADT_CLAIMS {
    #StructPack 8

    Length : UInt32

    Claims : IntPtr

}
