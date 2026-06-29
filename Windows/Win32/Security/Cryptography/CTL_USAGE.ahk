#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains an array of object identifiers (OIDs) for Certificate Trust List (CTL) extensions.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ctl_usage
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CTL_USAGE {
    #StructPack 8

    /**
     * Number of elements in the <b>rgpszUsageIdentifier</b> member array.
     */
    cUsageIdentifier : UInt32

    /**
     * Array of object identifiers (OIDs) of CTL extensions.
     */
    rgpszUsageIdentifier : PSTR.Ptr

}
