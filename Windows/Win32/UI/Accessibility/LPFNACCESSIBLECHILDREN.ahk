#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IAccessible.ahk" { IAccessible }

/**
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct LPFNACCESSIBLECHILDREN {
    value : IntPtr

    __value {
        set {
            if (value is LPFNACCESSIBLECHILDREN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IAccessible} paccContainer 
     * @param {Integer} iChildStart 
     * @param {Integer} cChildren 
     * @param {Pointer<VARIANT>} rgvarChildren 
     * @param {Pointer<Integer>} pcObtained 
     * @returns {HRESULT} 
     */
    Call(paccContainer, iChildStart, cChildren, rgvarChildren, pcObtained) {
        pcObtainedMarshal := pcObtained is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, "ptr", paccContainer, Int32, iChildStart, Int32, cChildren, VARIANT.Ptr, rgvarChildren, pcObtainedMarshal, pcObtained, "HRESULT")
        return result
    }

    /**
     * A LPFNACCESSIBLECHILDREN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFNACCESSIBLECHILDREN {
        /**
         * Creates a LPFNACCESSIBLECHILDREN pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int32, Int32, VARIANT, "int*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Int32, Int32, VARIANT.Ptr, "int*", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
