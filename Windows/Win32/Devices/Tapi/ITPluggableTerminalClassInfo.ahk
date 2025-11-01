#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_name
     */
    get_Name(pName) {
        result := ComCall(7, this, "ptr", pName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pCompany 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_company
     */
    get_Company(pCompany) {
        result := ComCall(8, this, "ptr", pCompany, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_version
     */
    get_Version(pVersion) {
        result := ComCall(9, this, "ptr", pVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTerminalClass 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_terminalclass
     */
    get_TerminalClass(pTerminalClass) {
        result := ComCall(10, this, "ptr", pTerminalClass, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_clsid
     */
    get_CLSID(pCLSID) {
        result := ComCall(11, this, "ptr", pCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pDirection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_direction
     */
    get_Direction(pDirection) {
        result := ComCall(12, this, "int*", pDirection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMediaTypes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itpluggableterminalclassinfo-get_mediatypes
     */
    get_MediaTypes(pMediaTypes) {
        result := ComCall(13, this, "int*", pMediaTypes, "HRESULT")
        return result
    }
}
