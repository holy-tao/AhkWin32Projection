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
     * 
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     */
    get_Name(pName) {
        result := ComCall(7, this, "ptr", pName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pCompany 
     * @returns {HRESULT} 
     */
    get_Company(pCompany) {
        result := ComCall(8, this, "ptr", pCompany, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVersion 
     * @returns {HRESULT} 
     */
    get_Version(pVersion) {
        result := ComCall(9, this, "ptr", pVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTerminalClass 
     * @returns {HRESULT} 
     */
    get_TerminalClass(pTerminalClass) {
        result := ComCall(10, this, "ptr", pTerminalClass, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pCLSID 
     * @returns {HRESULT} 
     */
    get_CLSID(pCLSID) {
        result := ComCall(11, this, "ptr", pCLSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pDirection 
     * @returns {HRESULT} 
     */
    get_Direction(pDirection) {
        result := ComCall(12, this, "int*", pDirection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pMediaTypes 
     * @returns {HRESULT} 
     */
    get_MediaTypes(pMediaTypes) {
        result := ComCall(13, this, "int*", pMediaTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
