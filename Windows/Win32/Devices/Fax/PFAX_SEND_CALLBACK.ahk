#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The FaxSendCallback function is an application-defined or library-defined callback function that a fax service provider (FSP) calls to notify the fax service that an outgoing fax call is in progress.
 * @remarks
 * The <i>FaxSendCallback</i> callback function provides the fax service with the <i>CallHandle</i> that TAPI assigns. This handle is necessary for TAPI message routing. If the FSP does not call <i>FaxSendCallback</i>, it will miss all further call events.
 * 
 * A virtual FSP does not need the <i>FaxSendCallback</i> function.
 * @see https://learn.microsoft.com/windows/win32/api/faxdev/nc-faxdev-pfax_send_callback
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAX_SEND_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFAX_SEND_CALLBACK) {
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
     * @param {Integer} CallHandle Type: <b>HCALL</b>
     * 
     * Specifies a call handle returned by the TAPI 2.x <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-callstate">LINE_CALLSTATE</a> message.
     * @param {Integer} Reserved1 Type: <b>DWORD</b>
     * 
     * This parameter is reserved for future use by Microsoft. It must be set to zero.
     * @param {Integer} Reserved2 Type: <b>DWORD</b>
     * 
     * This parameter is reserved for future use by Microsoft. It must be set to zero.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * The fax service returns a value of <b>TRUE</b> to indicate that the active fax operation should continue.
     * 
     * The fax service returns a value of <b>FALSE</b> to indicate that the active fax operation should be terminated. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     */
    Call(FaxHandle, CallHandle, Reserved1, Reserved2) {
        result := DllCall(this.value, HANDLE, FaxHandle, UInt32, CallHandle, UInt32, Reserved1, UInt32, Reserved2, BOOL)
        return result
    }

    /**
     * A PFAX_SEND_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAX_SEND_CALLBACK {
        /**
         * Creates a PFAX_SEND_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, UInt32, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, UInt32, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
