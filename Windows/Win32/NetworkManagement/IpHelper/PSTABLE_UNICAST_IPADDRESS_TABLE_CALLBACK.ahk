#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIB_UNICASTIPADDRESS_TABLE.ahk" { MIB_UNICASTIPADDRESS_TABLE }

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct PSTABLE_UNICAST_IPADDRESS_TABLE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PSTABLE_UNICAST_IPADDRESS_TABLE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} CallerContext 
     * @param {Pointer<MIB_UNICASTIPADDRESS_TABLE>} AddressTable 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(CallerContext, AddressTable) {
        CallerContextMarshal := CallerContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, CallerContextMarshal, CallerContext, MIB_UNICASTIPADDRESS_TABLE.Ptr, AddressTable)
    }

    /**
     * A PSTABLE_UNICAST_IPADDRESS_TABLE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSTABLE_UNICAST_IPADDRESS_TABLE_CALLBACK {
        /**
         * Creates a PSTABLE_UNICAST_IPADDRESS_TABLE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", MIB_UNICASTIPADDRESS_TABLE) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", MIB_UNICASTIPADDRESS_TABLE.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
