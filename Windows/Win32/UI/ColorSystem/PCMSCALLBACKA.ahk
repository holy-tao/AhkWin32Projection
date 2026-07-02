#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\COLORMATCHSETUPA.ahk" { COLORMATCHSETUPA }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }

/**
 * \**PCMSCALLBACKA** (or **ApplyCallbackFunction**) is a callback function that you implement that updates the WCS configuration data while the dialog box displayed by the [**SetupColorMatchingW**](/windows/win32/api/icm/nf-icm-setupcolormatchingw) function is executing.
 * @remarks
 * The **ApplyCallbackFunction** function is used to change the WCS configuration for a device while the Color Management dialog box is displayed. The Color Management dialog box is displayed by the [**SetupColorMatchingW**](/windows/win32/api/icm/nf-icm-setupcolormatchingw) function.
 * 
 * If the callback function is provided, an **Apply** button is displayed in the lower right of the dialog box. When you select the **Apply** button, the callback function immediately updates the configuration for the device being set up. The Color Management dialog box remains on the screen.
 * 
 * An application supplies a callback function to WCS by storing the address of the callback function in the [**COLORMATCHSETUPW**](/windows/win32/api/icm/ns-icm-colormatchsetupw) structure that is passed to the [**SetupColorMatchingW**](/windows/win32/api/icm/nf-icm-setupcolormatchingw) function. The address is stored in the [**lPfnApplyCallback**](https://www.bing.com/search?q=**lPfnApplyCallback**) member of the **COLORMATCHSETUP** structure. The **dwFlags** member should be set to CMS\_USEAPPLYCALLBACK, or the callback function will be ignored.
 * 
 * A value supplied by the application may be passed to the callback function. Prior to invoking the [**SetupColorMatchingW**](/windows/win32/api/icm/nf-icm-setupcolormatchingw) function, the application can store a value in the [**lParamApplyCallback**](https://www.bing.com/search?q=**lParamApplyCallback**) member of the [**COLORMATCHSETUPW**](/windows/win32/api/icm/ns-icm-colormatchsetupw) structure. When the callback function is invoked, the value in the **lParamApplyCallback** structure member will be passed to the callback function in its *lParam* parameter.
 * 
 * The callback function is completely optional. If it is not supplied, the **Apply** button does not appear in the Color Management dialog box. Microsoft strongly recommends that your application supplies a callback function.
 * @see https://learn.microsoft.com/windows/win32/api/icm/nc-icm-pcmscallbacka
 * @namespace Windows.Win32.UI.ColorSystem
 * @charset ANSI
 */
export default struct PCMSCALLBACKA {
    value : IntPtr

    __value {
        set {
            if (value is PCMSCALLBACKA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<COLORMATCHSETUPA>} param0 Pointer to a [**COLORMATCHSETUPW**](/windows/win32/api/icm/ns-icm-colormatchsetupw) structure that contains WCS configuration data.
     * @param {LPARAM} param1 Contains a value supplied by the application.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. The callback function can set the extended error information by calling [SetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-setlasterror).
     */
    Call(param0, param1) {
        result := DllCall(this.value, COLORMATCHSETUPA.Ptr, param0, LPARAM, param1, BOOL)
        return result
    }

    /**
     * A PCMSCALLBACKA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCMSCALLBACKA {
        /**
         * Creates a PCMSCALLBACKA pointer that invokes the given AHK function when called.
         * @param {Func(COLORMATCHSETUPA, LPARAM) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [COLORMATCHSETUPA.Ptr, LPARAM, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
