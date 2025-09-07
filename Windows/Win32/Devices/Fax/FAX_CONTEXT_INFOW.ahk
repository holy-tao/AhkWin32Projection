#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FAX_CONTEXT_INFO structure contains information about a fax printer device context. The SizeOfStruct member is required. Information for the other members is supplied by a call to the FaxStartPrintJob function. (Unicode)
 * @remarks
 * A fax client application can call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxstartprintjoba">FaxStartPrintJob</a> function to retrieve the handle to a fax printer device context. The function returns the handle in a <b>FAX_CONTEXT_INFO</b> structure. The application must call the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deletedc">DeleteDC</a> function to deallocate the handle to the printer device context. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-printing-a-fax-to-a-device-context">Printing a Fax to a Device Context</a>.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The winfax.h header defines FAX_CONTEXT_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winfax/ns-winfax-fax_context_infow
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 * @charset Unicode
 */
class FAX_CONTEXT_INFOW extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the size, in bytes, of the <b>FAX_CONTEXT_INFO</b> structure. The calling application must set this member to <b>sizeof(FAX_CONTEXT_INFO)</b> before it calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxstartprintjoba">FaxStartPrintJob</a> function.
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>HDC</b>
     * 
     * Handle to a fax printer device context. A call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxstartprintjoba">FaxStartPrintJob</a> function supplies the data for this member.
     * @type {Pointer<Ptr>}
     */
    hDC {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>TCHAR[MAX_COMPUTERNAME_LENGTH+1]</b>
     * 
     * Specifies a variable that contains a null-terminated string that is the fax server name of interest. A call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxstartprintjoba">FaxStartPrintJob</a> function supplies the data for this member. If the fax server is on the local computer, this member will be empty. The client application does not need to fill in this member.
     * @type {String}
     */
    ServerName {
        get => StrGet(this.ptr + 16, 15, "UTF-16")
        set => StrPut(value, this.ptr + 16, 15, "UTF-16")
    }
}
