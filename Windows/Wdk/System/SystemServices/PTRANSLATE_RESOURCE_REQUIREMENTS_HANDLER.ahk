#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IO_RESOURCE_DESCRIPTOR.ahk" { IO_RESOURCE_DESCRIPTOR }
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PTRANSLATE_RESOURCE_REQUIREMENTS_HANDLER {
    value : IntPtr

    __value {
        set {
            if (value is PTRANSLATE_RESOURCE_REQUIREMENTS_HANDLER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Pointer<IO_RESOURCE_DESCRIPTOR>} Source 
     * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
     * @param {Pointer<Integer>} TargetCount 
     * @param {Pointer<Pointer<IO_RESOURCE_DESCRIPTOR>>} Target 
     * @returns {NTSTATUS} 
     */
    Call(_Context, Source, PhysicalDeviceObject, TargetCount, Target) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        TargetCountMarshal := TargetCount is VarRef ? "uint*" : "ptr"
        TargetMarshal := Target is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, IO_RESOURCE_DESCRIPTOR.Ptr, Source, DEVICE_OBJECT.Ptr, PhysicalDeviceObject, TargetCountMarshal, TargetCount, TargetMarshal, Target, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PTRANSLATE_RESOURCE_REQUIREMENTS_HANDLER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PTRANSLATE_RESOURCE_REQUIREMENTS_HANDLER {
        /**
         * Creates a PTRANSLATE_RESOURCE_REQUIREMENTS_HANDLER pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IO_RESOURCE_DESCRIPTOR, DEVICE_OBJECT, "uint*", "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IO_RESOURCE_DESCRIPTOR.Ptr, DEVICE_OBJECT.Ptr, "uint*", "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
