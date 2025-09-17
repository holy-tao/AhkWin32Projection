#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used by the ParseURL function to return the parsed URL. (Unicode)
 * @remarks
 * > [!NOTE]
  * > The shlwapi.h header defines PARSEDURL as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/shlwapi/ns-shlwapi-parsedurlw
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 * @charset Unicode
 */
class PARSEDURLW extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * [in] The size of the structure, in bytes. The calling application must set this member before calling the <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-parseurla">ParseURL</a> function.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * [out] A pointer to the beginning of the protocol part of the URL.
     * @type {Pointer<Char>}
     */
    pszProtocol {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The number of characters in the URL's protocol section.
     * @type {Integer}
     */
    cchProtocol {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * [out] A pointer to the section of the URL that follows the protocol and colon (':'). For file URLs, the function also skips the leading "//" characters.
     * @type {Pointer<Char>}
     */
    pszSuffix {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * [out] The number of characters in the URL's suffix.
     * @type {Integer}
     */
    cchSuffix {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * [out] A value from the <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/ne-shlwapi-url_scheme">URL_SCHEME</a> enumeration that specifies the URL's scheme.
     * @type {Integer}
     */
    nScheme {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 40
    }
}
