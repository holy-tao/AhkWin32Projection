#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IIEWebDriverSite extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WindowOperation", "DetachWebdriver", "GetCapabilityValue"]

    /**
     * 
     * @param {Integer} operationCode 
     * @param {Integer} hWnd 
     * @returns {HRESULT} 
     */
    WindowOperation(operationCode, hWnd) {
        result := ComCall(7, this, "uint", operationCode, "uint", hWnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkWD 
     * @returns {HRESULT} 
     */
    DetachWebdriver(pUnkWD) {
        result := ComCall(8, this, "ptr", pUnkWD, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkWD 
     * @param {PWSTR} capName 
     * @param {Pointer<VARIANT>} capValue 
     * @returns {HRESULT} 
     */
    GetCapabilityValue(pUnkWD, capName, capValue) {
        capName := capName is String ? StrPtr(capName) : capName

        result := ComCall(9, this, "ptr", pUnkWD, "ptr", capName, "ptr", capValue, "HRESULT")
        return result
    }
}
