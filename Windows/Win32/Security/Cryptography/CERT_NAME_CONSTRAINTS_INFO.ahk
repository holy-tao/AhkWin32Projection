#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_GENERAL_SUBTREE.ahk" { CERT_GENERAL_SUBTREE }

/**
 * The CERT_NAME_CONSTRAINTS_INFO structure contains information about certificates that are specifically permitted or excluded from trust.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_name_constraints_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_NAME_CONSTRAINTS_INFO {
    #StructPack 8

    /**
     * <b>DWORD</b> indicating the number of subtrees in the <b>rgPermittedSubtree</b> array.
     */
    cPermittedSubtree : UInt32

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_general_subtree">CERT_GENERAL_SUBTREE</a> structures, each identifying a permitted certificate name.
     */
    rgPermittedSubtree : CERT_GENERAL_SUBTREE.Ptr

    /**
     * <b>DWORD</b> indicating the number of subtrees in the <b>rgExcludedSubtree</b> array.
     */
    cExcludedSubtree : UInt32

    /**
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_general_subtree">CERT_GENERAL_SUBTREE</a> structures, each identifying an excluded certificate name.
     */
    rgExcludedSubtree : CERT_GENERAL_SUBTREE.Ptr

}
