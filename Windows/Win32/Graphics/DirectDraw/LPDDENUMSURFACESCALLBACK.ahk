#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDSURFACEDESC.ahk" { DDSURFACEDESC }
#Import ".\IDirectDrawSurface.ahk" { IDirectDrawSurface }

/**
 * The LPDDENUMSURFACESCALLBACK function (ddraw.h) is superseded by the EnumSurfacesCallback7 function.
 * @remarks
 * You can use the LPDDENUMSURFACESCALLBACK data type to declare a variable that can contain a pointer to this callback function.
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/nc-ddraw-lpddenumsurfacescallback
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDENUMSURFACESCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is LPDDENUMSURFACESCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IDirectDrawSurface} param0 A pointer to the <b>IDirectDrawSurface</b> interface for the attached surface.
     * @param {Pointer<DDSURFACEDESC>} param1 A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/ddraw/ns-ddraw-ddsurfacedesc">DDSURFACEDESC</a> structure that describes the attached surface.
     * @param {Pointer<Void>} param2 A pointer to an application-defined structure to be passed to the callback function each time that the function is called.
     * @returns {HRESULT} The callback function returns DDENUMRET_OK to continue the enumeration.
     * 
     * It returns DDENUMRET_CANCEL to stop the enumeration.
     */
    Call(param0, param1, param2) {
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", param0, DDSURFACEDESC.Ptr, param1, param2Marshal, param2, "HRESULT")
        return result
    }

    /**
     * A LPDDENUMSURFACESCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDENUMSURFACESCALLBACK {
        /**
         * Creates a LPDDENUMSURFACESCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", DDSURFACEDESC, "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", DDSURFACEDESC.Ptr, "ptr", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
