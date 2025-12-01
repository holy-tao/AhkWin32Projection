#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * The FAX_COVERPAGE_INFO structure contains data to display on the cover page of a fax transmission. The SizeOfStruct and CoverPageName members are required; other members are optional. (ANSI)
 * @remarks
 * A fax client application passes the <b>FAX_COVERPAGE_INFO</b> structure in a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxprintcoverpagea">FaxPrintCoverPage</a> function. This enables a user to print a personal cover page at the beginning of a fax transmission. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-cover-pages">Cover Pages</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-transmitting-faxes">Transmitting Faxes</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winfax.h header defines FAX_COVERPAGE_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winfax/ns-winfax-fax_coverpage_infoa
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 * @charset ANSI
 */
class FAX_COVERPAGE_INFOA extends Win32Struct
{
    static sizeof => 240

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the size, in bytes, of the <b>FAX_COVERPAGE_INFO</b> structure. The calling application must set this member to <b>sizeof(FAX_COVERPAGE_INFO)</b>.
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the name of the cover page file (.cov) to associate with the received fax document. The string can be the file name of the common cover page file, or it can be the UNC path to a local cover page file.
     * @type {PSTR}
     */
    CoverPageName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Specifies a Boolean variable that indicates whether the fax cover page file is stored on the local computer or in the common cover page location. A value of <b>TRUE</b> indicates that the cover page file resides in the common cover page location on the fax server.
     * @type {BOOL}
     */
    UseServerCoverPage {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the name of the recipient of the fax transmission.
     * @type {PSTR}
     */
    RecName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the fax number of the recipient of the fax transmission.
     * @type {PSTR}
     */
    RecFaxNumber {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the company name of the recipient of the fax transmission.
     * @type {PSTR}
     */
    RecCompany {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the street address of the recipient of the fax transmission.
     * @type {PSTR}
     */
    RecStreetAddress {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the city of the recipient of the fax transmission.
     * @type {PSTR}
     */
    RecCity {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the state of the recipient of the fax transmission.
     * @type {PSTR}
     */
    RecState {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the postal ZIP code of the recipient of the fax transmission.
     * @type {PSTR}
     */
    RecZip {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the country/region of the recipient of the fax transmission.
     * @type {PSTR}
     */
    RecCountry {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the title of the recipient of the fax transmission.
     * @type {PSTR}
     */
    RecTitle {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the department of the recipient of the fax transmission.
     * @type {PSTR}
     */
    RecDepartment {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the office location of the recipient of the fax transmission.
     * @type {PSTR}
     */
    RecOfficeLocation {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the home telephone number of the recipient of the fax transmission.
     * @type {PSTR}
     */
    RecHomePhone {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the office telephone number of the recipient of the fax transmission.
     * @type {PSTR}
     */
    RecOfficePhone {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the name of the sender who initiated the fax transmission.
     * @type {PSTR}
     */
    SdrName {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the fax number of the sender who initiated the fax transmission.
     * @type {PSTR}
     */
    SdrFaxNumber {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the company name of the sender who initiated the fax transmission.
     * @type {PSTR}
     */
    SdrCompany {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the address of the sender who initiated the fax transmission.
     * @type {PSTR}
     */
    SdrAddress {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the title of the sender who initiated the fax transmission.
     * @type {PSTR}
     */
    SdrTitle {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the department name of the sender who initiated the fax transmission.
     * @type {PSTR}
     */
    SdrDepartment {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the office location of the sender who initiated the fax transmission.
     * @type {PSTR}
     */
    SdrOfficeLocation {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the home telephone number of the sender who initiated the fax transmission.
     * @type {PSTR}
     */
    SdrHomePhone {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the office telephone number of the sender who initiated the fax transmission.
     * @type {PSTR}
     */
    SdrOfficePhone {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that contains the text of a message or note from the sender that pertains to the fax transmission. The text will appear on the cover page.
     * @type {PSTR}
     */
    Note {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the subject line of the fax transmission.
     * @type {PSTR}
     */
    Subject {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a></b>
     * 
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure. The fax server sets this member when it initiates the fax transmission. The time is expressed in local system time.
     * @type {SYSTEMTIME}
     */
    TimeSent{
        get {
            if(!this.HasProp("__TimeSent"))
                this.__TimeSent := SYSTEMTIME(216, this)
            return this.__TimeSent
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates the total number of pages in the fax transmission.
     * @type {Integer}
     */
    PageCount {
        get => NumGet(this, 232, "uint")
        set => NumPut("uint", value, this, 232)
    }
}
