#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_EXTENSION.ahk" { CERT_EXTENSION }

/**
 * The CERT_EXTENSIONS structure contains an array of extensions.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_extensions
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_EXTENSIONS {
    #StructPack 8

    /**
     * Number of elements in the array <b>rgExtension</b>.
     */
    cExtension : UInt32

    /**
     * Array of structures, each holding information of type <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extension">CERT_EXTENSION</a> about a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate</a> or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">CRL</a>.
     */
    rgExtension : CERT_EXTENSION.Ptr

}
