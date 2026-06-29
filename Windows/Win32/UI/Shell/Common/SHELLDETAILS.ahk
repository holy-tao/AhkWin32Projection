#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\STRRET.ahk" { STRRET }

/**
 * Reports detailed information on an item in a Shell folder.
 * @see https://learn.microsoft.com/windows/win32/api/shtypes/ns-shtypes-shelldetails
 * @namespace Windows.Win32.UI.Shell.Common
 */
export default struct SHELLDETAILS {
    #StructPack 8

    /**
     * Type: <b>int</b>
     */
    fmt : Int32

    /**
     * Type: <b>int</b>
     * 
     * The number of average-sized characters in the header.
     */
    cxChar : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-strret">STRRET</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-strret">STRRET</a> structure that includes a string with the requested information. To convert this structure to a string, use <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-strrettobufa">StrRetToBuf</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-strrettostra">StrRetToStr</a>.
     */
    str : STRRET

}
