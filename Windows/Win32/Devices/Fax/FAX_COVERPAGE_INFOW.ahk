#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * The FAX_COVERPAGE_INFO structure contains data to display on the cover page of a fax transmission. The SizeOfStruct and CoverPageName members are required; other members are optional.
 * @remarks
 * 
  * A fax client application passes the <b>FAX_COVERPAGE_INFO</b> structure in a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxprintcoverpagea">FaxPrintCoverPage</a> function. This enables a user to print a personal cover page at the beginning of a fax transmission. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-cover-pages">Cover Pages</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-transmitting-faxes">Transmitting Faxes</a>.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The winfax.h header defines FAX_COVERPAGE_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winfax/ns-winfax-fax_coverpage_infow
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 * @charset Unicode
 */
class FAX_COVERPAGE_INFOW extends Win32Struct
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
     * @type {PWSTR}
     */
    CoverPageName{
        get {
            if(!this.HasProp("__CoverPageName"))
                this.__CoverPageName := PWSTR(this.ptr + 8)
            return this.__CoverPageName
        }
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Specifies a Boolean variable that indicates whether the fax cover page file is stored on the local computer or in the common cover page location. A value of <b>TRUE</b> indicates that the cover page file resides in the common cover page location on the fax server.
     * @type {BOOL}
     */
    UseServerCoverPage{
        get {
            if(!this.HasProp("__UseServerCoverPage"))
                this.__UseServerCoverPage := BOOL(this.ptr + 16)
            return this.__UseServerCoverPage
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the name of the recipient of the fax transmission.
     * @type {PWSTR}
     */
    RecName{
        get {
            if(!this.HasProp("__RecName"))
                this.__RecName := PWSTR(this.ptr + 24)
            return this.__RecName
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the fax number of the recipient of the fax transmission.
     * @type {PWSTR}
     */
    RecFaxNumber{
        get {
            if(!this.HasProp("__RecFaxNumber"))
                this.__RecFaxNumber := PWSTR(this.ptr + 32)
            return this.__RecFaxNumber
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the company name of the recipient of the fax transmission.
     * @type {PWSTR}
     */
    RecCompany{
        get {
            if(!this.HasProp("__RecCompany"))
                this.__RecCompany := PWSTR(this.ptr + 40)
            return this.__RecCompany
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the street address of the recipient of the fax transmission.
     * @type {PWSTR}
     */
    RecStreetAddress{
        get {
            if(!this.HasProp("__RecStreetAddress"))
                this.__RecStreetAddress := PWSTR(this.ptr + 48)
            return this.__RecStreetAddress
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the city of the recipient of the fax transmission.
     * @type {PWSTR}
     */
    RecCity{
        get {
            if(!this.HasProp("__RecCity"))
                this.__RecCity := PWSTR(this.ptr + 56)
            return this.__RecCity
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the state of the recipient of the fax transmission.
     * @type {PWSTR}
     */
    RecState{
        get {
            if(!this.HasProp("__RecState"))
                this.__RecState := PWSTR(this.ptr + 64)
            return this.__RecState
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the postal ZIP code of the recipient of the fax transmission.
     * @type {PWSTR}
     */
    RecZip{
        get {
            if(!this.HasProp("__RecZip"))
                this.__RecZip := PWSTR(this.ptr + 72)
            return this.__RecZip
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the country/region of the recipient of the fax transmission.
     * @type {PWSTR}
     */
    RecCountry{
        get {
            if(!this.HasProp("__RecCountry"))
                this.__RecCountry := PWSTR(this.ptr + 80)
            return this.__RecCountry
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the title of the recipient of the fax transmission.
     * @type {PWSTR}
     */
    RecTitle{
        get {
            if(!this.HasProp("__RecTitle"))
                this.__RecTitle := PWSTR(this.ptr + 88)
            return this.__RecTitle
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the department of the recipient of the fax transmission.
     * @type {PWSTR}
     */
    RecDepartment{
        get {
            if(!this.HasProp("__RecDepartment"))
                this.__RecDepartment := PWSTR(this.ptr + 96)
            return this.__RecDepartment
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the office location of the recipient of the fax transmission.
     * @type {PWSTR}
     */
    RecOfficeLocation{
        get {
            if(!this.HasProp("__RecOfficeLocation"))
                this.__RecOfficeLocation := PWSTR(this.ptr + 104)
            return this.__RecOfficeLocation
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the home telephone number of the recipient of the fax transmission.
     * @type {PWSTR}
     */
    RecHomePhone{
        get {
            if(!this.HasProp("__RecHomePhone"))
                this.__RecHomePhone := PWSTR(this.ptr + 112)
            return this.__RecHomePhone
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the office telephone number of the recipient of the fax transmission.
     * @type {PWSTR}
     */
    RecOfficePhone{
        get {
            if(!this.HasProp("__RecOfficePhone"))
                this.__RecOfficePhone := PWSTR(this.ptr + 120)
            return this.__RecOfficePhone
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the name of the sender who initiated the fax transmission.
     * @type {PWSTR}
     */
    SdrName{
        get {
            if(!this.HasProp("__SdrName"))
                this.__SdrName := PWSTR(this.ptr + 128)
            return this.__SdrName
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the fax number of the sender who initiated the fax transmission.
     * @type {PWSTR}
     */
    SdrFaxNumber{
        get {
            if(!this.HasProp("__SdrFaxNumber"))
                this.__SdrFaxNumber := PWSTR(this.ptr + 136)
            return this.__SdrFaxNumber
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the company name of the sender who initiated the fax transmission.
     * @type {PWSTR}
     */
    SdrCompany{
        get {
            if(!this.HasProp("__SdrCompany"))
                this.__SdrCompany := PWSTR(this.ptr + 144)
            return this.__SdrCompany
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the address of the sender who initiated the fax transmission.
     * @type {PWSTR}
     */
    SdrAddress{
        get {
            if(!this.HasProp("__SdrAddress"))
                this.__SdrAddress := PWSTR(this.ptr + 152)
            return this.__SdrAddress
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the title of the sender who initiated the fax transmission.
     * @type {PWSTR}
     */
    SdrTitle{
        get {
            if(!this.HasProp("__SdrTitle"))
                this.__SdrTitle := PWSTR(this.ptr + 160)
            return this.__SdrTitle
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the department name of the sender who initiated the fax transmission.
     * @type {PWSTR}
     */
    SdrDepartment{
        get {
            if(!this.HasProp("__SdrDepartment"))
                this.__SdrDepartment := PWSTR(this.ptr + 168)
            return this.__SdrDepartment
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the office location of the sender who initiated the fax transmission.
     * @type {PWSTR}
     */
    SdrOfficeLocation{
        get {
            if(!this.HasProp("__SdrOfficeLocation"))
                this.__SdrOfficeLocation := PWSTR(this.ptr + 176)
            return this.__SdrOfficeLocation
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the home telephone number of the sender who initiated the fax transmission.
     * @type {PWSTR}
     */
    SdrHomePhone{
        get {
            if(!this.HasProp("__SdrHomePhone"))
                this.__SdrHomePhone := PWSTR(this.ptr + 184)
            return this.__SdrHomePhone
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the office telephone number of the sender who initiated the fax transmission.
     * @type {PWSTR}
     */
    SdrOfficePhone{
        get {
            if(!this.HasProp("__SdrOfficePhone"))
                this.__SdrOfficePhone := PWSTR(this.ptr + 192)
            return this.__SdrOfficePhone
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that contains the text of a message or note from the sender that pertains to the fax transmission. The text will appear on the cover page.
     * @type {PWSTR}
     */
    Note{
        get {
            if(!this.HasProp("__Note"))
                this.__Note := PWSTR(this.ptr + 200)
            return this.__Note
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the subject line of the fax transmission.
     * @type {PWSTR}
     */
    Subject{
        get {
            if(!this.HasProp("__Subject"))
                this.__Subject := PWSTR(this.ptr + 208)
            return this.__Subject
        }
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
                this.__TimeSent := SYSTEMTIME(this.ptr + 216)
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
