#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * PFN_WdsTransportClientReceiveMetadata is an optional callback that a consumer may register to receive metadata type information about a file. This information is provided by the content provider and is opaque to the multicast client and server.
 * @see https://learn.microsoft.com/windows/win32/api/wdstci/nc-wdstci-pfn_wdstransportclientreceivemetadata
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct PFN_WdsTransportClientReceiveMetadata {
    value : IntPtr

    __value {
        set {
            if (value is PFN_WdsTransportClientReceiveMetadata) {
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
     * @param {Pointer<Void>} pCallerData Pointer to the caller specific data for this session.    This data was specified in the call to <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nf-wdstci-wdstransportclientstartsession">WdsTransportClientStartSession</a> function.
     * @param {Integer} pMetadata Data provided by the content provider that is associated with this object in some manner.
     * @param {Integer} ulSize The size of the <i>pMetadata</i> buffer in bytes.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(hSessionKey, pCallerData, pMetadata, ulSize) {
        pCallerDataMarshal := pCallerData is VarRef ? "ptr" : "ptr"

        DllCall(this.value, HANDLE, hSessionKey, pCallerDataMarshal, pCallerData, IntPtr, pMetadata, UInt32, ulSize)
    }

    /**
     * A PFN_WdsTransportClientReceiveMetadata that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_WdsTransportClientReceiveMetadata {
        /**
         * Creates a PFN_WdsTransportClientReceiveMetadata pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "ptr", IntPtr, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "ptr", IntPtr, UInt32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
