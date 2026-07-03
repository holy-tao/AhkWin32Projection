#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_W_DATA.ahk" { DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_W_DATA }

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @charset Unicode
 */
export default struct LPFNDIRECTSOUNDDEVICEENUMERATECALLBACKW {
    value : IntPtr

    __value {
        set {
            if (value is LPFNDIRECTSOUNDDEVICEENUMERATECALLBACKW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_W_DATA>} param0 
     * @param {Pointer<Void>} param1 
     * @returns {BOOL} 
     */
    Call(param0, param1) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_W_DATA.Ptr, param0, param1Marshal, param1, BOOL)
        return result
    }

    /**
     * A LPFNDIRECTSOUNDDEVICEENUMERATECALLBACKW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFNDIRECTSOUNDDEVICEENUMERATECALLBACKW {
        /**
         * Creates a LPFNDIRECTSOUNDDEVICEENUMERATECALLBACKW pointer that invokes the given AHK function when called.
         * @param {Func(DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_W_DATA, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_W_DATA.Ptr, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
