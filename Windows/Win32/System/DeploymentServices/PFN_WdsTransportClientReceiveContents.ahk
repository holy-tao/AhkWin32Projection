#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * The PFN_WdsTransportClientReceiveContents callback is used by the multicast client to indicate that a block of data is ready to be used.
 * @see https://learn.microsoft.com/windows/win32/api/wdstci/nc-wdstci-pfn_wdstransportclientreceivecontents
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct PFN_WdsTransportClientReceiveContents {
    value : IntPtr

    __value {
        set {
            if (value is PFN_WdsTransportClientReceiveContents) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hSessionKey The handle belonging to the session that is being started.
     * @param {Pointer<Void>} pCallerData Pointer to the user data for this session.  This data was specified in the call to the <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nf-wdstci-wdstransportclientstartsession">WdsTransportClientStartSession</a> function.
     * @param {Integer} pContents 
     * @param {Integer} ulSize The size of the data in <i>pCallerData</i>.
     * @param {Pointer<Integer>} pullContentOffset 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hSessionKey, pCallerData, pContents, ulSize, pullContentOffset) {
        pCallerDataMarshal := pCallerData is VarRef ? "ptr" : "ptr"
        pullContentOffsetMarshal := pullContentOffset is VarRef ? "uint*" : "ptr"

        DllCall(this.value, HANDLE, hSessionKey, pCallerDataMarshal, pCallerData, IntPtr, pContents, UInt32, ulSize, pullContentOffsetMarshal, pullContentOffset)
    }

    /**
     * A PFN_WdsTransportClientReceiveContents that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_WdsTransportClientReceiveContents {
        /**
         * Creates a PFN_WdsTransportClientReceiveContents pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "ptr", IntPtr, UInt32, "uint*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "ptr", IntPtr, UInt32, "uint*", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
