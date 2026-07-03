#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Notifies the supplicant that there is a change in the Statement of Health (SoH) and re-authentication of a Network Access Protection (NAP) system connection is required.
 * @remarks
 * A pointer to this callback function must be provided when calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a>. The callback may be called by EAPHost at any time prior to calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerclearconnection">EapHostPeerClearConnection</a>.
 * @see https://learn.microsoft.com/windows/win32/api/eappapis/nc-eappapis-notificationhandler
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct NotificationHandler {
    value : IntPtr

    __value {
        set {
            if (value is NotificationHandler) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Guid} connectionId A GUID provided by the supplicant to EAPHost. This value specifies the logical network connection to re-authenticate.
     * @param {Pointer<Void>} pContextData Context data provided to EAPHost by the supplicant. This context data can be used by the supplicant for re-authentication.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(connectionId, pContextData) {
        pContextDataMarshal := pContextData is VarRef ? "ptr" : "ptr"

        DllCall(this.value, Guid, connectionId, pContextDataMarshal, pContextData)
    }

    /**
     * A NotificationHandler that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NotificationHandler {
        /**
         * Creates a NotificationHandler pointer that invokes the given AHK function when called.
         * @param {Func(Guid, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid, "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
