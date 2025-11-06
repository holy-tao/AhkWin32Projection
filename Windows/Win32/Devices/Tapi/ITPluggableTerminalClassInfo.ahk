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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_name
     */
    get_Name() {
        pName := BSTR()
        result := ComCall(7, this, "ptr", pName, "HRESULT")
        return pName
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_company
     */
    get_Company() {
        pCompany := BSTR()
        result := ComCall(8, this, "ptr", pCompany, "HRESULT")
        return pCompany
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_version
     */
    get_Version() {
        pVersion := BSTR()
        result := ComCall(9, this, "ptr", pVersion, "HRESULT")
        return pVersion
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_terminalclass
     */
    get_TerminalClass() {
        pTerminalClass := BSTR()
        result := ComCall(10, this, "ptr", pTerminalClass, "HRESULT")
        return pTerminalClass
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_clsid
     */
    get_CLSID() {
        pCLSID := BSTR()
        result := ComCall(11, this, "ptr", pCLSID, "HRESULT")
        return pCLSID
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_direction
     */
    get_Direction() {
        result := ComCall(12, this, "int*", &pDirection := 0, "HRESULT")
        return pDirection
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_mediatypes
     */
    get_MediaTypes() {
        result := ComCall(13, this, "int*", &pMediaTypes := 0, "HRESULT")
        return pMediaTypes
    }
}
