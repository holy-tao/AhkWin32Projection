#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import "..\..\Foundation\DRIVER_OBJECT.ahk" { DRIVER_OBJECT }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_PERSISTED_MEMORY_ENUMERATION_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is IO_PERSISTED_MEMORY_ENUMERATION_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
     * @param {Pointer<UNICODE_STRING>} PhysicalDeviceId 
     * @param {Pointer<Integer>} DataTag 
     * @param {Pointer<Integer>} DataVersion 
     * @param {Pointer<Void>} _Context 
     * @returns {NTSTATUS} 
     */
    Call(DriverObject, PhysicalDeviceObject, PhysicalDeviceId, DataTag, DataVersion, _Context) {
        DataTagMarshal := DataTag is VarRef ? "ushort*" : "ptr"
        DataVersionMarshal := DataVersion is VarRef ? "uint*" : "ptr"
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DRIVER_OBJECT.Ptr, DriverObject, DEVICE_OBJECT.Ptr, PhysicalDeviceObject, UNICODE_STRING.Ptr, PhysicalDeviceId, DataTagMarshal, DataTag, DataVersionMarshal, DataVersion, _ContextMarshal, _Context, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A IO_PERSISTED_MEMORY_ENUMERATION_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IO_PERSISTED_MEMORY_ENUMERATION_CALLBACK {
        /**
         * Creates a IO_PERSISTED_MEMORY_ENUMERATION_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(DRIVER_OBJECT, DEVICE_OBJECT, UNICODE_STRING, "ushort*", "uint*", "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DRIVER_OBJECT.Ptr, DEVICE_OBJECT.Ptr, UNICODE_STRING.Ptr, "ushort*", "uint*", "ptr", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
