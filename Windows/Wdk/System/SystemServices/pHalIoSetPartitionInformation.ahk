#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct pHalIoSetPartitionInformation {
    value : IntPtr

    __value {
        set {
            if (value is pHalIoSetPartitionInformation) {
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
     * @param {Integer} PartitionNumber 
     * @param {Integer} PartitionType 
     * @returns {NTSTATUS} 
     */
    Call(DeviceObject, SectorSize, PartitionNumber, PartitionType) {
        result := DllCall(this.value, DEVICE_OBJECT.Ptr, DeviceObject, UInt32, SectorSize, UInt32, PartitionNumber, UInt32, PartitionType, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A pHalIoSetPartitionInformation that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pHalIoSetPartitionInformation {
        /**
         * Creates a pHalIoSetPartitionInformation pointer that invokes the given AHK function when called.
         * @param {Func(DEVICE_OBJECT, UInt32, UInt32, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DEVICE_OBJECT.Ptr, UInt32, UInt32, UInt32, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
