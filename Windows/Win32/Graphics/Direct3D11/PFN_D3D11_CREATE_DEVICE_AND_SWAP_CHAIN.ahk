#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HMODULE.ahk" { HMODULE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Direct3D\D3D_DRIVER_TYPE.ahk" { D3D_DRIVER_TYPE }
#Import "..\Direct3D\D3D_FEATURE_LEVEL.ahk" { D3D_FEATURE_LEVEL }
#Import ".\ID3D11Device.ahk" { ID3D11Device }
#Import ".\ID3D11DeviceContext.ahk" { ID3D11DeviceContext }
#Import "..\Dxgi\DXGI_SWAP_CHAIN_DESC.ahk" { DXGI_SWAP_CHAIN_DESC }
#Import "..\Dxgi\IDXGIAdapter.ahk" { IDXGIAdapter }
#Import "..\Dxgi\IDXGISwapChain.ahk" { IDXGISwapChain }

/**
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct PFN_D3D11_CREATE_DEVICE_AND_SWAP_CHAIN {
    value : IntPtr

    __value {
        set {
            if (value is PFN_D3D11_CREATE_DEVICE_AND_SWAP_CHAIN) {
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
     * @param {D3D_DRIVER_TYPE} param1 
     * @param {HMODULE} param2 
     * @param {Integer} param3 
     * @param {Pointer<D3D_FEATURE_LEVEL>} param4 
     * @param {Integer} FeatureLevels 
     * @param {Integer} param6 
     * @param {Pointer<DXGI_SWAP_CHAIN_DESC>} param7 
     * @param {Pointer<IDXGISwapChain>} param8 
     * @param {Pointer<ID3D11Device>} param9 
     * @param {Pointer<D3D_FEATURE_LEVEL>} param10 
     * @param {Pointer<ID3D11DeviceContext>} param11 
     * @returns {HRESULT} 
     */
    Call(param0, param1, param2, param3, param4, FeatureLevels, param6, param7, param8, param9, param10, param11) {
        param4Marshal := param4 is VarRef ? "int*" : "ptr"
        param10Marshal := param10 is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, "ptr", param0, D3D_DRIVER_TYPE, param1, HMODULE, param2, UInt32, param3, param4Marshal, param4, UInt32, FeatureLevels, UInt32, param6, DXGI_SWAP_CHAIN_DESC.Ptr, param7, IDXGISwapChain.Ptr, param8, ID3D11Device.Ptr, param9, param10Marshal, param10, ID3D11DeviceContext.Ptr, param11, "HRESULT")
        return result
    }

    /**
     * A PFN_D3D11_CREATE_DEVICE_AND_SWAP_CHAIN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_D3D11_CREATE_DEVICE_AND_SWAP_CHAIN {
        /**
         * Creates a PFN_D3D11_CREATE_DEVICE_AND_SWAP_CHAIN pointer that invokes the given AHK function when called.
         * @param {Func("ptr", D3D_DRIVER_TYPE, HMODULE, UInt32, "int*", UInt32, UInt32, DXGI_SWAP_CHAIN_DESC, IDXGISwapChain, ID3D11Device, "int*", ID3D11DeviceContext) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 12)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 12 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", D3D_DRIVER_TYPE, HMODULE, UInt32, "int*", UInt32, UInt32, DXGI_SWAP_CHAIN_DESC.Ptr, IDXGISwapChain.Ptr, ID3D11Device.Ptr, "int*", ID3D11DeviceContext.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
