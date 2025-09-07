#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * The FAX_PRINT_INFO structure contains the information necessary for the fax server to print a fax transmission. The structure includes sender and recipient data, an optional billing code, and delivery report information. (ANSI)
 * @remarks
 * A fax client application passes the <b>FAX_PRINT_INFO</b> structure in a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxstartprintjoba">FaxStartPrintJob</a> function to start a print job on a specified fax printer. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-printing-a-fax-to-a-device-context">Printing a Fax to a Device Context</a>.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The winfax.h header defines FAX_PRINT_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winfax/ns-winfax-fax_print_infoa
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 * @charset ANSI
 */
class FAX_PRINT_INFOA extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the size, in bytes, of the <b>FAX_PRINT_INFO</b> structure. The calling application must set this member to <b>sizeof(FAX_PRINT_INFO)</b>. This member is required.
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the user-friendly name that appears in the print spooler.
     * @type {PSTR}
     */
    DocName{
        get {
            if(!this.HasProp("__DocName"))
                this.__DocName := PSTR(this.ptr + 8)
            return this.__DocName
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the name of the recipient of the fax transmission.
     * @type {PSTR}
     */
    RecipientName{
        get {
            if(!this.HasProp("__RecipientName"))
                this.__RecipientName := PSTR(this.ptr + 16)
            return this.__RecipientName
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the fax number of the recipient of the fax transmission. This member is required.
     * @type {PSTR}
     */
    RecipientNumber{
        get {
            if(!this.HasProp("__RecipientNumber"))
                this.__RecipientNumber := PSTR(this.ptr + 24)
            return this.__RecipientNumber
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the name of the sender who initiated the fax transmission.
     * @type {PSTR}
     */
    SenderName{
        get {
            if(!this.HasProp("__SenderName"))
                this.__SenderName := PSTR(this.ptr + 32)
            return this.__SenderName
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the company name of the sender who initiated the fax transmission.
     * @type {PSTR}
     */
    SenderCompany{
        get {
            if(!this.HasProp("__SenderCompany"))
                this.__SenderCompany := PSTR(this.ptr + 40)
            return this.__SenderCompany
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the department name of the sender who initiated the fax transmission.
     * @type {PSTR}
     */
    SenderDept{
        get {
            if(!this.HasProp("__SenderDept"))
                this.__SenderDept := PSTR(this.ptr + 48)
            return this.__SenderDept
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that indicates an application- or server-specific billing code that applies to the fax transmission. The fax server uses the string to generate an entry in the fax event log. Billing codes are optional.
     * @type {PSTR}
     */
    SenderBillingCode{
        get {
            if(!this.HasProp("__SenderBillingCode"))
                this.__SenderBillingCode := PSTR(this.ptr + 56)
            return this.__SenderBillingCode
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Reserved. Must be set to <b>NULL</b>.
     * @type {PSTR}
     */
    Reserved{
        get {
            if(!this.HasProp("__Reserved"))
                this.__Reserved := PSTR(this.ptr + 64)
            return this.__Reserved
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the email address to which the fax server should send the delivery report (DR) or nondelivery report (NDR).
     * @type {PSTR}
     */
    DrEmailAddress{
        get {
            if(!this.HasProp("__DrEmailAddress"))
                this.__DrEmailAddress := PSTR(this.ptr + 72)
            return this.__DrEmailAddress
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * This member is reserved for future use by Microsoft. It must be set to <b>NULL</b>.
     * @type {PSTR}
     */
    OutputFileName{
        get {
            if(!this.HasProp("__OutputFileName"))
                this.__OutputFileName := PSTR(this.ptr + 80)
            return this.__OutputFileName
        }
    }
}
