#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * An application-defined callback function used with the EnumProps function. (Unicode)
 * @remarks
 * The following restrictions apply to this callback function: 
 * 
 * <ul>
 * <li>The callback function can call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-removepropa">RemoveProp</a> function. However, <b>RemoveProp</b> can remove only the property passed to the callback function through the callback function's parameters. </li>
 * <li>The callback function should not attempt to add properties. </li>
 * </ul>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winuser.h header defines PROPENUMPROC as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nc-winuser-propenumprocw
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @charset Unicode
 */
export default struct PROPENUMPROCW {
    value : IntPtr

    __value {
        set {
            if (value is PROPENUMPROCW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} param0 Type: <b>HWND</b>
     * 
     * A handle to the window whose property list is being enumerated.
     * @param {PWSTR} param1 Type: <b>LPCTSTR</b>
     * 
     * The string component of a property list entry. This is the string that was specified, along with a data handle, when the property was added to the window's property list via a call to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setpropa">SetProp</a> function.
     * @param {HANDLE} param2 Type: <b>HANDLE</b>
     * 
     * A handle to the data. This handle is the data component of a property list entry.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Return <b>TRUE</b> to continue the property list enumeration.
     * 
     * Return <b>FALSE</b> to stop the property list enumeration.
     */
    Call(param0, param1, param2) {
        param1 := param1 is String ? StrPtr(param1) : param1

        result := DllCall(this.value, HWND, param0, "ptr", param1, HANDLE, param2, BOOL)
        return result
    }

    /**
     * A PROPENUMPROCW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PROPENUMPROCW {
        /**
         * Creates a PROPENUMPROCW pointer that invokes the given AHK function when called.
         * @param {Func(HWND, PWSTR, HANDLE) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, PWSTR, HANDLE, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
