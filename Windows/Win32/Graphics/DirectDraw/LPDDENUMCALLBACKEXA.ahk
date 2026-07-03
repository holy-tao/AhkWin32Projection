#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\Gdi\HMONITOR.ahk" { HMONITOR }

/**
 * The DDEnumCallbackEx function is an application-defined callback function for the DirectDrawEnumerateEx function. (ANSI)
 * @remarks
 * After the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-directdrawenumerateexa">DirectDrawEnumerateEx</a> function completes, the pointer to the GUID at <i>lpGUID</i> is no longer valid. You must save a copy of the GUID structure itself, not the pointer, or the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-directdrawcreateex">DirectDrawCreateEx</a> function fails.
 * 
 * You can use the LPDDENUMCALLBACKEX data type to declare a variable that can contain a pointer to this callback function.
 * 
 * If UNICODE is defined, the string values are returned as type LPWSTR, rather than LPSTR.
 * 
 * > [!NOTE]
 * > The ddraw.h header defines LPDDENUMCALLBACKEX as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/nc-ddraw-lpddenumcallbackexa
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @charset ANSI
 */
export default struct LPDDENUMCALLBACKEXA {
    value : IntPtr

    __value {
        set {
            if (value is LPDDENUMCALLBACKEXA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Guid>} param0 A pointer to the unique identifier of the DirectDraw object.
     * @param {PSTR} param1 Address of a string that contains the driver name.
     * @param {PSTR} param2 Address of a string that contains the driver description.
     * @param {Pointer<Void>} param3 A pointer to an application-defined structure to be passed to the callback function each time that the function is called.
     * @param {HMONITOR} param4 Handle of the monitor that is associated with the enumerated DirectDraw object. This parameter is NULL when the enumerated DirectDraw object is for the primary device, a nondisplay device (such as a 3-D accelerator with no 2-D capabilities), or devices not attached to the desktop.
     * @returns {BOOL} The callback function returns nonzero to continue the enumeration.
     * 
     * It returns zero to stop the enumeration.
     */
    Call(param0, param1, param2, param3, param4) {
        param1 := param1 is String ? StrPtr(param1) : param1
        param2 := param2 is String ? StrPtr(param2) : param2

        param3Marshal := param3 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, Guid.Ptr, param0, "ptr", param1, "ptr", param2, param3Marshal, param3, HMONITOR, param4, BOOL)
        return result
    }

    /**
     * A LPDDENUMCALLBACKEXA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDENUMCALLBACKEXA {
        /**
         * Creates a LPDDENUMCALLBACKEXA pointer that invokes the given AHK function when called.
         * @param {Func(Guid, PSTR, PSTR, "ptr", HMONITOR) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, PSTR, PSTR, "ptr", HMONITOR, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
