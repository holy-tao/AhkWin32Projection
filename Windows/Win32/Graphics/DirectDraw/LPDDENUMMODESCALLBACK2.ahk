#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDSURFACEDESC2.ahk" { DDSURFACEDESC2 }

/**
 * The EnumModesCallback2 function is an application-defined callback function for the IDirectDraw7::EnumDisplayModes method.
 * @remarks
 * You can use the LPDDENUMMODESCALLBACK2 data type to declare a variable that can contain a pointer to this callback function.
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/nc-ddraw-lpddenummodescallback2
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDENUMMODESCALLBACK2 {
    value : IntPtr

    __value {
        set {
            if (value is LPDDENUMMODESCALLBACK2) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDSURFACEDESC2>} param0 A pointer to a read-only <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550340(v=vs.85)">DDSURFACEDESC2</a> structure that provides the monitor frequency and the mode that can be created.
     * @param {Pointer<Void>} param1 A pointer to an application-defined structure to be passed to the callback function each time that the function is called.
     * @returns {HRESULT} The callback function returns DDENUMRET_OK to continue the enumeration.
     * 
     * It returns DDENUMRET_CANCEL to stop the enumeration.
     */
    Call(param0, param1) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DDSURFACEDESC2.Ptr, param0, param1Marshal, param1, "HRESULT")
        return result
    }

    /**
     * A LPDDENUMMODESCALLBACK2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDENUMMODESCALLBACK2 {
        /**
         * Creates a LPDDENUMMODESCALLBACK2 pointer that invokes the given AHK function when called.
         * @param {Func(DDSURFACEDESC2, "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDSURFACEDESC2.Ptr, "ptr", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
