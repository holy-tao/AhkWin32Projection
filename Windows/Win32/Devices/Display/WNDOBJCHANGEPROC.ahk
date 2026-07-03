#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WNDOBJ.ahk" { WNDOBJ }

/**
 * The **WNDOBJCHANGEPROC** function is a driver-defined callback function that GDI uses to notify the driver of changes to the window in question.
 * @remarks
 * The *pfn* parameter of the [EngCreateWnd](/windows/win32/api/winddi/nf-winddi-engcreatewnd) function points to this function.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nc-winddi-wndobjchangeproc
 * @namespace Windows.Win32.Devices.Display
 */
export default struct WNDOBJCHANGEPROC {
    value : IntPtr

    __value {
        set {
            if (value is WNDOBJCHANGEPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WNDOBJ>} pwo Pointer to a [WNDOBJ](/windows/win32/api/winddi/ns-winddi-wndobj) structure defining the window object that is currently changing. The window object contains the new size and position of the window. If *fl* is **WOC_CHANGED**, then this parameter is **NULL**.
     * @param {Integer} fl 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pwo, fl) {
        DllCall(this.value, WNDOBJ.Ptr, pwo, UInt32, fl)
    }

    /**
     * A WNDOBJCHANGEPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WNDOBJCHANGEPROC {
        /**
         * Creates a WNDOBJCHANGEPROC pointer that invokes the given AHK function when called.
         * @param {Func(WNDOBJ, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WNDOBJ.Ptr, UInt32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
