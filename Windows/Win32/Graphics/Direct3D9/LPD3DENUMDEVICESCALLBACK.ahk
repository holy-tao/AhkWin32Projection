#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\D3DDEVICEDESC.ahk" { D3DDEVICEDESC }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct LPD3DENUMDEVICESCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is LPD3DENUMDEVICESCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Guid>} lpGuid 
     * @param {PSTR} lpDeviceDescription 
     * @param {PSTR} lpDeviceName 
     * @param {Pointer<D3DDEVICEDESC>} param3 
     * @param {Pointer<D3DDEVICEDESC>} param4 
     * @param {Pointer<Void>} param5 
     * @returns {HRESULT} 
     */
    Call(lpGuid, lpDeviceDescription, lpDeviceName, param3, param4, param5) {
        lpDeviceDescription := lpDeviceDescription is String ? StrPtr(lpDeviceDescription) : lpDeviceDescription
        lpDeviceName := lpDeviceName is String ? StrPtr(lpDeviceName) : lpDeviceName

        param5Marshal := param5 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, Guid.Ptr, lpGuid, "ptr", lpDeviceDescription, "ptr", lpDeviceName, D3DDEVICEDESC.Ptr, param3, D3DDEVICEDESC.Ptr, param4, param5Marshal, param5, "HRESULT")
        return result
    }

    /**
     * A LPD3DENUMDEVICESCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPD3DENUMDEVICESCALLBACK {
        /**
         * Creates a LPD3DENUMDEVICESCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(Guid, PSTR, PSTR, D3DDEVICEDESC, D3DDEVICEDESC, "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, PSTR, PSTR, D3DDEVICEDESC.Ptr, D3DDEVICEDESC.Ptr, "ptr", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
