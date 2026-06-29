#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Used by the ParseURL function to return the parsed URL. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The shlwapi.h header defines PARSEDURL as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/shlwapi/ns-shlwapi-parsedurla
 * @namespace Windows.Win32.UI.Shell
 * @charset ANSI
 */
export default struct PARSEDURLA {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * [in] The size of the structure, in bytes. The calling application must set this member before calling the <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-parseurla">ParseURL</a> function.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * [out] A pointer to the beginning of the protocol part of the URL.
     */
    pszProtocol : PSTR

    /**
     * Type: <b>UINT</b>
     * 
     * The number of characters in the URL's protocol section.
     */
    cchProtocol : UInt32

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * [out] A pointer to the section of the URL that follows the protocol and colon (':'). For file URLs, the function also skips the leading "//" characters.
     */
    pszSuffix : PSTR

    /**
     * Type: <b>UINT</b>
     * 
     * [out] The number of characters in the URL's suffix.
     */
    cchSuffix : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * [out] A value from the <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/ne-shlwapi-url_scheme">URL_SCHEME</a> enumeration that specifies the URL's scheme.
     */
    nScheme : UInt32

}
