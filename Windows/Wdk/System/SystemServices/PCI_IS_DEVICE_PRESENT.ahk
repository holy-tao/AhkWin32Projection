#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_IS_DEVICE_PRESENT {
    value : IntPtr

    __value {
        set {
            if (value is PCI_IS_DEVICE_PRESENT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} VendorID 
     * @param {Integer} DeviceID 
     * @param {Integer} RevisionID 
     * @param {Integer} SubVendorID 
     * @param {Integer} SubSystemID 
     * @param {Integer} Flags 
     * @returns {BOOLEAN} 
     */
    Call(VendorID, DeviceID, RevisionID, SubVendorID, SubSystemID, Flags) {
        result := DllCall(this.value, UInt16, VendorID, UInt16, DeviceID, Int8, RevisionID, UInt16, SubVendorID, UInt16, SubSystemID, UInt32, Flags, BOOLEAN)
        return result
    }

    /**
     * A PCI_IS_DEVICE_PRESENT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCI_IS_DEVICE_PRESENT {
        /**
         * Creates a PCI_IS_DEVICE_PRESENT pointer that invokes the given AHK function when called.
         * @param {Func(UInt16, UInt16, Int8, UInt16, UInt16, UInt32) => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt16, UInt16, Int8, UInt16, UInt16, UInt32, BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
