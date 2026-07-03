#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\Gdi\HDC.ahk" { HDC }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct EMFPLAYPROC {
    value : IntPtr

    __value {
        set {
            if (value is EMFPLAYPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HDC} param0 
     * @param {Integer} param1 
     * @param {HANDLE} param2 
     * @returns {Integer} 
     */
    Call(param0, param1, param2) {
        result := DllCall(this.value, HDC, param0, Int32, param1, HANDLE, param2, Int32)
        return result
    }

    /**
     * A EMFPLAYPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EMFPLAYPROC {
        /**
         * Creates a EMFPLAYPROC pointer that invokes the given AHK function when called.
         * @param {Func(HDC, Int32, HANDLE) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HDC, Int32, HANDLE, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
