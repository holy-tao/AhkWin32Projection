#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\INPUT_MAPPING_ELEMENT.ahk" { INPUT_MAPPING_ELEMENT }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_QUERY_INPUT_MAPPINGS {
    value : IntPtr

    __value {
        set {
            if (value is IOMMU_QUERY_INPUT_MAPPINGS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
     * @param {Pointer<INPUT_MAPPING_ELEMENT>} _Buffer 
     * @param {Integer} BufferLength 
     * @param {Pointer<Integer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    Call(PhysicalDeviceObject, _Buffer, BufferLength, ReturnLength) {
        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, DEVICE_OBJECT.Ptr, PhysicalDeviceObject, INPUT_MAPPING_ELEMENT.Ptr, _Buffer, UInt32, BufferLength, ReturnLengthMarshal, ReturnLength, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A IOMMU_QUERY_INPUT_MAPPINGS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends IOMMU_QUERY_INPUT_MAPPINGS {
        /**
         * Creates a IOMMU_QUERY_INPUT_MAPPINGS pointer that invokes the given AHK function when called.
         * @param {Func(DEVICE_OBJECT, INPUT_MAPPING_ELEMENT, UInt32, "uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DEVICE_OBJECT.Ptr, INPUT_MAPPING_ELEMENT.Ptr, UInt32, "uint*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
