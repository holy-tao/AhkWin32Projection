#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct pHalExamineMBR {
    value : IntPtr

    __value {
        set {
            if (value is pHalExamineMBR) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Integer} SectorSize 
     * @param {Integer} MBRTypeIdentifier 
     * @param {Pointer<Pointer<Void>>} _Buffer 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(DeviceObject, SectorSize, MBRTypeIdentifier, _Buffer) {
        _BufferMarshal := _Buffer is VarRef ? "ptr*" : "ptr"

        DllCall(this.value, DEVICE_OBJECT.Ptr, DeviceObject, UInt32, SectorSize, UInt32, MBRTypeIdentifier, _BufferMarshal, _Buffer)
    }

    /**
     * A pHalExamineMBR that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pHalExamineMBR {
        /**
         * Creates a pHalExamineMBR pointer that invokes the given AHK function when called.
         * @param {Func(DEVICE_OBJECT, UInt32, UInt32, "ptr*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DEVICE_OBJECT.Ptr, UInt32, UInt32, "ptr*", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
