#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct PFN_D3D12_GET_INTERFACE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_D3D12_GET_INTERFACE) {
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
     * @param {Pointer<Guid>} param1 
     * @returns {Pointer<Void>} 
     */
    Call(param0, param1) {
        result := DllCall(this.value, Guid.Ptr, param0, Guid.Ptr, param1, "ptr*", &param2 := 0, "HRESULT")
        return param2
    }

    /**
     * A PFN_D3D12_GET_INTERFACE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_D3D12_GET_INTERFACE {
        /**
         * Creates a PFN_D3D12_GET_INTERFACE pointer that invokes the given AHK function when called.
         * @param {Func(Guid, Guid) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, Guid.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
