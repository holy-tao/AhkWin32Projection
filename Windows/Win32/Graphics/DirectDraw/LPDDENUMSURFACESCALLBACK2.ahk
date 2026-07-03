#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDSURFACEDESC2.ahk" { DDSURFACEDESC2 }
#Import ".\IDirectDrawSurface4.ahk" { IDirectDrawSurface4 }

/**
 * The LPDDENUMSURFACESCALLBACK2 function (ddraw.h) is superseded by the EnumSurfacesCallback7 function.
 * @remarks
 * You can use the LPDDENUMSURFACESCALLBACK2 data type to declare a variable that can contain a pointer to this callback function.
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/nc-ddraw-lpddenumsurfacescallback2
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDENUMSURFACESCALLBACK2 {
    value : IntPtr

    __value {
        set {
            if (value is LPDDENUMSURFACESCALLBACK2) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IDirectDrawSurface4} param0 A pointer to the <b>IDirectDrawSurface4</b> interface of the attached surface.
     * @param {Pointer<DDSURFACEDESC2>} param1 A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550340(v=vs.85)">DDSURFACEDESC2</a> structure that describes the attached surface.
     * @param {Pointer<Void>} param2 A pointer to an application-defined structure to be passed to the callback function each time that the function is called.
     * @returns {HRESULT} The callback function returns DDENUMRET_OK to continue the enumeration.
     * 
     * It returns DDENUMRET_CANCEL to stop the enumeration.
     */
    Call(param0, param1, param2) {
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", param0, DDSURFACEDESC2.Ptr, param1, param2Marshal, param2, "HRESULT")
        return result
    }

    /**
     * A LPDDENUMSURFACESCALLBACK2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDENUMSURFACESCALLBACK2 {
        /**
         * Creates a LPDDENUMSURFACESCALLBACK2 pointer that invokes the given AHK function when called.
         * @param {Func("ptr", DDSURFACEDESC2, "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", DDSURFACEDESC2.Ptr, "ptr", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
