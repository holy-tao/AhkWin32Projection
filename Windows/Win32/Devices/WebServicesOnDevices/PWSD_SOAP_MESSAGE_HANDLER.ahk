#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\WSD_EVENT.ahk" { WSD_EVENT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * References a SOAP message handler for incoming messages.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/nc-wsdtypes-pwsd_soap_message_handler
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct PWSD_SOAP_MESSAGE_HANDLER {
    value : IntPtr

    __value {
        set {
            if (value is PWSD_SOAP_MESSAGE_HANDLER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IUnknown} thisUnknown Pointer to the object calling this function.
     * @param {Pointer<WSD_EVENT>} event A <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_event">WSD_EVENT</a> structure containing the message to be handled.
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
    Call(thisUnknown, event) {
        result := DllCall(this.value, "ptr", thisUnknown, WSD_EVENT.Ptr, event, "HRESULT")
        return result
    }

    /**
     * A PWSD_SOAP_MESSAGE_HANDLER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWSD_SOAP_MESSAGE_HANDLER {
        /**
         * Creates a PWSD_SOAP_MESSAGE_HANDLER pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WSD_EVENT) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WSD_EVENT.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
