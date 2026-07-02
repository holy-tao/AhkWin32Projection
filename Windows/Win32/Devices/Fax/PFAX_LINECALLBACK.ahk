#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * The FaxLineCallback function is an application-defined or library-defined callback function that the fax service calls to deliver Telephony Application Programming Interface (TAPI) events to the fax service provider (FSP).
 * @remarks
 * The FSP must register the <i>FaxLineCallback</i> callback function by passing its address when the fax service calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxdev/nf-faxdev-faxdevinitialize">FaxDevInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/faxdev/nc-faxdev-pfax_linecallback
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAX_LINECALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFAX_LINECALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax handle returned by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxdev/nf-faxdev-faxdevstartjob">FaxDevStartJob</a> function.
     * @param {Integer} hDevice Type: <b>DWORD</b>
     * 
     * Specifies a handle to either a line device or a call device. To determine whether this handle is a line handle or a call handle, use the context that the <i>dwMessage</i> parameter provides.
     * @param {Integer} dwMessage Type: <b>DWORD</b>
     * 
     * Specifies a line device or a call device message.
     * @param {Pointer} dwInstance Type: <b>DWORD_PTR</b>
     * 
     * Reserved; should not be used by the FSP.
     * @param {Pointer} dwParam1 Type: <b>DWORD_PTR</b>
     * 
     * Specifies a parameter for the message. For information about parameter values passed in this structure, see <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-device-messages">Line Device Messages</a> in the TAPI documentation.
     * @param {Pointer} dwParam2 Type: <b>DWORD_PTR</b>
     * 
     * Specifies a parameter for the message.
     * @param {Pointer} dwParam3 Type: <b>DWORD_PTR</b>
     * 
     * Specifies a parameter for the message.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(FaxHandle, hDevice, dwMessage, dwInstance, dwParam1, dwParam2, dwParam3) {
        DllCall(this.value, HANDLE, FaxHandle, UInt32, hDevice, UInt32, dwMessage, IntPtr, dwInstance, IntPtr, dwParam1, IntPtr, dwParam2, IntPtr, dwParam3)
    }

    /**
     * A PFAX_LINECALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAX_LINECALLBACK {
        /**
         * Creates a PFAX_LINECALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, UInt32, IntPtr, IntPtr, IntPtr, IntPtr) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, UInt32, IntPtr, IntPtr, IntPtr, IntPtr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
