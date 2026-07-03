#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct PFN_D3D12_COMPILER_CREATE_FACTORY {
    value : IntPtr

    __value {
        set {
            if (value is PFN_D3D12_COMPILER_CREATE_FACTORY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} pPluginCompilerDllPath 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    Call(pPluginCompilerDllPath, riid) {
        pPluginCompilerDllPath := pPluginCompilerDllPath is String ? StrPtr(pPluginCompilerDllPath) : pPluginCompilerDllPath

        result := DllCall(this.value, "ptr", pPluginCompilerDllPath, Guid.Ptr, riid, "ptr*", &ppFactory := 0, "HRESULT")
        return ppFactory
    }

    /**
     * A PFN_D3D12_COMPILER_CREATE_FACTORY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_D3D12_COMPILER_CREATE_FACTORY {
        /**
         * Creates a PFN_D3D12_COMPILER_CREATE_FACTORY pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, Guid) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, Guid.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
