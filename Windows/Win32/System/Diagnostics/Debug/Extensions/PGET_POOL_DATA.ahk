#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEBUG_POOL_DATA.ahk" { DEBUG_POOL_DATA }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugClient.ahk" { IDebugClient }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PGET_POOL_DATA {
    value : IntPtr

    __value {
        set {
            if (value is PGET_POOL_DATA) {
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
     * @param {Pointer<DEBUG_POOL_DATA>} PoolData 
     * @returns {HRESULT} 
     */
    Call(Client, Pool, PoolData) {
        result := DllCall(this.value, "ptr", Client, Int64, Pool, DEBUG_POOL_DATA.Ptr, PoolData, "HRESULT")
        return result
    }

    /**
     * A PGET_POOL_DATA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGET_POOL_DATA {
        /**
         * Creates a PGET_POOL_DATA pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int64, DEBUG_POOL_DATA) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Int64, DEBUG_POOL_DATA.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
