#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Used by clients and providers to access WMI services. The interface is implemented by WMI and WMI providers, and is the primary WMI interface.
 * @remarks
 * 
  * Providers that implement the 
  * <b>IWbemServices</b> interface must follow the documented semantics of each method that they implement; and providers must support the specified error return codes. WMI implements all of the methods, and typically, each provider implements a small subset of the available functionality on the interface. Providers must return WBEM_E_PROVIDER_NOT_CAPABLE for any method that  they do not implement.
  * 
  * All outbound interface pointers from any 
  * <b>IWbemServices</b> method should be initialized to <b>NULL</b> before calling the interface method. For example, 
  * calls to the <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-getobject">IWbemServices::GetObject</a> method return an 
  * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemclassobject">IWbemClassObject</a> interface pointer that should be pre-initialized to <b>NULL</b> before the <b>IWbemServices::GetObject</b> method  call.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nn-wbemcli-iwbemservices
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemServices extends IUnknown{
    /**
     * The interface identifier for IWbemServices
     * @type {Guid}
     */
    static IID => Guid("{9556dc99-828c-11cf-a37e-00aa003240c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BSTR} strNamespace 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<IWbemServices>} ppWorkingNamespace 
     * @param {Pointer<IWbemCallResult>} ppResult 
     * @returns {HRESULT} 
     */
    OpenNamespace(strNamespace, lFlags, pCtx, ppWorkingNamespace, ppResult) {
        strNamespace := strNamespace is String ? BSTR.Alloc(strNamespace).Value : strNamespace

        result := ComCall(3, this, "ptr", strNamespace, "int", lFlags, "ptr", pCtx, "ptr", ppWorkingNamespace, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWbemObjectSink>} pSink 
     * @returns {HRESULT} 
     */
    CancelAsyncCall(pSink) {
        result := ComCall(4, this, "ptr", pSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemObjectSink>} ppResponseHandler 
     * @returns {HRESULT} 
     */
    QueryObjectSink(lFlags, ppResponseHandler) {
        result := ComCall(5, this, "int", lFlags, "ptr", ppResponseHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {BSTR} strObjectPath 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<IWbemClassObject>} ppObject 
     * @param {Pointer<IWbemCallResult>} ppCallResult 
     * @returns {HRESULT} If the function succeeds, and <i>lpvObject</i> is a valid pointer, the return value is the number of bytes stored into the buffer.
     * 
     * If the function succeeds, and <i>lpvObject</i> is <b>NULL</b>, the return value is the number of bytes required to hold the information the function would store into the buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject(strObjectPath, lFlags, pCtx, ppObject, ppCallResult) {
        strObjectPath := strObjectPath is String ? BSTR.Alloc(strObjectPath).Value : strObjectPath

        result := ComCall(6, this, "ptr", strObjectPath, "int", lFlags, "ptr", pCtx, "ptr", ppObject, "ptr", ppCallResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strObjectPath 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<IWbemObjectSink>} pResponseHandler 
     * @returns {HRESULT} 
     */
    GetObjectAsync(strObjectPath, lFlags, pCtx, pResponseHandler) {
        strObjectPath := strObjectPath is String ? BSTR.Alloc(strObjectPath).Value : strObjectPath

        result := ComCall(7, this, "ptr", strObjectPath, "int", lFlags, "ptr", pCtx, "ptr", pResponseHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWbemClassObject>} pObject 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<IWbemCallResult>} ppCallResult 
     * @returns {HRESULT} 
     */
    PutClass(pObject, lFlags, pCtx, ppCallResult) {
        result := ComCall(8, this, "ptr", pObject, "int", lFlags, "ptr", pCtx, "ptr", ppCallResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWbemClassObject>} pObject 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<IWbemObjectSink>} pResponseHandler 
     * @returns {HRESULT} 
     */
    PutClassAsync(pObject, lFlags, pCtx, pResponseHandler) {
        result := ComCall(9, this, "ptr", pObject, "int", lFlags, "ptr", pCtx, "ptr", pResponseHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strClass 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<IWbemCallResult>} ppCallResult 
     * @returns {HRESULT} 
     */
    DeleteClass(strClass, lFlags, pCtx, ppCallResult) {
        strClass := strClass is String ? BSTR.Alloc(strClass).Value : strClass

        result := ComCall(10, this, "ptr", strClass, "int", lFlags, "ptr", pCtx, "ptr", ppCallResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strClass 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<IWbemObjectSink>} pResponseHandler 
     * @returns {HRESULT} 
     */
    DeleteClassAsync(strClass, lFlags, pCtx, pResponseHandler) {
        strClass := strClass is String ? BSTR.Alloc(strClass).Value : strClass

        result := ComCall(11, this, "ptr", strClass, "int", lFlags, "ptr", pCtx, "ptr", pResponseHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strSuperclass 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<IEnumWbemClassObject>} ppEnum 
     * @returns {HRESULT} 
     */
    CreateClassEnum(strSuperclass, lFlags, pCtx, ppEnum) {
        strSuperclass := strSuperclass is String ? BSTR.Alloc(strSuperclass).Value : strSuperclass

        result := ComCall(12, this, "ptr", strSuperclass, "int", lFlags, "ptr", pCtx, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strSuperclass 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<IWbemObjectSink>} pResponseHandler 
     * @returns {HRESULT} 
     */
    CreateClassEnumAsync(strSuperclass, lFlags, pCtx, pResponseHandler) {
        strSuperclass := strSuperclass is String ? BSTR.Alloc(strSuperclass).Value : strSuperclass

        result := ComCall(13, this, "ptr", strSuperclass, "int", lFlags, "ptr", pCtx, "ptr", pResponseHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWbemClassObject>} pInst 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<IWbemCallResult>} ppCallResult 
     * @returns {HRESULT} 
     */
    PutInstance(pInst, lFlags, pCtx, ppCallResult) {
        result := ComCall(14, this, "ptr", pInst, "int", lFlags, "ptr", pCtx, "ptr", ppCallResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWbemClassObject>} pInst 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<IWbemObjectSink>} pResponseHandler 
     * @returns {HRESULT} 
     */
    PutInstanceAsync(pInst, lFlags, pCtx, pResponseHandler) {
        result := ComCall(15, this, "ptr", pInst, "int", lFlags, "ptr", pCtx, "ptr", pResponseHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strObjectPath 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<IWbemCallResult>} ppCallResult 
     * @returns {HRESULT} 
     */
    DeleteInstance(strObjectPath, lFlags, pCtx, ppCallResult) {
        strObjectPath := strObjectPath is String ? BSTR.Alloc(strObjectPath).Value : strObjectPath

        result := ComCall(16, this, "ptr", strObjectPath, "int", lFlags, "ptr", pCtx, "ptr", ppCallResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strObjectPath 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<IWbemObjectSink>} pResponseHandler 
     * @returns {HRESULT} 
     */
    DeleteInstanceAsync(strObjectPath, lFlags, pCtx, pResponseHandler) {
        strObjectPath := strObjectPath is String ? BSTR.Alloc(strObjectPath).Value : strObjectPath

        result := ComCall(17, this, "ptr", strObjectPath, "int", lFlags, "ptr", pCtx, "ptr", pResponseHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strFilter 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<IEnumWbemClassObject>} ppEnum 
     * @returns {HRESULT} 
     */
    CreateInstanceEnum(strFilter, lFlags, pCtx, ppEnum) {
        strFilter := strFilter is String ? BSTR.Alloc(strFilter).Value : strFilter

        result := ComCall(18, this, "ptr", strFilter, "int", lFlags, "ptr", pCtx, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strFilter 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<IWbemObjectSink>} pResponseHandler 
     * @returns {HRESULT} 
     */
    CreateInstanceEnumAsync(strFilter, lFlags, pCtx, pResponseHandler) {
        strFilter := strFilter is String ? BSTR.Alloc(strFilter).Value : strFilter

        result := ComCall(19, this, "ptr", strFilter, "int", lFlags, "ptr", pCtx, "ptr", pResponseHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strQueryLanguage 
     * @param {BSTR} strQuery 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<IEnumWbemClassObject>} ppEnum 
     * @returns {HRESULT} 
     */
    ExecQuery(strQueryLanguage, strQuery, lFlags, pCtx, ppEnum) {
        strQueryLanguage := strQueryLanguage is String ? BSTR.Alloc(strQueryLanguage).Value : strQueryLanguage
        strQuery := strQuery is String ? BSTR.Alloc(strQuery).Value : strQuery

        result := ComCall(20, this, "ptr", strQueryLanguage, "ptr", strQuery, "int", lFlags, "ptr", pCtx, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strQueryLanguage 
     * @param {BSTR} strQuery 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<IWbemObjectSink>} pResponseHandler 
     * @returns {HRESULT} 
     */
    ExecQueryAsync(strQueryLanguage, strQuery, lFlags, pCtx, pResponseHandler) {
        strQueryLanguage := strQueryLanguage is String ? BSTR.Alloc(strQueryLanguage).Value : strQueryLanguage
        strQuery := strQuery is String ? BSTR.Alloc(strQuery).Value : strQuery

        result := ComCall(21, this, "ptr", strQueryLanguage, "ptr", strQuery, "int", lFlags, "ptr", pCtx, "ptr", pResponseHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strQueryLanguage 
     * @param {BSTR} strQuery 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<IEnumWbemClassObject>} ppEnum 
     * @returns {HRESULT} 
     */
    ExecNotificationQuery(strQueryLanguage, strQuery, lFlags, pCtx, ppEnum) {
        strQueryLanguage := strQueryLanguage is String ? BSTR.Alloc(strQueryLanguage).Value : strQueryLanguage
        strQuery := strQuery is String ? BSTR.Alloc(strQuery).Value : strQuery

        result := ComCall(22, this, "ptr", strQueryLanguage, "ptr", strQuery, "int", lFlags, "ptr", pCtx, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strQueryLanguage 
     * @param {BSTR} strQuery 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<IWbemObjectSink>} pResponseHandler 
     * @returns {HRESULT} 
     */
    ExecNotificationQueryAsync(strQueryLanguage, strQuery, lFlags, pCtx, pResponseHandler) {
        strQueryLanguage := strQueryLanguage is String ? BSTR.Alloc(strQueryLanguage).Value : strQueryLanguage
        strQuery := strQuery is String ? BSTR.Alloc(strQuery).Value : strQuery

        result := ComCall(23, this, "ptr", strQueryLanguage, "ptr", strQuery, "int", lFlags, "ptr", pCtx, "ptr", pResponseHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strObjectPath 
     * @param {BSTR} strMethodName 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<IWbemClassObject>} pInParams 
     * @param {Pointer<IWbemClassObject>} ppOutParams 
     * @param {Pointer<IWbemCallResult>} ppCallResult 
     * @returns {HRESULT} 
     */
    ExecMethod(strObjectPath, strMethodName, lFlags, pCtx, pInParams, ppOutParams, ppCallResult) {
        strObjectPath := strObjectPath is String ? BSTR.Alloc(strObjectPath).Value : strObjectPath
        strMethodName := strMethodName is String ? BSTR.Alloc(strMethodName).Value : strMethodName

        result := ComCall(24, this, "ptr", strObjectPath, "ptr", strMethodName, "int", lFlags, "ptr", pCtx, "ptr", pInParams, "ptr", ppOutParams, "ptr", ppCallResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strObjectPath 
     * @param {BSTR} strMethodName 
     * @param {Integer} lFlags 
     * @param {Pointer<IWbemContext>} pCtx 
     * @param {Pointer<IWbemClassObject>} pInParams 
     * @param {Pointer<IWbemObjectSink>} pResponseHandler 
     * @returns {HRESULT} 
     */
    ExecMethodAsync(strObjectPath, strMethodName, lFlags, pCtx, pInParams, pResponseHandler) {
        strObjectPath := strObjectPath is String ? BSTR.Alloc(strObjectPath).Value : strObjectPath
        strMethodName := strMethodName is String ? BSTR.Alloc(strMethodName).Value : strMethodName

        result := ComCall(25, this, "ptr", strObjectPath, "ptr", strMethodName, "int", lFlags, "ptr", pCtx, "ptr", pInParams, "ptr", pResponseHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
