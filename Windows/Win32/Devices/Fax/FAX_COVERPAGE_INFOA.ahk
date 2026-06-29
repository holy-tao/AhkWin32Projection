#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

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
 * @charset ANSI
 */
export default struct FAX_COVERPAGE_INFOA {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the size, in bytes, of the <b>FAX_COVERPAGE_INFO</b> structure. The calling application must set this member to <b>sizeof(FAX_COVERPAGE_INFO)</b>.
     */
    SizeOfStruct : UInt32

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the name of the cover page file (.cov) to associate with the received fax document. The string can be the file name of the common cover page file, or it can be the UNC path to a local cover page file.
     */
    CoverPageName : PSTR

    /**
     * Type: <b>BOOL</b>
     * 
     * Specifies a Boolean variable that indicates whether the fax cover page file is stored on the local computer or in the common cover page location. A value of <b>TRUE</b> indicates that the cover page file resides in the common cover page location on the fax server.
     */
    UseServerCoverPage : BOOL

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the name of the recipient of the fax transmission.
     */
    RecName : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the fax number of the recipient of the fax transmission.
     */
    RecFaxNumber : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the company name of the recipient of the fax transmission.
     */
    RecCompany : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the street address of the recipient of the fax transmission.
     */
    RecStreetAddress : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the city of the recipient of the fax transmission.
     */
    RecCity : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the state of the recipient of the fax transmission.
     */
    RecState : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the postal ZIP code of the recipient of the fax transmission.
     */
    RecZip : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the country/region of the recipient of the fax transmission.
     */
    RecCountry : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the title of the recipient of the fax transmission.
     */
    RecTitle : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the department of the recipient of the fax transmission.
     */
    RecDepartment : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the office location of the recipient of the fax transmission.
     */
    RecOfficeLocation : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the home telephone number of the recipient of the fax transmission.
     */
    RecHomePhone : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the office telephone number of the recipient of the fax transmission.
     */
    RecOfficePhone : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the name of the sender who initiated the fax transmission.
     */
    SdrName : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the fax number of the sender who initiated the fax transmission.
     */
    SdrFaxNumber : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the company name of the sender who initiated the fax transmission.
     */
    SdrCompany : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the address of the sender who initiated the fax transmission.
     */
    SdrAddress : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the title of the sender who initiated the fax transmission.
     */
    SdrTitle : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the department name of the sender who initiated the fax transmission.
     */
    SdrDepartment : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the office location of the sender who initiated the fax transmission.
     */
    SdrOfficeLocation : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the home telephone number of the sender who initiated the fax transmission.
     */
    SdrHomePhone : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the office telephone number of the sender who initiated the fax transmission.
     */
    SdrOfficePhone : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that contains the text of a message or note from the sender that pertains to the fax transmission. The text will appear on the cover page.
     */
    Note : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that is the subject line of the fax transmission.
     */
    Subject : PSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a></b>
     * 
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure. The fax server sets this member when it initiates the fax transmission. The time is expressed in local system time.
     */
    TimeSent : SYSTEMTIME

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates the total number of pages in the fax transmission.
     */
    PageCount : UInt32

}
