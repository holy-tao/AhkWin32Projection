#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_IDENTITY.ahk" { WINBIO_IDENTITY }
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_FRAMEWORK_GET_PROPERTY_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_FRAMEWORK_GET_PROPERTY_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline 
     * @param {Integer} PropertyType 
     * @param {Integer} PropertyId 
     * @param {Pointer<WINBIO_IDENTITY>} Identity 
     * @param {Integer} SubFactor 
     * @param {Pointer<Pointer<Void>>} PropertyBuffer 
     * @param {Pointer<Pointer>} PropertyBufferSize 
     * @returns {HRESULT} 
     */
    Call(Pipeline, PropertyType, PropertyId, Identity, SubFactor, PropertyBuffer, PropertyBufferSize) {
        PropertyBufferMarshal := PropertyBuffer is VarRef ? "ptr*" : "ptr"
        PropertyBufferSizeMarshal := PropertyBufferSize is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, UInt32, PropertyType, UInt32, PropertyId, WINBIO_IDENTITY.Ptr, Identity, Int8, SubFactor, PropertyBufferMarshal, PropertyBuffer, PropertyBufferSizeMarshal, PropertyBufferSize, "HRESULT")
        return result
    }

    /**
     * A PIBIO_FRAMEWORK_GET_PROPERTY_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_FRAMEWORK_GET_PROPERTY_FN {
        /**
         * Creates a PIBIO_FRAMEWORK_GET_PROPERTY_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, UInt32, UInt32, WINBIO_IDENTITY, Int8, "ptr*", "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, UInt32, UInt32, WINBIO_IDENTITY.Ptr, Int8, "ptr*", "ptr*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
