#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct PFN_D3D12_GET_DEBUG_INTERFACE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_D3D12_GET_DEBUG_INTERFACE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Guid>} param0 
     * @returns {Pointer<Void>} 
     */
    Call(param0) {
        result := DllCall(this.value, Guid.Ptr, param0, "ptr*", &param1 := 0, "HRESULT")
        return param1
    }

    /**
     * A PFN_D3D12_GET_DEBUG_INTERFACE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_D3D12_GET_DEBUG_INTERFACE {
        /**
         * Creates a PFN_D3D12_GET_DEBUG_INTERFACE pointer that invokes the given AHK function when called.
         * @param {Func(Guid) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
