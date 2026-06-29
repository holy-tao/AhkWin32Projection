#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CTL_ENTRY.ahk" { CTL_ENTRY }
#Import ".\CTL_CONTEXT.ahk" { CTL_CONTEXT }

/**
 * The CERT_TRUST_LIST_INFO structure that indicates valid usage of a CTL.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_trust_list_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_TRUST_LIST_INFO {
    #StructPack 8

    /**
     * Size of this structure in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * A pointer to a structure that includes a subject identifier, the count of attributes associated with a CTL, and an array of those attributes.
     */
    pCtlEntry : CTL_ENTRY.Ptr

    /**
     * A pointer to a CTL context.
     */
    pCtlContext : CTL_CONTEXT.Ptr

}
