#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDSURFACEDESC2.ahk" { DDSURFACEDESC2 }
#Import ".\IDirectDrawSurface7.ahk" { IDirectDrawSurface7 }

/**
 * The EnumSurfacesCallback7 function is an application-defined callback function for the IDirectDrawSurface7::EnumAttachedSurfaces and IDirectDrawSurface7::EnumOverlayZOrders methods.
 * @remarks
 * You can use the LPDDENUMSURFACESCALLBACK7 data type to declare a variable that can contain a pointer to this callback function.
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/nc-ddraw-lpddenumsurfacescallback7
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDENUMSURFACESCALLBACK7 {
    value : IntPtr

    __value {
        set {
            if (value is LPDDENUMSURFACESCALLBACK7) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IDirectDrawSurface7} param0 A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nn-ddraw-idirectdrawsurface7">IDirectDrawSurface7</a> interface of the attached surface.
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
     * A LPDDENUMSURFACESCALLBACK7 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDENUMSURFACESCALLBACK7 {
        /**
         * Creates a LPDDENUMSURFACESCALLBACK7 pointer that invokes the given AHK function when called.
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
