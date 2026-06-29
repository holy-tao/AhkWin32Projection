#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_FILTER_EXTENSION_MATCH.ahk" { CERT_FILTER_EXTENSION_MATCH }

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
export default struct CERT_FILTER_DATA {
    #StructPack 8

    dwSize : UInt32

    cExtensionChecks : UInt32

    arrayExtensionChecks : CERT_FILTER_EXTENSION_MATCH.Ptr

    dwCheckingFlags : UInt32

}
