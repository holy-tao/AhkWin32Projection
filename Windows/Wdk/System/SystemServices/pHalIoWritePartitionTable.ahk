#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\System\Ioctl\DRIVE_LAYOUT_INFORMATION.ahk" { DRIVE_LAYOUT_INFORMATION }
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct pHalIoWritePartitionTable {
    value : IntPtr

    __value {
        set {
            if (value is pHalIoWritePartitionTable) {
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
     * @param {Integer} SectorsPerTrack 
     * @param {Integer} NumberOfHeads 
     * @param {Pointer<DRIVE_LAYOUT_INFORMATION>} PartitionBuffer 
     * @returns {NTSTATUS} 
     */
    Call(DeviceObject, SectorSize, SectorsPerTrack, NumberOfHeads, PartitionBuffer) {
        result := DllCall(this.value, DEVICE_OBJECT.Ptr, DeviceObject, UInt32, SectorSize, UInt32, SectorsPerTrack, UInt32, NumberOfHeads, DRIVE_LAYOUT_INFORMATION.Ptr, PartitionBuffer, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A pHalIoWritePartitionTable that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pHalIoWritePartitionTable {
        /**
         * Creates a pHalIoWritePartitionTable pointer that invokes the given AHK function when called.
         * @param {Func(DEVICE_OBJECT, UInt32, UInt32, UInt32, DRIVE_LAYOUT_INFORMATION) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DEVICE_OBJECT.Ptr, UInt32, UInt32, UInt32, DRIVE_LAYOUT_INFORMATION.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
