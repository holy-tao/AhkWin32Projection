#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IAccessible.ahk" { IAccessible }

/**
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct LPFNACCESSIBLEOBJECTFROMPOINT {
    value : IntPtr

    __value {
        set {
            if (value is LPFNACCESSIBLEOBJECTFROMPOINT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {POINT} ptScreen 
     * @param {Pointer<VARIANT>} pvarChild 
     * @returns {IAccessible} 
     */
    Call(ptScreen, pvarChild) {
        result := DllCall(this.value, POINT, ptScreen, "ptr*", &ppacc := 0, VARIANT.Ptr, pvarChild, "HRESULT")
        return IAccessible(ppacc)
    }

    /**
     * A LPFNACCESSIBLEOBJECTFROMPOINT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFNACCESSIBLEOBJECTFROMPOINT {
        /**
         * Creates a LPFNACCESSIBLEOBJECTFROMPOINT pointer that invokes the given AHK function when called.
         * @param {Func(POINT, VARIANT) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [POINT, VARIANT.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
