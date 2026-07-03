#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\IDebugClient.ahk" { IDebugClient }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PGET_FULL_IMAGE_NAME {
    value : IntPtr

    __value {
        set {
            if (value is PGET_FULL_IMAGE_NAME) {
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
     * @param {Integer} Process 
     * @param {Pointer<PSTR>} FullImageName 
     * @returns {HRESULT} 
     */
    Call(Client, Process, FullImageName) {
        FullImageNameMarshal := FullImageName is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, "ptr", Client, Int64, Process, FullImageNameMarshal, FullImageName, "HRESULT")
        return result
    }

    /**
     * A PGET_FULL_IMAGE_NAME that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGET_FULL_IMAGE_NAME {
        /**
         * Creates a PGET_FULL_IMAGE_NAME pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int64, PSTR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Int64, PSTR.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
