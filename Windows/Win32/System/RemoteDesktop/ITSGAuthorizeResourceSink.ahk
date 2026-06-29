#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that notify Remote Desktop Gateway (RD Gateway) about the result of an attempt to authorize a resource.
 * @see https://learn.microsoft.com/windows/win32/api/tsgpolicyengine/nn-tsgpolicyengine-itsgauthorizeresourcesink
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITSGAuthorizeResourceSink extends IUnknown {
    /**
     * The interface identifier for ITSGAuthorizeResourceSink
     * @type {Guid}
     */
    static IID := Guid("{feddfcd4-fa12-4435-ae55-7ad1a9779af7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITSGAuthorizeResourceSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnChannelAuthorized : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITSGAuthorizeResourceSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies Remote Desktop Gateway (RD Gateway) about the result of an attempt to authorize a resource.
     * @remarks
     * You can call this method from your implementation of 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/tsgpolicyengine/nf-tsgpolicyengine-itsgpolicyengine-authorizeresource">AuthorizeResource</a>. If 
     *     authorization requires more than 1 second, we recommend launching a separate thread to perform 
     *     authentication.
     * 
     * 
     * For a sample that uses the <b>OnChannelAuthorized</b> method, see the [Remote Desktop Gateway Pluggable Authentication and Authorization](https://github.com/microsoftarchive/msdn-code-gallery-community-m-r/tree/master/Remote%20Desktop%20Gateway%20Pluggable%20Authentication%20and%20Authorization%20Sample) sample.
     * @param {HRESULT} hrIn The result of the authorization attempt. Specify <b>S_OK</b> to indicate that the attempt succeeded. Specify any other value to indicate that the attempt failed.
     * @param {Guid} mainSessionId A unique identifier assigned to the connection request by RD Gateway.
     * @param {Integer} subSessionId A unique identifier assigned to the subsession by RD Gateway. A subsession is a session launched from another session.
     * @param {Pointer<BSTR>} allowedResourceNames A pointer to a <b>BSTR</b> that contains a list of resources that were successfully authorized.
     * @param {Integer} numAllowedResourceNames The number of resources referenced by the <i>allowedResourceNames</i> parameter. If the function succeeds, this parameter must be one or more.
     * @param {Pointer<BSTR>} failedResourceNames A pointer to a <b>BSTR</b> that contains a list of resources that failed authorization.
     * @param {Integer} numFailedResourceNames The number of resources referenced by the <i>failedResourceNames</i> parameter.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tsgpolicyengine/nf-tsgpolicyengine-itsgauthorizeresourcesink-onchannelauthorized
     */
    OnChannelAuthorized(hrIn, mainSessionId, subSessionId, allowedResourceNames, numAllowedResourceNames, failedResourceNames, numFailedResourceNames) {
        result := ComCall(3, this, "int", hrIn, Guid, mainSessionId, "int", subSessionId, BSTR.Ptr, allowedResourceNames, "uint", numAllowedResourceNames, BSTR.Ptr, failedResourceNames, "uint", numFailedResourceNames, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITSGAuthorizeResourceSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnChannelAuthorized := CallbackCreate(GetMethod(implObj, "OnChannelAuthorized"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnChannelAuthorized)
    }
}
