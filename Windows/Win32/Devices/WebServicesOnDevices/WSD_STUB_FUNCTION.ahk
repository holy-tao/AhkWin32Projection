#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IWSDServiceMessaging.ahk" { IWSDServiceMessaging }
#Import ".\WSD_EVENT.ahk" { WSD_EVENT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Describes a stub function used to handle an incoming message.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/nc-wsdtypes-wsd_stub_function
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_STUB_FUNCTION {
    value : IntPtr

    __value {
        set {
            if (value is WSD_STUB_FUNCTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IUnknown} server Pointer to the service object that was registered as a handler for messages of this type. Service objects are registered by calling one of the following methods:  <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-iwsddevicehost-registerservice">IWSDDeviceHost::RegisterService</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nf-wsdhost-iwsddevicehost-adddynamicservice">IWSDDeviceHost::AddDynamicService</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nf-wsdclient-iwsdserviceproxy-subscribetooperation">IWSDServiceProxy::SubscribeToOperation</a>.
     * @param {IWSDServiceMessaging} session Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdhost/nn-wsdhost-iwsdservicemessaging">IWSDServiceMessaging</a> object used for sending a fault or message response.
     * @param {Pointer<WSD_EVENT>} event Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_event">WSD_EVENT</a> structure that contains the data for the current request.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(server, session, event) {
        result := DllCall(this.value, "ptr", server, "ptr", session, WSD_EVENT.Ptr, event, "HRESULT")
        return result
    }

    /**
     * A WSD_STUB_FUNCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WSD_STUB_FUNCTION {
        /**
         * Creates a WSD_STUB_FUNCTION pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", WSD_EVENT) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", WSD_EVENT.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
