#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.System.Com.CallObj
 * @version v4.0.30319
 */
class CallObj {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Instantiates the appropriate interceptor for the specified interface to be intercepted and returns the newly created interceptor.
     * @param {Pointer<Guid>} iidIntercepted A reference to the identifier of the interface for which an interceptor is to be returned.
     * @param {Pointer<IUnknown>} punkOuter If this parameter is <b>NULL</b>, the object is not being created as part of an aggregate. Otherwise, this parameter is a pointer to the aggregate object's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface (the controlling <b>IUnknown</b>).
     * @param {Pointer<Guid>} iid A reference to the identifier of the interface desired on the interceptor.
     * @param {Pointer<Void>} ppv The address of a pointer variable that receives the interface pointer requested in <i>iid</i>. Upon successful return, **<i>ppv</i> contains the requested interceptor pointer.
     * @returns {HRESULT} This function can return the following values. 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function returned successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//callobj/nf-callobj-cogetinterceptor
     * @since windows5.0
     */
    static CoGetInterceptor(iidIntercepted, punkOuter, iid, ppv) {
        result := DllCall("ole32.dll\CoGetInterceptor", "ptr", iidIntercepted, "ptr", punkOuter, "ptr", iid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} iidIntercepted 
     * @param {Pointer<IUnknown>} punkOuter 
     * @param {Pointer<ITypeInfo>} typeInfo 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    static CoGetInterceptorFromTypeInfo(iidIntercepted, punkOuter, typeInfo, iid, ppv) {
        result := DllCall("ole32.dll\CoGetInterceptorFromTypeInfo", "ptr", iidIntercepted, "ptr", punkOuter, "ptr", typeInfo, "ptr", iid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
