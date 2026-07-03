#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DEBUG_POOL_REGION.ahk" { DEBUG_POOL_REGION }
#Import ".\IDebugClient.ahk" { IDebugClient }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PGET_POOL_REGION {
    value : IntPtr

    __value {
        set {
            if (value is PGET_POOL_REGION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IDebugClient} Client 
     * @param {Integer} Pool 
     * @param {Pointer<DEBUG_POOL_REGION>} PoolRegion 
     * @returns {HRESULT} 
     */
    Call(Client, Pool, PoolRegion) {
        PoolRegionMarshal := PoolRegion is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, "ptr", Client, Int64, Pool, PoolRegionMarshal, PoolRegion, "HRESULT")
        return result
    }

    /**
     * A PGET_POOL_REGION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGET_POOL_REGION {
        /**
         * Creates a PGET_POOL_REGION pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int64, "int*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Int64, "int*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
