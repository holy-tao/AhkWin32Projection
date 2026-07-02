#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_1_DATA.ahk" { DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_1_DATA }

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct LPFNDIRECTSOUNDDEVICEENUMERATECALLBACK1 {
    value : IntPtr

    __value {
        set {
            if (value is LPFNDIRECTSOUNDDEVICEENUMERATECALLBACK1) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_1_DATA>} param0 
     * @param {Pointer<Void>} param1 
     * @returns {BOOL} 
     */
    Call(param0, param1) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_1_DATA.Ptr, param0, param1Marshal, param1, BOOL)
        return result
    }

    /**
     * A LPFNDIRECTSOUNDDEVICEENUMERATECALLBACK1 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFNDIRECTSOUNDDEVICEENUMERATECALLBACK1 {
        /**
         * Creates a LPFNDIRECTSOUNDDEVICEENUMERATECALLBACK1 pointer that invokes the given AHK function when called.
         * @param {Func(DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_1_DATA, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_1_DATA.Ptr, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
