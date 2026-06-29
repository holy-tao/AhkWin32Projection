#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct POLICY_DOMAIN_EFS_INFO {
    #StructPack 8

    InfoLength : UInt32

    EfsBlob : IntPtr

}
