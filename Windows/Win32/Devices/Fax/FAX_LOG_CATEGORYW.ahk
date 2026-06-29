#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The FAX_LOG_CATEGORY structure describes one logging category. (Unicode)
 * @remarks
 * The fax client application passes the <b>FAX_LOG_CATEGORY</b> structure in a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxsetloggingcategoriesa">FaxSetLoggingCategories</a> function to modify the current logging categories for the fax server of interest. If the application calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxgetloggingcategoriesa">FaxGetLoggingCategories</a> function, it returns the current settings in a <b>FAX_LOG_CATEGORY</b> structure. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-managing-logging-categories">Managing Logging Categories</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winfax.h header defines FAX_LOG_CATEGORY as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winfax/ns-winfax-fax_log_categoryw
 * @namespace Windows.Win32.Devices.Fax
 * @charset Unicode
 */
export default struct FAX_LOG_CATEGORYW {
    #StructPack 8

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is a descriptive name for the logging category.
     */
    Name : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that is a unique value that identifies a logging category. This member can be one of the following predefined values.
     */
    Category : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates the current logging level for the logging category. This member can be one of the following predefined logging levels.
     */
    Level : UInt32

}
