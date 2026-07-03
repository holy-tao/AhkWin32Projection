#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_TRIM_NOTIFICATION.ahk" { D3D12_TRIM_NOTIFICATION }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_PFN_TRIM_NOTIFICATION_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is D3D12_PFN_TRIM_NOTIFICATION_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<D3D12_TRIM_NOTIFICATION>} __MIDL____MIDL_itf_d3d12_0000_00640000 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(__MIDL____MIDL_itf_d3d12_0000_00640000) {
        DllCall(this.value, D3D12_TRIM_NOTIFICATION.Ptr, __MIDL____MIDL_itf_d3d12_0000_00640000)
    }

    /**
     * A D3D12_PFN_TRIM_NOTIFICATION_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends D3D12_PFN_TRIM_NOTIFICATION_CALLBACK {
        /**
         * Creates a D3D12_PFN_TRIM_NOTIFICATION_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(D3D12_TRIM_NOTIFICATION) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [D3D12_TRIM_NOTIFICATION.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
