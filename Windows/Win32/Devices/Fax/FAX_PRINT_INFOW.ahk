#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The FAX_PRINT_INFO structure contains the information necessary for the fax server to print a fax transmission. The structure includes sender and recipient data, an optional billing code, and delivery report information. (Unicode)
 * @remarks
 * A fax client application passes the <b>FAX_PRINT_INFO</b> structure in a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxstartprintjoba">FaxStartPrintJob</a> function to start a print job on a specified fax printer. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-printing-a-fax-to-a-device-context">Printing a Fax to a Device Context</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winfax.h header defines FAX_PRINT_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winfax/ns-winfax-fax_print_infow
 * @namespace Windows.Win32.Devices.Fax
 * @charset Unicode
 */
export default struct FAX_PRINT_INFOW {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the size, in bytes, of the <b>FAX_PRINT_INFO</b> structure. The calling application must set this member to <b>sizeof(FAX_PRINT_INFO)</b>. This member is required.
     */
    SizeOfStruct : UInt32

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the user-friendly name that appears in the print spooler.
     */
    DocName : PWSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the name of the recipient of the fax transmission.
     */
    RecipientName : PWSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the fax number of the recipient of the fax transmission. This member is required.
     */
    RecipientNumber : PWSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the name of the sender who initiated the fax transmission.
     */
    SenderName : PWSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the company name of the sender who initiated the fax transmission.
     */
    SenderCompany : PWSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the department name of the sender who initiated the fax transmission.
     */
    SenderDept : PWSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that indicates an application- or server-specific billing code that applies to the fax transmission. The fax server uses the string to generate an entry in the fax event log. Billing codes are optional.
     */
    SenderBillingCode : PWSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Reserved. Must be set to <b>NULL</b>.
     */
    Reserved : PWSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the email address to which the fax server should send the delivery report (DR) or nondelivery report (NDR).
     */
    DrEmailAddress : PWSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * This member is reserved for future use by Microsoft. It must be set to <b>NULL</b>.
     */
    OutputFileName : PWSTR

}
