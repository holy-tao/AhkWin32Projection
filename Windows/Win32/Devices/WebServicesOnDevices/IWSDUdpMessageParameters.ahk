#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WSDUdpRetransmitParams.ahk" { WSDUdpRetransmitParams }
#Import ".\IWSDMessageParameters.ahk" { IWSDMessageParameters }

/**
 * Use this interface to specify how often WSD repeats the message transmission.
 * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nn-wsdbase-iwsdudpmessageparameters
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct IWSDUdpMessageParameters extends IWSDMessageParameters {
    /**
     * The interface identifier for IWSDUdpMessageParameters
     * @type {Guid}
     */
    static IID := Guid("{9934149f-8f0c-447b-aa0b-73124b0ca7f0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSDUdpMessageParameters interfaces
    */
    struct Vtbl extends IWSDMessageParameters.Vtbl {
        SetRetransmitParams : IntPtr
        GetRetransmitParams : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSDUdpMessageParameters.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the values that WSD uses to determine how often to repeat the message transmission.
     * @remarks
     * If you do not specify these values, WSD sends the message only once.
     * @param {Pointer<WSDUdpRetransmitParams>} pParams Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ns-wsdbase-wsdudpretransmitparams">WSDUdpRetransmitParams</a> structure. The structure contains values that determine how often WSD repeats the message transmission.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following:
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
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpmessageparameters-setretransmitparams
     */
    SetRetransmitParams(pParams) {
        result := ComCall(8, this, WSDUdpRetransmitParams.Ptr, pParams, "HRESULT")
        return result
    }

    /**
     * Retrieves the values that WSD uses to determine how often to repeat the message transmission.
     * @returns {WSDUdpRetransmitParams} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ns-wsdbase-wsdudpretransmitparams">WSDUdpRetransmitParams</a> structure. The structure contains values that determine how often WSD repeats the message transmission.
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpmessageparameters-getretransmitparams
     */
    GetRetransmitParams() {
        pParams := WSDUdpRetransmitParams()
        result := ComCall(9, this, WSDUdpRetransmitParams.Ptr, pParams, "HRESULT")
        return pParams
    }

    Query(iid) {
        if (IWSDUdpMessageParameters.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetRetransmitParams := CallbackCreate(GetMethod(implObj, "SetRetransmitParams"), flags, 2)
        this.vtbl.GetRetransmitParams := CallbackCreate(GetMethod(implObj, "GetRetransmitParams"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetRetransmitParams)
        CallbackFree(this.vtbl.GetRetransmitParams)
    }
}
