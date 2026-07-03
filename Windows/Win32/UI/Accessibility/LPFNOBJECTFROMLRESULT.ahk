#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct LPFNOBJECTFROMLRESULT {
    value : IntPtr

    __value {
        set {
            if (value is LPFNOBJECTFROMLRESULT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {LRESULT} _lResult 
     * @param {Pointer<Guid>} riid 
     * @param {WPARAM} _wParam 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @returns {HRESULT} 
     */
    Call(_lResult, riid, _wParam, ppvObject) {
        ppvObjectMarshal := ppvObject is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, LRESULT, _lResult, Guid.Ptr, riid, WPARAM, _wParam, ppvObjectMarshal, ppvObject, "HRESULT")
        return result
    }

    /**
     * A LPFNOBJECTFROMLRESULT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFNOBJECTFROMLRESULT {
        /**
         * Creates a LPFNOBJECTFROMLRESULT pointer that invokes the given AHK function when called.
         * @param {Func(LRESULT, Guid, WPARAM, "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LRESULT, Guid.Ptr, WPARAM, "ptr*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
