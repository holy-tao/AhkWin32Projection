#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IWbemConfigureRefresher interface is used by client code to add enumerators, objects, and nested refreshers into a refresher.
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nn-wbemcli-iwbemconfigurerefresher
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemConfigureRefresher extends IUnknown{
    /**
     * The interface identifier for IWbemConfigureRefresher
     * @type {Guid}
     */
    static IID => Guid("{49353c92-516b-11d1-aea6-00c04fb68820}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IWbemServices>} pNamespace 
     * @param {PWSTR} wszPath 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pContext 
     * @param {Pointer<IWbemClassObject>} ppRefreshable 
     * @param {Pointer<Int32>} plId 
     * @returns {HRESULT} 
     */
    AddObjectByPath(pNamespace, wszPath, lFlags, pContext, ppRefreshable, plId) {
        wszPath := wszPath is String ? StrPtr(wszPath) : wszPath

        result := ComCall(3, this, "ptr", pNamespace, "ptr", wszPath, "int", lFlags, "ptr", pContext, "ptr", ppRefreshable, "int*", plId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWbemServices>} pNamespace 
     * @param {Pointer<IWbemClassObject>} pTemplate 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pContext 
     * @param {Pointer<IWbemClassObject>} ppRefreshable 
     * @param {Pointer<Int32>} plId 
     * @returns {HRESULT} 
     */
    AddObjectByTemplate(pNamespace, pTemplate, lFlags, pContext, ppRefreshable, plId) {
        result := ComCall(4, this, "ptr", pNamespace, "ptr", pTemplate, "int", lFlags, "ptr", pContext, "ptr", ppRefreshable, "int*", plId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWbemRefresher>} pRefresher 
     * @param {Integer} lFlags 
     * @param {Pointer<Int32>} plId 
     * @returns {HRESULT} 
     */
    AddRefresher(pRefresher, lFlags, plId) {
        result := ComCall(5, this, "ptr", pRefresher, "int", lFlags, "int*", plId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lId 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     */
    Remove(lId, lFlags) {
        result := ComCall(6, this, "int", lId, "int", lFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWbemServices>} pNamespace 
     * @param {PWSTR} wszClassName 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pContext 
     * @param {Pointer<IWbemHiPerfEnum>} ppEnum 
     * @param {Pointer<Int32>} plId 
     * @returns {HRESULT} 
     */
    AddEnum(pNamespace, wszClassName, lFlags, pContext, ppEnum, plId) {
        wszClassName := wszClassName is String ? StrPtr(wszClassName) : wszClassName

        result := ComCall(7, this, "ptr", pNamespace, "ptr", wszClassName, "int", lFlags, "ptr", pContext, "ptr", ppEnum, "int*", plId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
