#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Graphics\Gdi\HRGN.ahk" { HRGN }
#Import ".\MAGIMAGEHEADER.ahk" { MAGIMAGEHEADER }

/**
 * Prototype for a callback function that implements a custom transform for image scaling.
 * @see https://learn.microsoft.com/windows/win32/api/magnification/nc-magnification-magimagescalingcallback
 * @namespace Windows.Win32.UI.Magnification
 */
export default struct MagImageScalingCallback {
    value : IntPtr

    __value {
        set {
            if (value is MagImageScalingCallback) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The magnification window.
     * @param {Pointer<Void>} srcdata Type: <b>void*</b>
     * 
     * The input data.
     * @param {MAGIMAGEHEADER} srcheader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/magnification/ns-magnification-magimageheader">MAGIMAGEHEADER</a></b>
     * 
     * The description of the input format.
     * @param {Pointer<Void>} destdata Type: <b>void*</b>
     * 
     * The output data.
     * @param {MAGIMAGEHEADER} destheader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/magnification/ns-magnification-magimageheader">MAGIMAGEHEADER</a></b>
     * 
     * The description of the output format.
     * @param {RECT} unclipped Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * The coordinates of the scaled version of the source bitmap.
     * @param {RECT} clipped Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * The coordinates of the window to which the scaled bitmap is clipped.
     * @param {HRGN} dirty Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRGN</a></b>
     * 
     * The region that needs to be refreshed.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
     */
    Call(_hwnd, srcdata, srcheader, destdata, destheader, unclipped, clipped, dirty) {
        srcdataMarshal := srcdata is VarRef ? "ptr" : "ptr"
        destdataMarshal := destdata is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HWND, _hwnd, srcdataMarshal, srcdata, MAGIMAGEHEADER, srcheader, destdataMarshal, destdata, MAGIMAGEHEADER, destheader, RECT, unclipped, RECT, clipped, HRGN, dirty, BOOL)
        return result
    }

    /**
     * A MagImageScalingCallback that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MagImageScalingCallback {
        /**
         * Creates a MagImageScalingCallback pointer that invokes the given AHK function when called.
         * @param {Func(HWND, "ptr", MAGIMAGEHEADER, "ptr", MAGIMAGEHEADER, RECT, RECT, HRGN) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, "ptr", MAGIMAGEHEADER, "ptr", MAGIMAGEHEADER, RECT, RECT, HRGN, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
