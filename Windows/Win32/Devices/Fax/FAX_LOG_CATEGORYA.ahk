#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FAX_LOG_CATEGORY structure describes one logging category. (ANSI)
 * @remarks
 * The fax client application passes the <b>FAX_LOG_CATEGORY</b> structure in a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxsetloggingcategoriesa">FaxSetLoggingCategories</a> function to modify the current logging categories for the fax server of interest. If the application calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxgetloggingcategoriesa">FaxGetLoggingCategories</a> function, it returns the current settings in a <b>FAX_LOG_CATEGORY</b> structure. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-managing-logging-categories">Managing Logging Categories</a>.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The winfax.h header defines FAX_LOG_CATEGORY as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winfax/ns-winfax-fax_log_categorya
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 * @charset ANSI
 */
class FAX_LOG_CATEGORYA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is a descriptive name for the logging category.
     * @type {Pointer<Ptr>}
     */
    Name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that is a unique value that identifies a logging category. This member can be one of the following predefined values.
     * @type {Integer}
     */
    Category {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates the current logging level for the logging category. This member can be one of the following predefined logging levels.
     * @type {Integer}
     */
    Level {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
