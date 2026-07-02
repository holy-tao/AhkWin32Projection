#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Dxgi\IDXGISwapChain.ahk" { IDXGISwapChain }
#Import "..\Dxgi\DXGI_SWAP_CHAIN_DESC.ahk" { DXGI_SWAP_CHAIN_DESC }
#Import ".\ID3D10Device1.ahk" { ID3D10Device1 }
#Import "..\Dxgi\IDXGIAdapter.ahk" { IDXGIAdapter }
#Import ".\D3D10_FEATURE_LEVEL1.ahk" { D3D10_FEATURE_LEVEL1 }
#Import ".\D3D10_DRIVER_TYPE.ahk" { D3D10_DRIVER_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\HMODULE.ahk" { HMODULE }

/**
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct PFN_D3D10_CREATE_DEVICE_AND_SWAP_CHAIN1 {
    value : IntPtr

    __value {
        set {
            if (value is PFN_D3D10_CREATE_DEVICE_AND_SWAP_CHAIN1) {
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
     * @param {Pointer<DXGI_SWAP_CHAIN_DESC>} param6 
     * @param {Pointer<IDXGISwapChain>} param7 
     * @param {Pointer<ID3D10Device1>} param8 
     * @returns {HRESULT} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6, param7, param8) {
        result := DllCall(this.value, "ptr", param0, D3D10_DRIVER_TYPE, param1, HMODULE, param2, UInt32, param3, D3D10_FEATURE_LEVEL1, param4, UInt32, param5, DXGI_SWAP_CHAIN_DESC.Ptr, param6, IDXGISwapChain.Ptr, param7, ID3D10Device1.Ptr, param8, "HRESULT")
        return result
    }

    /**
     * A PFN_D3D10_CREATE_DEVICE_AND_SWAP_CHAIN1 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_D3D10_CREATE_DEVICE_AND_SWAP_CHAIN1 {
        /**
         * Creates a PFN_D3D10_CREATE_DEVICE_AND_SWAP_CHAIN1 pointer that invokes the given AHK function when called.
         * @param {Func("ptr", D3D10_DRIVER_TYPE, HMODULE, UInt32, D3D10_FEATURE_LEVEL1, UInt32, DXGI_SWAP_CHAIN_DESC, IDXGISwapChain, ID3D10Device1) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 9)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 9 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", D3D10_DRIVER_TYPE, HMODULE, UInt32, D3D10_FEATURE_LEVEL1, UInt32, DXGI_SWAP_CHAIN_DESC.Ptr, IDXGISwapChain.Ptr, ID3D10Device1.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
