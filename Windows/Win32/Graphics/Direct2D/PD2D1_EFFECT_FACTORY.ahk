#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Describes the implementation of an effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nc-d2d1_1-pd2d1_effect_factory
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct PD2D1_EFFECT_FACTORY {
    value : IntPtr

    __value {
        set {
            if (value is PD2D1_EFFECT_FACTORY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {IUnknown} The effect implementation returned by the factory.
     */
    Call() {
        result := DllCall(this.value, "ptr*", &effectImpl := 0, "HRESULT")
        return IUnknown(effectImpl)
    }

    /**
     * A PD2D1_EFFECT_FACTORY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PD2D1_EFFECT_FACTORY {
        /**
         * Creates a PD2D1_EFFECT_FACTORY pointer that invokes the given AHK function when called.
         * @param {Func() => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
