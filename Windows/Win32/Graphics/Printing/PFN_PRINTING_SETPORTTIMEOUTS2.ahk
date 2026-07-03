#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Devices\Communication\COMMTIMEOUTS.ahk" { COMMTIMEOUTS }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PFN_PRINTING_SETPORTTIMEOUTS2 {
    value : IntPtr

    __value {
        set {
            if (value is PFN_PRINTING_SETPORTTIMEOUTS2) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} param0 
     * @param {Pointer<COMMTIMEOUTS>} param1 
     * @returns {BOOL} 
     */
    Call(param0, param1) {
        static param2 := 0 ;Reserved parameters must always be NULL

        result := DllCall(this.value, HANDLE, param0, COMMTIMEOUTS.Ptr, param1, UInt32, param2, BOOL)
        return result
    }

    /**
     * A PFN_PRINTING_SETPORTTIMEOUTS2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_PRINTING_SETPORTTIMEOUTS2 {
        /**
         * Creates a PFN_PRINTING_SETPORTTIMEOUTS2 pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, COMMTIMEOUTS) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, COMMTIMEOUTS.Ptr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
