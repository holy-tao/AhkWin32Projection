#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }
#Import ".\PFN_WDS_CLI_CALLBACK_MESSAGE_ID.ahk" { PFN_WDS_CLI_CALLBACK_MESSAGE_ID }

/**
 * Defines a callback function that WDS can call for progress notification and error messages during a file or image transfer.
 * @remarks
 * A callback function can call the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclicanceltransfer">WdsCliCancelTransfer</a> function to cancel a 
 *     transfer. Although a callback function can also call the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscliwaitfortransfer">WdsCliWaitForTransfer</a> function, this is not 
 *     recommended because no additional callbacks will be received until the current callback is unblocked.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nc-wdsclientapi-pfn_wdsclicallback
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct PFN_WdsCliCallback {
    value : IntPtr

    __value {
        set {
            if (value is PFN_WdsCliCallback) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PFN_WDS_CLI_CALLBACK_MESSAGE_ID} dwMessageId The type of message and the meaning of the <i>lParam</i> parameter.
     * @param {WPARAM} _wParam This message parameter should always be set to the value of the transfer handle returned by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclitransferimage">WdsCliTransferImage</a> or 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclitransferfile">WdsCliTransferFile</a> function.
     * @param {LPARAM} _lParam The meaning of the value contained by this parameter depends upon the 
     *       <i>dwMessageId</i> parameter.
     * @param {Pointer<Void>} pvUserData A pointer to optional user information attached to this session by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclitransferimage">WdsCliTransferImage</a> or 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclitransferfile">WdsCliTransferFile</a> function.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(dwMessageId, _wParam, _lParam, pvUserData) {
        pvUserDataMarshal := pvUserData is VarRef ? "ptr" : "ptr"

        DllCall(this.value, PFN_WDS_CLI_CALLBACK_MESSAGE_ID, dwMessageId, WPARAM, _wParam, LPARAM, _lParam, pvUserDataMarshal, pvUserData)
    }

    /**
     * A PFN_WdsCliCallback that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_WdsCliCallback {
        /**
         * Creates a PFN_WdsCliCallback pointer that invokes the given AHK function when called.
         * @param {Func(PFN_WDS_CLI_CALLBACK_MESSAGE_ID, WPARAM, LPARAM, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PFN_WDS_CLI_CALLBACK_MESSAGE_ID, WPARAM, LPARAM, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
