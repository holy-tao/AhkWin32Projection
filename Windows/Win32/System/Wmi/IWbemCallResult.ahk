#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Used for semisynchronous calls of the IWbemServices interface. When making such calls, the called IWbemServices method returns immediately, along with an IWbemCallResult object.
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nn-wbemcli-iwbemcallresult
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemCallResult extends IUnknown{
    /**
     * The interface identifier for IWbemCallResult
     * @type {Guid}
     */
    static IID => Guid("{44aca675-e8fc-11d0-a07c-00c04fb68820}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} lTimeout 
     * @param {Pointer<IWbemClassObject>} ppResultObject 
     * @returns {HRESULT} 
     */
    GetResultObject(lTimeout, ppResultObject) {
        result := ComCall(3, this, "int", lTimeout, "ptr", ppResultObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lTimeout 
     * @param {Pointer<BSTR>} pstrResultString 
     * @returns {HRESULT} 
     */
    GetResultString(lTimeout, pstrResultString) {
        result := ComCall(4, this, "int", lTimeout, "ptr", pstrResultString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lTimeout 
     * @param {Pointer<IWbemServices>} ppServices 
     * @returns {HRESULT} 
     */
    GetResultServices(lTimeout, ppServices) {
        result := ComCall(5, this, "int", lTimeout, "ptr", ppServices, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lTimeout 
     * @param {Pointer<Int32>} plStatus 
     * @returns {HRESULT} 
     */
    GetCallStatus(lTimeout, plStatus) {
        result := ComCall(6, this, "int", lTimeout, "int*", plStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
