#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HMODULE.ahk" { HMODULE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * An application-defined callback function used with the EnumResourceTypes and EnumResourceTypesEx functions. (ANSI)
 * @remarks
 * If <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-is_intresource">IS_INTRESOURCE</a>(<i>lpszType</i>) is <b>TRUE</b>, then <i>lpszType</i> specifies the integer identifier of the given resource type. Otherwise, it is a pointer to a null-terminated string. If the first character of the string is a pound sign (#), then the remaining characters represent a decimal number that specifies the integer identifier of the resource type. For example, the string "#258" represents the identifier 258.
 * 
 * An application must register this function by passing its address to the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-enumresourcetypesa">EnumResourceTypes</a> or <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-enumresourcetypesexa">EnumResourceTypesEx</a> function. 
 * 
 * If the callback function returns <b>FALSE</b>, then <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-enumresourcetypesa">EnumResourceTypes</a> or <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-enumresourcetypesexa">EnumResourceTypesEx</a> will stop enumeration and return <b>FALSE</b>. On Windows XP and earlier the value obtained from <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will be <b>ERROR_SUCCESS</b>; starting with Windows Vista, the last error value will be <b>ERROR_RESOURCE_ENUM_USER_STOP</b>.
 * 
 * > [!NOTE]
 * > The libloaderapi.h header defines ENUMRESTYPEPROC as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nc-libloaderapi-enumrestypeproca
 * @namespace Windows.Win32.System.LibraryLoader
 * @charset ANSI
 */
export default struct ENUMRESTYPEPROCA {
    value : IntPtr

    __value {
        set {
            if (value is ENUMRESTYPEPROCA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HMODULE} _hModule Type: <b>HMODULE</b>
     * 
     * A handle to the module whose executable file contains the resources for which the types are to be enumerated. If this parameter is <b>NULL</b>, the function enumerates the resource types in the module used to create the current process.
     * @param {PSTR} lpType Type: <b>LPTSTR</b>
     * 
     * The type of resource for which the type is being enumerated. 
     * 
     * Alternately, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a>(ID), where ID is the integer identifier of the given resource type. For standard resource types, see <a href="https://docs.microsoft.com/windows/desktop/menurc/resource-types">Resource Types</a>. For more information, see the Remarks section below.
     * @param {Pointer} _lParam Type: <b>LONG_PTR</b>
     * 
     * An application-defined parameter passed to the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-enumresourcetypesa">EnumResourceTypes</a> or <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-enumresourcetypesexa">EnumResourceTypesEx</a> function. This parameter can be used in error checking.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns <b>TRUE</b> to continue enumeration or <b>FALSE</b> to stop enumeration.
     */
    Call(_hModule, lpType, _lParam) {
        lpType := lpType is String ? StrPtr(lpType) : lpType

        result := DllCall(this.value, HMODULE, _hModule, "ptr", lpType, IntPtr, _lParam, BOOL)
        return result
    }

    /**
     * A ENUMRESTYPEPROCA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ENUMRESTYPEPROCA {
        /**
         * Creates a ENUMRESTYPEPROCA pointer that invokes the given AHK function when called.
         * @param {Func(HMODULE, PSTR, IntPtr) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HMODULE, PSTR, IntPtr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
