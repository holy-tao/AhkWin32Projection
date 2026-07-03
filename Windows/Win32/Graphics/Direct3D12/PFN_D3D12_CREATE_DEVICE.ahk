#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Direct3D\D3D_FEATURE_LEVEL.ahk" { D3D_FEATURE_LEVEL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct PFN_D3D12_CREATE_DEVICE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_D3D12_CREATE_DEVICE) {
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
     * @param {D3D_FEATURE_LEVEL} param1 
     * @param {Pointer<Guid>} param2 
     * @returns {Pointer<Void>} 
     */
    Call(param0, param1, param2) {
        result := DllCall(this.value, "ptr", param0, D3D_FEATURE_LEVEL, param1, Guid.Ptr, param2, "ptr*", &param3 := 0, "HRESULT")
        return param3
    }

    /**
     * A PFN_D3D12_CREATE_DEVICE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_D3D12_CREATE_DEVICE {
        /**
         * Creates a PFN_D3D12_CREATE_DEVICE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", D3D_FEATURE_LEVEL, Guid) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", D3D_FEATURE_LEVEL, Guid.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
