#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Direct3D\D3D_FEATURE_LEVEL.ahk" { D3D_FEATURE_LEVEL }
#Import "..\Direct3D11\ID3D11Device.ahk" { ID3D11Device }
#Import "..\Direct3D11\ID3D11DeviceContext.ahk" { ID3D11DeviceContext }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Direct3D11on12
 */
export default struct PFN_D3D11ON12_CREATE_DEVICE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_D3D11ON12_CREATE_DEVICE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IUnknown} param0 
     * @param {Integer} param1 
     * @param {Pointer<D3D_FEATURE_LEVEL>} param2 
     * @param {Integer} FeatureLevels 
     * @param {Pointer<IUnknown>} param4 
     * @param {Integer} NumQueues 
     * @param {Integer} param6 
     * @param {Pointer<ID3D11Device>} param7 
     * @param {Pointer<ID3D11DeviceContext>} param8 
     * @param {Pointer<D3D_FEATURE_LEVEL>} param9 
     * @returns {HRESULT} 
     */
    Call(param0, param1, param2, FeatureLevels, param4, NumQueues, param6, param7, param8, param9) {
        param2Marshal := param2 is VarRef ? "int*" : "ptr"
        param9Marshal := param9 is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, "ptr", param0, UInt32, param1, param2Marshal, param2, UInt32, FeatureLevels, IUnknown.Ptr, param4, UInt32, NumQueues, UInt32, param6, ID3D11Device.Ptr, param7, ID3D11DeviceContext.Ptr, param8, param9Marshal, param9, "HRESULT")
        return result
    }

    /**
     * A PFN_D3D11ON12_CREATE_DEVICE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_D3D11ON12_CREATE_DEVICE {
        /**
         * Creates a PFN_D3D11ON12_CREATE_DEVICE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, "int*", UInt32, IUnknown, UInt32, UInt32, ID3D11Device, ID3D11DeviceContext, "int*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 10)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 10 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, "int*", UInt32, IUnknown.Ptr, UInt32, UInt32, ID3D11Device.Ptr, ID3D11DeviceContext.Ptr, "int*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
