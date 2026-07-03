#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import "..\..\Foundation\DRIVER_OBJECT.ahk" { DRIVER_OBJECT }
#Import ".\CM_RESOURCE_LIST.ahk" { CM_RESOURCE_LIST }
#Import ".\INTERFACE_TYPE.ahk" { INTERFACE_TYPE }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct pHalAssignSlotResources {
    value : IntPtr

    __value {
        set {
            if (value is pHalAssignSlotResources) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} RegistryPath 
     * @param {Pointer<UNICODE_STRING>} DriverClassName 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {INTERFACE_TYPE} BusType 
     * @param {Integer} BusNumber 
     * @param {Integer} SlotNumber 
     * @param {Pointer<Pointer<CM_RESOURCE_LIST>>} AllocatedResources 
     * @returns {NTSTATUS} 
     */
    Call(RegistryPath, DriverClassName, DriverObject, DeviceObject, BusType, BusNumber, SlotNumber, AllocatedResources) {
        AllocatedResourcesMarshal := AllocatedResources is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, UNICODE_STRING.Ptr, RegistryPath, UNICODE_STRING.Ptr, DriverClassName, DRIVER_OBJECT.Ptr, DriverObject, DEVICE_OBJECT.Ptr, DeviceObject, INTERFACE_TYPE, BusType, UInt32, BusNumber, UInt32, SlotNumber, AllocatedResourcesMarshal, AllocatedResources, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A pHalAssignSlotResources that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pHalAssignSlotResources {
        /**
         * Creates a pHalAssignSlotResources pointer that invokes the given AHK function when called.
         * @param {Func(UNICODE_STRING, UNICODE_STRING, DRIVER_OBJECT, DEVICE_OBJECT, INTERFACE_TYPE, UInt32, UInt32, "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UNICODE_STRING.Ptr, UNICODE_STRING.Ptr, DRIVER_OBJECT.Ptr, DEVICE_OBJECT.Ptr, INTERFACE_TYPE, UInt32, UInt32, "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
