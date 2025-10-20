#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class ICanHandleException extends IUnknown{
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
     * 
     * @param {Pointer<EXCEPINFO>} pExcepInfo 
     * @param {Pointer<VARIANT>} pvar 
     * @returns {HRESULT} 
     */
    CanHandleException(pExcepInfo, pvar) {
        result := ComCall(3, this, "ptr", pExcepInfo, "ptr", pvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
