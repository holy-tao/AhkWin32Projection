#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SCH_CRED_SECRET_CAPI {
    #StructPack 8

    dwType : UInt32

    hProv : IntPtr

}
