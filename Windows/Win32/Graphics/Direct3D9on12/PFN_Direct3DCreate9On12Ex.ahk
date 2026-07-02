#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D9ON12_ARGS.ahk" { D3D9ON12_ARGS }
#Import "..\Direct3D9\IDirect3D9Ex.ahk" { IDirect3D9Ex }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.Direct3D9on12
 */
export default struct PFN_Direct3DCreate9On12Ex {
    value : IntPtr

    __value {
        set {
            if (value is PFN_Direct3DCreate9On12Ex) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} SDKVersion 
     * @param {Pointer<D3D9ON12_ARGS>} pOverrideList 
     * @param {Integer} NumOverrideEntries 
     * @returns {IDirect3D9Ex} 
     */
    Call(SDKVersion, pOverrideList, NumOverrideEntries) {
        result := DllCall(this.value, UInt32, SDKVersion, D3D9ON12_ARGS.Ptr, pOverrideList, UInt32, NumOverrideEntries, "ptr*", &ppOutputInterface := 0, "HRESULT")
        return IDirect3D9Ex(ppOutputInterface)
    }

    /**
     * A PFN_Direct3DCreate9On12Ex that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_Direct3DCreate9On12Ex {
        /**
         * Creates a PFN_Direct3DCreate9On12Ex pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, D3D9ON12_ARGS, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, D3D9ON12_ARGS.Ptr, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
