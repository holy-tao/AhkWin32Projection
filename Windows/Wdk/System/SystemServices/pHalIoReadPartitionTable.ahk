#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\..\Win32\System\Ioctl\DRIVE_LAYOUT_INFORMATION.ahk" { DRIVE_LAYOUT_INFORMATION }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct pHalIoReadPartitionTable {
    value : IntPtr

    __value {
        set {
            if (value is pHalIoReadPartitionTable) {
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
     * @param {BOOLEAN} ReturnRecognizedPartitions 
     * @param {Pointer<Pointer<DRIVE_LAYOUT_INFORMATION>>} PartitionBuffer 
     * @returns {NTSTATUS} 
     */
    Call(DeviceObject, SectorSize, ReturnRecognizedPartitions, PartitionBuffer) {
        PartitionBufferMarshal := PartitionBuffer is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, DEVICE_OBJECT.Ptr, DeviceObject, UInt32, SectorSize, BOOLEAN, ReturnRecognizedPartitions, PartitionBufferMarshal, PartitionBuffer, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A pHalIoReadPartitionTable that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pHalIoReadPartitionTable {
        /**
         * Creates a pHalIoReadPartitionTable pointer that invokes the given AHK function when called.
         * @param {Func(DEVICE_OBJECT, UInt32, BOOLEAN, "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DEVICE_OBJECT.Ptr, UInt32, BOOLEAN, "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
