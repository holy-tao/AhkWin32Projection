#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DLLVERSIONINFO.ahk" { DLLVERSIONINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Implemented by many of the Windows Shell DLLs to allow applications to obtain DLL-specific version information.
 * @remarks
 * This function is exported by name from each DLL that implements it. Currently, most of the Windows Shell and controls DLLs implement <b>DllGetVersion</b>. These include, but are not limited to, Shell32.dll, Comctl32.dll, Shdocvw.dll, and Shlwapi.dll.
 * 
 * To call this function, use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> functions to obtain the function pointer. The DLLGETVERSIONPROC type is used as the data type to define a pointer to a <b>DllGetVersion</b> function. Use the pointer when calling the function dynamically by loading the library and getting the function's address. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb776779(v=vs.85)">Shell and Shlwapi DLL Versions</a> for a detailed discussion of the different file versions, and how to use <b>DllGetVersion</b>.
 * @see https://learn.microsoft.com/windows/win32/api/shlwapi/nc-shlwapi-dllgetversionproc
 * @namespace Windows.Win32.UI.Shell
 */
export default struct DLLGETVERSIONPROC {
    value : IntPtr

    __value {
        set {
            if (value is DLLGETVERSIONPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DLLVERSIONINFO>} param0 
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this callback function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     */
    Call(param0) {
        result := DllCall(this.value, DLLVERSIONINFO.Ptr, param0, "HRESULT")
        return result
    }

    /**
     * A DLLGETVERSIONPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DLLGETVERSIONPROC {
        /**
         * Creates a DLLGETVERSIONPROC pointer that invokes the given AHK function when called.
         * @param {Func(DLLVERSIONINFO) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DLLVERSIONINFO.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
