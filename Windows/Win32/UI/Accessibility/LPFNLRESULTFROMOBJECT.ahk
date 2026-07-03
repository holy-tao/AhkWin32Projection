#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct LPFNLRESULTFROMOBJECT {
    value : IntPtr

    __value {
        set {
            if (value is LPFNLRESULTFROMOBJECT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {WPARAM} _wParam 
     * @param {IUnknown} punk 
     * @returns {LRESULT} 
     */
    Call(riid, _wParam, punk) {
        result := DllCall(this.value, Guid.Ptr, riid, WPARAM, _wParam, "ptr", punk, LRESULT)
        return result
    }

    /**
     * A LPFNLRESULTFROMOBJECT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFNLRESULTFROMOBJECT {
        /**
         * Creates a LPFNLRESULTFROMOBJECT pointer that invokes the given AHK function when called.
         * @param {Func(Guid, WPARAM, "ptr") => LRESULT} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, WPARAM, "ptr", LRESULT])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
