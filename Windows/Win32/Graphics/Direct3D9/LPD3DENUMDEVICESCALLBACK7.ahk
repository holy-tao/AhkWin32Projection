#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\D3DDEVICEDESC7.ahk" { D3DDEVICEDESC7 }

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct LPD3DENUMDEVICESCALLBACK7 {
    value : IntPtr

    __value {
        set {
            if (value is LPD3DENUMDEVICESCALLBACK7) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} lpDeviceDescription 
     * @param {PSTR} lpDeviceName 
     * @param {Pointer<D3DDEVICEDESC7>} param2 
     * @param {Pointer<Void>} param3 
     * @returns {HRESULT} 
     */
    Call(lpDeviceDescription, lpDeviceName, param2, param3) {
        lpDeviceDescription := lpDeviceDescription is String ? StrPtr(lpDeviceDescription) : lpDeviceDescription
        lpDeviceName := lpDeviceName is String ? StrPtr(lpDeviceName) : lpDeviceName

        param3Marshal := param3 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", lpDeviceDescription, "ptr", lpDeviceName, D3DDEVICEDESC7.Ptr, param2, param3Marshal, param3, "HRESULT")
        return result
    }

    /**
     * A LPD3DENUMDEVICESCALLBACK7 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPD3DENUMDEVICESCALLBACK7 {
        /**
         * Creates a LPD3DENUMDEVICESCALLBACK7 pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, PSTR, D3DDEVICEDESC7, "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, PSTR, D3DDEVICEDESC7.Ptr, "ptr", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
