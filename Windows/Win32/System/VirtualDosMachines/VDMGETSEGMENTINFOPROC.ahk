#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\VDM_SEGINFO.ahk" { VDM_SEGINFO }

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
export default struct VDMGETSEGMENTINFOPROC {
    value : IntPtr

    __value {
        set {
            if (value is VDMGETSEGMENTINFOPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {BOOL} param2 
     * @param {VDM_SEGINFO} param3 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3) {
        result := DllCall(this.value, UInt16, param0, UInt32, param1, BOOL, param2, VDM_SEGINFO, param3, BOOL)
        return result
    }

    /**
     * A VDMGETSEGMENTINFOPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends VDMGETSEGMENTINFOPROC {
        /**
         * Creates a VDMGETSEGMENTINFOPROC pointer that invokes the given AHK function when called.
         * @param {Func(UInt16, UInt32, BOOL, VDM_SEGINFO) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt16, UInt32, BOOL, VDM_SEGINFO, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
