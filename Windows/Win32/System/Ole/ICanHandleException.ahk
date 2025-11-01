#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class ICanHandleException extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICanHandleException
     * @type {Guid}
     */
    static IID => Guid("{c5598e60-b307-11d1-b27d-006008c3fbfb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CanHandleException"]

    /**
     * 
     * @param {Pointer<EXCEPINFO>} pExcepInfo 
     * @param {Pointer<VARIANT>} pvar 
     * @returns {HRESULT} 
     */
    CanHandleException(pExcepInfo, pvar) {
        result := ComCall(3, this, "ptr", pExcepInfo, "ptr", pvar, "HRESULT")
        return result
    }
}
