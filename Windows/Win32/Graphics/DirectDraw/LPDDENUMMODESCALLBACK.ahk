#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDSURFACEDESC.ahk" { DDSURFACEDESC }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Do not use. This callback function is superseded by the EnumModesCallback2 function that is used with the IDirectDraw7::EnumDisplayModes method.
 * @remarks
 * You can use the LPDDENUMMODESCALLBACK data type to declare a variable that can contain a pointer to this callback function.
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/nc-ddraw-lpddenummodescallback
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDENUMMODESCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is LPDDENUMMODESCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDSURFACEDESC>} param0 A pointer to a read-only <a href="https://docs.microsoft.com/windows/win32/api/ddraw/ns-ddraw-ddsurfacedesc">DDSURFACEDESC</a> structure that provides the monitor frequency and the mode that can be created.
     * @param {Pointer<Void>} param1 A pointer to an application-defined structure to be passed to the callback function each time that the function is called.
     * @returns {HRESULT} The callback function returns DDENUMRET_OK to continue the enumeration.
     * 
     * It returns DDENUMRET_CANCEL to stop the enumeration.
     */
    Call(param0, param1) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DDSURFACEDESC.Ptr, param0, param1Marshal, param1, "HRESULT")
        return result
    }

    /**
     * A LPDDENUMMODESCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDENUMMODESCALLBACK {
        /**
         * Creates a LPDDENUMMODESCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(DDSURFACEDESC, "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDSURFACEDESC.Ptr, "ptr", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
