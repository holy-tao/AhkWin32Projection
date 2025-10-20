#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IIEWebDriverSite extends IDispatch{
    /**
     * The interface identifier for IIEWebDriverSite
     * @type {Guid}
     */
    static IID => Guid("{ffb84444-453d-4fbc-9f9d-8db5c471ec75}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Integer} operationCode 
     * @param {Integer} hWnd 
     * @returns {HRESULT} 
     */
    WindowOperation(operationCode, hWnd) {
        result := ComCall(7, this, "uint", operationCode, "uint", hWnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnkWD 
     * @returns {HRESULT} 
     */
    DetachWebdriver(pUnkWD) {
        result := ComCall(8, this, "ptr", pUnkWD, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnkWD 
     * @param {PWSTR} capName 
     * @param {Pointer<VARIANT>} capValue 
     * @returns {HRESULT} 
     */
    GetCapabilityValue(pUnkWD, capName, capValue) {
        capName := capName is String ? StrPtr(capName) : capName

        result := ComCall(9, this, "ptr", pUnkWD, "ptr", capName, "ptr", capValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
