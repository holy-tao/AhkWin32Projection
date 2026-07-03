#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\HSTRING.ahk" { HSTRING }
#Import ".\IActivationFactory.ahk" { IActivationFactory }

/**
 * @namespace Windows.Win32.System.WinRT
 */
export default struct PFNGETACTIVATIONFACTORY {
    value : IntPtr

    __value {
        set {
            if (value is PFNGETACTIVATIONFACTORY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HSTRING} param0 
     * @returns {IActivationFactory} 
     */
    Call(param0) {
        result := DllCall(this.value, HSTRING, param0, "ptr*", &param1 := 0, "HRESULT")
        return IActivationFactory(param1)
    }

    /**
     * A PFNGETACTIVATIONFACTORY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNGETACTIVATIONFACTORY {
        /**
         * Creates a PFNGETACTIVATIONFACTORY pointer that invokes the given AHK function when called.
         * @param {Func(HSTRING) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HSTRING, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
