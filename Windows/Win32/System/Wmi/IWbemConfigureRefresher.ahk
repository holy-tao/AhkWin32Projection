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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddObjectByPath", "AddObjectByTemplate", "AddRefresher", "Remove", "AddEnum"]

    /**
     * 
     * @param {IWbemServices} pNamespace 
     * @param {PWSTR} wszPath 
     * @param {Integer} lFlags 
     * @param {IWbemContext} pContext 
     * @param {Pointer<IWbemClassObject>} ppRefreshable 
     * @param {Pointer<Integer>} plId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemconfigurerefresher-addobjectbypath
     */
    AddObjectByPath(pNamespace, wszPath, lFlags, pContext, ppRefreshable, plId) {
        wszPath := wszPath is String ? StrPtr(wszPath) : wszPath

        plIdMarshal := plId is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pNamespace, "ptr", wszPath, "int", lFlags, "ptr", pContext, "ptr*", ppRefreshable, plIdMarshal, plId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWbemServices} pNamespace 
     * @param {IWbemClassObject} pTemplate 
     * @param {Integer} lFlags 
     * @param {IWbemContext} pContext 
     * @param {Pointer<IWbemClassObject>} ppRefreshable 
     * @param {Pointer<Integer>} plId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemconfigurerefresher-addobjectbytemplate
     */
    AddObjectByTemplate(pNamespace, pTemplate, lFlags, pContext, ppRefreshable, plId) {
        plIdMarshal := plId is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pNamespace, "ptr", pTemplate, "int", lFlags, "ptr", pContext, "ptr*", ppRefreshable, plIdMarshal, plId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWbemRefresher} pRefresher 
     * @param {Integer} lFlags 
     * @param {Pointer<Integer>} plId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemconfigurerefresher-addrefresher
     */
    AddRefresher(pRefresher, lFlags, plId) {
        plIdMarshal := plId is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", pRefresher, "int", lFlags, plIdMarshal, plId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lId 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemconfigurerefresher-remove
     */
    Remove(lId, lFlags) {
        result := ComCall(6, this, "int", lId, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWbemServices} pNamespace 
     * @param {PWSTR} wszClassName 
     * @param {Integer} lFlags 
     * @param {IWbemContext} pContext 
     * @param {Pointer<IWbemHiPerfEnum>} ppEnum 
     * @param {Pointer<Integer>} plId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemconfigurerefresher-addenum
     */
    AddEnum(pNamespace, wszClassName, lFlags, pContext, ppEnum, plId) {
        wszClassName := wszClassName is String ? StrPtr(wszClassName) : wszClassName

        plIdMarshal := plId is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "ptr", pNamespace, "ptr", wszClassName, "int", lFlags, "ptr", pContext, "ptr*", ppEnum, plIdMarshal, plId, "HRESULT")
        return result
    }
}
