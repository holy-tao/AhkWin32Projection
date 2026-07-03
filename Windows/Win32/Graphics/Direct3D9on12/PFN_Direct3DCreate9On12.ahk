#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Direct3D9\IDirect3D9.ahk" { IDirect3D9 }
#Import ".\D3D9ON12_ARGS.ahk" { D3D9ON12_ARGS }

/**
 * @namespace Windows.Win32.Graphics.Direct3D9on12
 */
export default struct PFN_Direct3DCreate9On12 {
    value : IntPtr

    __value {
        set {
            if (value is PFN_Direct3DCreate9On12) {
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
     * @returns {IDirect3D9} 
     */
    Call(SDKVersion, pOverrideList, NumOverrideEntries) {
        result := DllCall(this.value, UInt32, SDKVersion, D3D9ON12_ARGS.Ptr, pOverrideList, UInt32, NumOverrideEntries, IDirect3D9)
        return result
    }

    /**
     * A PFN_Direct3DCreate9On12 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_Direct3DCreate9On12 {
        /**
         * Creates a PFN_Direct3DCreate9On12 pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, D3D9ON12_ARGS, UInt32) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, D3D9ON12_ARGS.Ptr, UInt32, "ptr"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
