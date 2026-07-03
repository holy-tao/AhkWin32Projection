#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HMODULE.ahk" { HMODULE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * An application-defined callback function used with the EnumResourceNames and EnumResourceNamesEx functions. (ANSI)
 * @remarks
 * If <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-is_intresource">IS_INTRESOURCE</a>(<i>lpszType</i>) is <b>TRUE</b>, then <i>lpszType</i> specifies the integer identifier of the given resource type. Otherwise, it is a pointer to a null-terminated string. If the first character of the string is a pound sign (#), then the remaining characters represent a decimal number that specifies the integer identifier of the resource type. For example, the string "#258" represents the identifier 258.
 * 
 * Similarly, if <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-is_intresource">IS_INTRESOURCE</a>(<i>lpszName</i>) is <b>TRUE</b>, then <i>lpszName</i> specifies the integer identifier of the given resource. Otherwise, it is a pointer to a null-terminated string. If the first character of the string is a pound sign (#), then the remaining characters represent a decimal number that specifies the integer identifier of the resource.
 * 
 * An application must register this function by passing its address to the <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-enumresourcenamesa">EnumResourceNames</a> or <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-enumresourcenamesexa">EnumResourceNamesEx</a> function.
 * 
 * If the callback function returns <b>FALSE</b>, then <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-enumresourcenamesa">EnumResourceNames</a> or <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-enumresourcenamesexa">EnumResourceNamesEx</a> will stop enumeration and return <b>FALSE</b>. On Windows XP and earlier the value obtained from <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will be <b>ERROR_SUCCESS</b>; starting with Windows Vista, the last error value will be <b>ERROR_RESOURCE_ENUM_USER_STOP</b>.
 * 
 * > [!NOTE]
 * > The libloaderapi.h header defines ENUMRESNAMEPROC as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/libloaderapi/nc-libloaderapi-enumresnameproca
 * @namespace Windows.Win32.System.LibraryLoader
 * @charset ANSI
 */
export default struct ENUMRESNAMEPROCA {
    value : IntPtr

    __value {
        set {
            if (value is ENUMRESNAMEPROCA) {
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
     * A handle to the module whose executable file contains the resources that are being enumerated. If this parameter is <b>NULL</b>, the function enumerates the resource names in the module used to create the current process.
     * @param {PSTR} lpType Type: <b>LPCTSTR</b>
     * 
     * The type of resource for which the name is being enumerated. Alternately, rather than a pointer, this parameter can be <c>MAKEINTRESOURCE(ID)</c>, where ID is an integer value representing a predefined resource type. For standard resource types, see <a href="https://docs.microsoft.com/windows/desktop/menurc/resource-types">Resource Types</a>. For more information, see the Remarks section below.
     * @param {PSTR} lpName Type: <b>LPTSTR</b>
     * 
     * The name of a resource of the type being enumerated. Alternately, rather than a pointer, this parameter can be <c>MAKEINTRESOURCE(ID)</c>, where ID is the integer identifier of the resource. For more information, see the Remarks section below.
     * @param {Pointer} _lParam Type: <b>LONG_PTR</b>
     * 
     * An application-defined parameter passed to the <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-enumresourcenamesa">EnumResourceNames</a> or <a href="https://docs.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-enumresourcenamesexa">EnumResourceNamesEx</a> function. This parameter can be used in error checking.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns <b>TRUE</b> to continue enumeration or <b>FALSE</b> to stop enumeration.
     */
    Call(_hModule, lpType, lpName, _lParam) {
        lpType := lpType is String ? StrPtr(lpType) : lpType
        lpName := lpName is String ? StrPtr(lpName) : lpName

        result := DllCall(this.value, HMODULE, _hModule, "ptr", lpType, "ptr", lpName, IntPtr, _lParam, BOOL)
        return result
    }

    /**
     * A ENUMRESNAMEPROCA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ENUMRESNAMEPROCA {
        /**
         * Creates a ENUMRESNAMEPROCA pointer that invokes the given AHK function when called.
         * @param {Func(HMODULE, PSTR, PSTR, IntPtr) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HMODULE, PSTR, PSTR, IntPtr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
