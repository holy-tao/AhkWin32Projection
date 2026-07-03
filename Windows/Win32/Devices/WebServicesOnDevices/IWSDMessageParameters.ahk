#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWSDAddress.ahk" { IWSDAddress }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Use this interface to communicate message specific information up and down the protocol stack.
 * @remarks
 * In a request-response message pattern, the parameters also provide a way for the transport to determine where the response message for a given request should be sent. To enable this, the message parameters for a request must always be passed down the stack with the corresponding response.
 * 
 * Since message parameters can be packaged with a request or a response, and can be sent or received, the meaning of the local and remote address depends on the direction the message parameters.
 * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nn-wsdbase-iwsdmessageparameters
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct IWSDMessageParameters extends IUnknown {
    /**
     * The interface identifier for IWSDMessageParameters
     * @type {Guid}
     */
    static IID := Guid("{1fafe8a2-e6fc-4b80-b6cf-b7d45c416d7c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSDMessageParameters interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetLocalAddress    : IntPtr
        SetLocalAddress    : IntPtr
        GetRemoteAddress   : IntPtr
        SetRemoteAddress   : IntPtr
        GetLowerParameters : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSDMessageParameters.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the generic address object representing the local address that received the message.
     * @remarks
     * The caller is responsible for releasing memory allocated to <i>ppAddress</i>.
     * @returns {IWSDAddress} An <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdaddress">IWSDAddress</a> interface that represents the local address that received the message.
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdmessageparameters-getlocaladdress
     */
    GetLocalAddress() {
        result := ComCall(3, this, "ptr*", &ppAddress := 0, "HRESULT")
        return IWSDAddress(ppAddress)
    }

    /**
     * Sets a generic address object representing the source address that should send the message.
     * @param {IWSDAddress} pAddress An <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdaddress">IWSDAddress</a> interface that represents the source address that should send the message.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * Possible return values include, but are not limited to, the following.
     * 
     * 
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
     * Method completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdmessageparameters-setlocaladdress
     */
    SetLocalAddress(pAddress) {
        result := ComCall(4, this, "ptr", pAddress, "HRESULT")
        return result
    }

    /**
     * Retrieves the generic address object representing the remote address from which the message was sent.
     * @remarks
     * The caller is responsible for releasing memory allocated to <i>ppAddress</i>.
     * @returns {IWSDAddress} An <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdaddress">IWSDAddress</a> interface that represents the remote address from which the message was sent.
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdmessageparameters-getremoteaddress
     */
    GetRemoteAddress() {
        result := ComCall(5, this, "ptr*", &ppAddress := 0, "HRESULT")
        return IWSDAddress(ppAddress)
    }

    /**
     * Sets the generic address object representing the remote address to where the message is sent.
     * @param {IWSDAddress} pAddress An <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdaddress">IWSDAddress</a> interface that represents the remote address to where the message is sent.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * Possible return values include, but are not limited to, the following.
     * 
     * 
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
     * Method completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdmessageparameters-setremoteaddress
     */
    SetRemoteAddress(pAddress) {
        result := ComCall(6, this, "ptr", pAddress, "HRESULT")
        return result
    }

    /**
     * Retrieves message parameters from the layer below this layer in the protocol stack.
     * @returns {IWSDMessageParameters} An <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdmessageparameters">IWSDMessageParameters</a> interface that you use to communicate message specific information up and down the protocol stack.
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdmessageparameters-getlowerparameters
     */
    GetLowerParameters() {
        result := ComCall(7, this, "ptr*", &ppTxParams := 0, "HRESULT")
        return IWSDMessageParameters(ppTxParams)
    }

    Query(iid) {
        if (IWSDMessageParameters.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLocalAddress := CallbackCreate(GetMethod(implObj, "GetLocalAddress"), flags, 2)
        this.vtbl.SetLocalAddress := CallbackCreate(GetMethod(implObj, "SetLocalAddress"), flags, 2)
        this.vtbl.GetRemoteAddress := CallbackCreate(GetMethod(implObj, "GetRemoteAddress"), flags, 2)
        this.vtbl.SetRemoteAddress := CallbackCreate(GetMethod(implObj, "SetRemoteAddress"), flags, 2)
        this.vtbl.GetLowerParameters := CallbackCreate(GetMethod(implObj, "GetLowerParameters"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLocalAddress)
        CallbackFree(this.vtbl.SetLocalAddress)
        CallbackFree(this.vtbl.GetRemoteAddress)
        CallbackFree(this.vtbl.SetRemoteAddress)
        CallbackFree(this.vtbl.GetLowerParameters)
    }
}
