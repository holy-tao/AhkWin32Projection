#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Sets a property on an effect.
 * @remarks
 * Supply a <b>PD2D1_PROPERTY_SET_FUNCTION</b> function pointer to the <b>setFunction</b> member of a <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/ns-d2d1effectauthor-d2d1_property_binding">D2D1_PROPERTY_BINDING</a> structure to specify the function that Direct2D uses to set data for a property.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nc-d2d1effectauthor-pd2d1_property_set_function
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct PD2D1_PROPERTY_SET_FUNCTION {
    value : IntPtr

    __value {
        set {
            if (value is PD2D1_PROPERTY_SET_FUNCTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IUnknown} _effect A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface for the effect on which the property will be set.
     * @param {Pointer<Integer>} data A pointer to the data to be set on the property.
     * @param {Integer} dataSize The number of bytes in the property set by the function.
     * @returns {HRESULT} Returns S_OK if successful; otherwise, returns an <b>HRESULT</b> error code.
     */
    Call(_effect, data, dataSize) {
        dataMarshal := data is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, "ptr", _effect, dataMarshal, data, UInt32, dataSize, "HRESULT")
        return result
    }

    /**
     * A PD2D1_PROPERTY_SET_FUNCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PD2D1_PROPERTY_SET_FUNCTION {
        /**
         * Creates a PD2D1_PROPERTY_SET_FUNCTION pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "char*", UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "char*", UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
