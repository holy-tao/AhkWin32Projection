#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the old and new path names for each file that was moved, copied, or renamed by the SHFileOperation function. (Unicode)
 * @remarks
 * There are two versions of this structure, an ANSI version (SHFILEOPSTRUCTA) and a Unicode version (SHFILEOPSTRUCTW). The Unicode version is identical to the ANSI version, except that wide character strings (<b>LPCWSTR</b>) are used in place of ANSI character strings (<b>LPCSTR</b>). On Windows 98 and earlier, only the ANSI version is supported. On Microsoft Windows NT 4.0 and later, both the ANSI and Unicode versions of this structure are supported. SHNAMEMAPPINGA and SHNAMEMAPPINGW should never be used directly; the appropriate structure is redefined as <b>SHNAMEMAPPING</b> by the precompiler depending on whether the application is compiled for ANSI or Unicode.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The shellapi.h header defines SHNAMEMAPPING as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shnamemappingw
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 * @charset Unicode
 */
class SHNAMEMAPPINGW extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>LPTSTR</b>
     * 
     * The address of a character buffer that contains the old path name.
     * @type {Pointer<PWSTR>}
     */
    pszOldPath {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * The address of a character buffer that contains the new path name.
     * @type {Pointer<PWSTR>}
     */
    pszNewPath {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>int</b>
     * 
     * The number of characters in <b>pszOldPath</b>.
     * @type {Integer}
     */
    cchOldPath {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b>int</b>
     * 
     * The number of characters in <b>pszNewPath</b>.
     * @type {Integer}
     */
    cchNewPath {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
