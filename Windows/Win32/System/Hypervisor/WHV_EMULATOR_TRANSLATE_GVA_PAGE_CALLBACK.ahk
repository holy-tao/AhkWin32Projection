#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WHV_TRANSLATE_GVA_FLAGS.ahk" { WHV_TRANSLATE_GVA_FLAGS }
#Import ".\WHV_TRANSLATE_GVA_RESULT_CODE.ahk" { WHV_TRANSLATE_GVA_RESULT_CODE }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_EMULATOR_TRANSLATE_GVA_PAGE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WHV_EMULATOR_TRANSLATE_GVA_PAGE_CALLBACK) {
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
     * @param {Integer} Gva 
     * @param {WHV_TRANSLATE_GVA_FLAGS} TranslateFlags 
     * @param {Pointer<WHV_TRANSLATE_GVA_RESULT_CODE>} TranslationResult 
     * @param {Pointer<Integer>} Gpa 
     * @returns {HRESULT} 
     */
    Call(_Context, Gva, TranslateFlags, TranslationResult, Gpa) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        TranslationResultMarshal := TranslationResult is VarRef ? "int*" : "ptr"
        GpaMarshal := Gpa is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, Int64, Gva, WHV_TRANSLATE_GVA_FLAGS, TranslateFlags, TranslationResultMarshal, TranslationResult, GpaMarshal, Gpa, "HRESULT")
        return result
    }

    /**
     * A WHV_EMULATOR_TRANSLATE_GVA_PAGE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WHV_EMULATOR_TRANSLATE_GVA_PAGE_CALLBACK {
        /**
         * Creates a WHV_EMULATOR_TRANSLATE_GVA_PAGE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int64, WHV_TRANSLATE_GVA_FLAGS, "int*", "uint*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Int64, WHV_TRANSLATE_GVA_FLAGS, "int*", "uint*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
