#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITPluggableTerminalClassInfo interface exposes methods that allow the application to retrieve information concerning a pluggable terminal.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itpluggableterminalclassinfo
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITPluggableTerminalClassInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITPluggableTerminalClassInfo
     * @type {Guid}
     */
    static IID => Guid("{41757f4a-cf09-4b34-bc96-0a79d2390076}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Company", "get_Version", "get_TerminalClass", "get_CLSID", "get_Direction", "get_MediaTypes"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    Company {
        get => this.get_Company()
    }

    /**
     * @type {BSTR} 
     */
    Version {
        get => this.get_Version()
    }

    /**
     * @type {BSTR} 
     */
    TerminalClass {
        get => this.get_TerminalClass()
    }

    /**
     * @type {BSTR} 
     */
    CLSID {
        get => this.get_CLSID()
    }

    /**
     * @type {Integer} 
     */
    Direction {
        get => this.get_Direction()
    }

    /**
     * @type {Integer} 
     */
    MediaTypes {
        get => this.get_MediaTypes()
    }

    /**
     * The get_Name method gets the terminal's friendly name.
     * @returns {BSTR} The <b>BSTR</b> representation of the terminal's friendly name. The <b>BSTR</b> is allocated using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. The <b>BSTR</b> argument should be deallocated by the client.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_name
     */
    get_Name() {
        pName := BSTR()
        result := ComCall(7, this, "ptr", pName, "HRESULT")
        return pName
    }

    /**
     * The get_Company method gets the name of the company that issued this pluggable terminal.
     * @returns {BSTR} The <b>BSTR</b> representation of the terminal's company name. The <b>BSTR</b> is allocated using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. The <b>BSTR</b> argument should be deallocated by the client.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_company
     */
    get_Company() {
        pCompany := BSTR()
        result := ComCall(8, this, "ptr", pCompany, "HRESULT")
        return pCompany
    }

    /**
     * The get_Version method gets the terminal version.
     * @returns {BSTR} The <b>BSTR</b> representation of the terminal version. The <b>BSTR</b> is allocated using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. The <b>BSTR</b> argument should be deallocated by the client.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_version
     */
    get_Version() {
        pVersion := BSTR()
        result := ComCall(9, this, "ptr", pVersion, "HRESULT")
        return pVersion
    }

    /**
     * The get_TerminalClass method gets the terminal's terminal class.
     * @returns {BSTR} The <b>BSTR</b> representation of the terminal's 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/terminal-class">terminal class</a>. The <b>BSTR</b> is allocated using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. It should be deallocated by the client.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_terminalclass
     */
    get_TerminalClass() {
        pTerminalClass := BSTR()
        result := ComCall(10, this, "ptr", pTerminalClass, "HRESULT")
        return pTerminalClass
    }

    /**
     * The get_CLSID method gets the CLSID used to CoCreateInstance the terminal.
     * @returns {BSTR} The <b>BSTR</b> representation of the CLSID. The <b>BSTR</b> is allocated using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. The <b>BSTR</b> argument should be deallocated by the client.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_clsid
     */
    get_CLSID() {
        pCLSID := BSTR()
        result := ComCall(11, this, "ptr", pCLSID, "HRESULT")
        return pCLSID
    }

    /**
     * The get_Direction method gets the direction supported by the terminal.
     * @returns {Integer} The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-terminal_direction">TERMINAL_DIRECTION</a> descriptor for the direction supported by the terminal.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_direction
     */
    get_Direction() {
        result := ComCall(12, this, "int*", &pDirection := 0, "HRESULT")
        return pDirection
    }

    /**
     * The get_MediaTypes method gets the media types supported by the terminal.
     * @returns {Integer} Bitwise ORed list of 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">media types</a> supported by the terminal.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_mediatypes
     */
    get_MediaTypes() {
        result := ComCall(13, this, "int*", &pMediaTypes := 0, "HRESULT")
        return pMediaTypes
    }
}
