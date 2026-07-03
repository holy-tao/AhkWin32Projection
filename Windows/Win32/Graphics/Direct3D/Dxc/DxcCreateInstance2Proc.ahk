#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IMalloc.ahk" { IMalloc }

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
export default struct DxcCreateInstance2Proc {
    value : IntPtr

    __value {
        set {
            if (value is DxcCreateInstance2Proc) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IMalloc} pMalloc 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    Call(pMalloc, rclsid, riid) {
        result := DllCall(this.value, "ptr", pMalloc, Guid.Ptr, rclsid, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * A DxcCreateInstance2Proc that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DxcCreateInstance2Proc {
        /**
         * Creates a DxcCreateInstance2Proc pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Guid, Guid) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Guid.Ptr, Guid.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
