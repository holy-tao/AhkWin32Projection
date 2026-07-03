#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HMODULE.ahk" { HMODULE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D10_DRIVER_TYPE.ahk" { D3D10_DRIVER_TYPE }
#Import ".\D3D10_FEATURE_LEVEL1.ahk" { D3D10_FEATURE_LEVEL1 }
#Import ".\ID3D10Device1.ahk" { ID3D10Device1 }
#Import "..\Dxgi\IDXGIAdapter.ahk" { IDXGIAdapter }

/**
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct PFN_D3D10_CREATE_DEVICE1 {
    value : IntPtr

    __value {
        set {
            if (value is PFN_D3D10_CREATE_DEVICE1) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IDXGIAdapter} param0 
     * @param {D3D10_DRIVER_TYPE} param1 
     * @param {HMODULE} param2 
     * @param {Integer} param3 
     * @param {D3D10_FEATURE_LEVEL1} param4 
     * @param {Integer} param5 
     * @returns {ID3D10Device1} 
     */
    Call(param0, param1, param2, param3, param4, param5) {
        result := DllCall(this.value, "ptr", param0, D3D10_DRIVER_TYPE, param1, HMODULE, param2, UInt32, param3, D3D10_FEATURE_LEVEL1, param4, UInt32, param5, "ptr*", &param6 := 0, "HRESULT")
        return ID3D10Device1(param6)
    }

    /**
     * A PFN_D3D10_CREATE_DEVICE1 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_D3D10_CREATE_DEVICE1 {
        /**
         * Creates a PFN_D3D10_CREATE_DEVICE1 pointer that invokes the given AHK function when called.
         * @param {Func("ptr", D3D10_DRIVER_TYPE, HMODULE, UInt32, D3D10_FEATURE_LEVEL1, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", D3D10_DRIVER_TYPE, HMODULE, UInt32, D3D10_FEATURE_LEVEL1, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
