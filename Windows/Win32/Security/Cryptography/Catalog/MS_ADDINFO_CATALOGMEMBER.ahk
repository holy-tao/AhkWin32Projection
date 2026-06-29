#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPTCATSTORE.ahk" { CRYPTCATSTORE }
#Import ".\CRYPTCATMEMBER.ahk" { CRYPTCATMEMBER }

/**
 * Provides additional information for catalog member subject types.
 * @see https://learn.microsoft.com/windows/win32/api/mssip/ns-mssip-ms_addinfo_catalogmember
 * @namespace Windows.Win32.Security.Cryptography.Catalog
 */
export default struct MS_ADDINFO_CATALOGMEMBER {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbStruct : UInt32

    /**
     * A [CRYPTCATSTORE](/windows/desktop/api/mscat/ns-mscat-cryptcatstore) structure that contains a catalog file store.
     */
    pStore : CRYPTCATSTORE.Ptr

    /**
     * A [CRYPTCATMEMBER](/windows/desktop/api/mscat/ns-mscat-cryptcatmember) structure that contains a catalog member.
     */
    pMember : CRYPTCATMEMBER.Ptr

}
