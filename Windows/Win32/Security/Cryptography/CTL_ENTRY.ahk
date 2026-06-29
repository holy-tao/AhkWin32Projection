#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_ATTRIBUTE.ahk" { CRYPT_ATTRIBUTE }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * An element of a certificate trust list (CTL).
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ctl_entry
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CTL_ENTRY {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> containing a unique identifier of a subject. It can be a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash</a> or any unique byte sequence.
     */
    SubjectIdentifier : CRYPT_INTEGER_BLOB

    /**
     * Count of elements in the <b>rgAttribute</b> member array.
     */
    cAttribute : UInt32

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute">CRYPT_ATTRIBUTE</a> structures, each holding information about the subject.
     */
    rgAttribute : CRYPT_ATTRIBUTE.Ptr

}
