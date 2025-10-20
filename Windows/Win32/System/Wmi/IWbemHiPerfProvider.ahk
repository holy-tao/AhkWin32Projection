#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables providers to supply refreshable objects and enumerators.
 * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nn-wbemprov-iwbemhiperfprovider
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemHiPerfProvider extends IUnknown{
    /**
     * The interface identifier for IWbemHiPerfProvider
     * @type {Guid}
     */
    static IID => Guid("{49353c93-516b-11d1-aea6-00c04fb68820}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IWbemServices>} pNamespace 
     * @param {PWSTR} wszClass 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<IWbemObjectSink>} pSink 
     * @returns {HRESULT} 
     */
    QueryInstances(pNamespace, wszClass, lFlags, pCtx, pSink) {
        wszClass := wszClass is String ? StrPtr(wszClass) : wszClass

        result := ComCall(3, this, "ptr", pNamespace, "ptr", wszClass, "int", lFlags, "ptr", pCtx, "ptr", pSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWbemServices>} pNamespace 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemRefresher>} ppRefresher 
     * @returns {HRESULT} 
     */
    CreateRefresher(pNamespace, lFlags, ppRefresher) {
        result := ComCall(4, this, "ptr", pNamespace, "int", lFlags, "ptr", ppRefresher, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWbemServices>} pNamespace 
     * @param {Pointer<IWbemObjectAccess>} pTemplate 
     * @param {Pointer<IWbemRefresher>} pRefresher 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pContext 
     * @param {Pointer<IWbemObjectAccess>} ppRefreshable 
     * @param {Pointer<Int32>} plId 
     * @returns {HRESULT} 
     */
    CreateRefreshableObject(pNamespace, pTemplate, pRefresher, lFlags, pContext, ppRefreshable, plId) {
        result := ComCall(5, this, "ptr", pNamespace, "ptr", pTemplate, "ptr", pRefresher, "int", lFlags, "ptr", pContext, "ptr", ppRefreshable, "int*", plId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWbemRefresher>} pRefresher 
     * @param {Integer} lId 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     */
    StopRefreshing(pRefresher, lId, lFlags) {
        result := ComCall(6, this, "ptr", pRefresher, "int", lId, "int", lFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWbemServices>} pNamespace 
     * @param {PWSTR} wszClass 
     * @param {Pointer<IWbemRefresher>} pRefresher 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pContext 
     * @param {Pointer<IWbemHiPerfEnum>} pHiPerfEnum 
     * @param {Pointer<Int32>} plId 
     * @returns {HRESULT} 
     */
    CreateRefreshableEnum(pNamespace, wszClass, pRefresher, lFlags, pContext, pHiPerfEnum, plId) {
        wszClass := wszClass is String ? StrPtr(wszClass) : wszClass

        result := ComCall(7, this, "ptr", pNamespace, "ptr", wszClass, "ptr", pRefresher, "int", lFlags, "ptr", pContext, "ptr", pHiPerfEnum, "int*", plId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWbemServices>} pNamespace 
     * @param {Integer} lNumObjects 
     * @param {Pointer<IWbemObjectAccess>} apObj 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pContext 
     * @returns {HRESULT} 
     */
    GetObjects(pNamespace, lNumObjects, apObj, lFlags, pContext) {
        result := ComCall(8, this, "ptr", pNamespace, "int", lNumObjects, "ptr", apObj, "int", lFlags, "ptr", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
