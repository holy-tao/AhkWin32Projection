#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\CM_PARTIAL_RESOURCE_DESCRIPTOR.ahk" { CM_PARTIAL_RESOURCE_DESCRIPTOR }
#Import ".\IO_RESOURCE_DESCRIPTOR.ahk" { IO_RESOURCE_DESCRIPTOR }
#Import ".\RESOURCE_TRANSLATION_DIRECTION.ahk" { RESOURCE_TRANSLATION_DIRECTION }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PTRANSLATE_RESOURCE_HANDLER {
    value : IntPtr

    __value {
        set {
            if (value is PTRANSLATE_RESOURCE_HANDLER) {
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
     * @param {Pointer<CM_PARTIAL_RESOURCE_DESCRIPTOR>} Source 
     * @param {RESOURCE_TRANSLATION_DIRECTION} _Direction 
     * @param {Integer} AlternativesCount 
     * @param {Pointer<IO_RESOURCE_DESCRIPTOR>} Alternatives 
     * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
     * @param {Pointer<CM_PARTIAL_RESOURCE_DESCRIPTOR>} Target 
     * @returns {NTSTATUS} 
     */
    Call(_Context, Source, _Direction, AlternativesCount, Alternatives, PhysicalDeviceObject, Target) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, CM_PARTIAL_RESOURCE_DESCRIPTOR.Ptr, Source, RESOURCE_TRANSLATION_DIRECTION, _Direction, UInt32, AlternativesCount, IO_RESOURCE_DESCRIPTOR.Ptr, Alternatives, DEVICE_OBJECT.Ptr, PhysicalDeviceObject, CM_PARTIAL_RESOURCE_DESCRIPTOR.Ptr, Target, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PTRANSLATE_RESOURCE_HANDLER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PTRANSLATE_RESOURCE_HANDLER {
        /**
         * Creates a PTRANSLATE_RESOURCE_HANDLER pointer that invokes the given AHK function when called.
         * @param {Func("ptr", CM_PARTIAL_RESOURCE_DESCRIPTOR, RESOURCE_TRANSLATION_DIRECTION, UInt32, IO_RESOURCE_DESCRIPTOR, DEVICE_OBJECT, CM_PARTIAL_RESOURCE_DESCRIPTOR) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", CM_PARTIAL_RESOURCE_DESCRIPTOR.Ptr, RESOURCE_TRANSLATION_DIRECTION, UInt32, IO_RESOURCE_DESCRIPTOR.Ptr, DEVICE_OBJECT.Ptr, CM_PARTIAL_RESOURCE_DESCRIPTOR.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
