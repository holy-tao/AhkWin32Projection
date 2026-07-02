#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
export default struct DxcCreateInstanceProc {
    value : IntPtr

    __value {
        set {
            if (value is DxcCreateInstanceProc) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    Call(rclsid, riid) {
        result := DllCall(this.value, Guid.Ptr, rclsid, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * A DxcCreateInstanceProc that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DxcCreateInstanceProc {
        /**
         * Creates a DxcCreateInstanceProc pointer that invokes the given AHK function when called.
         * @param {Func(Guid, Guid) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, Guid.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
