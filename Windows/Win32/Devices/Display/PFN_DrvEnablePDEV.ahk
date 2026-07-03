#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVINFO.ahk" { DEVINFO }
#Import ".\DHPDEV.ahk" { DHPDEV }
#Import ".\GDIINFO.ahk" { GDIINFO }
#Import ".\HDEV.ahk" { HDEV }
#Import ".\HSURF.ahk" { HSURF }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Graphics\Gdi\DEVMODEW.ahk" { DEVMODEW }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvEnablePDEV {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvEnablePDEV) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DEVMODEW>} param0 
     * @param {PWSTR} param1 
     * @param {Integer} param2 
     * @param {Pointer<HSURF>} param3 
     * @param {Integer} param4 
     * @param {Pointer<GDIINFO>} param5 
     * @param {Integer} param6 
     * @param {Pointer<DEVINFO>} param7 
     * @param {HDEV} param8 
     * @param {PWSTR} param9 
     * @param {HANDLE} param10 
     * @returns {DHPDEV} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10) {
        param1 := param1 is String ? StrPtr(param1) : param1
        param9 := param9 is String ? StrPtr(param9) : param9

        result := DllCall(this.value, DEVMODEW.Ptr, param0, "ptr", param1, UInt32, param2, HSURF.Ptr, param3, UInt32, param4, GDIINFO.Ptr, param5, UInt32, param6, DEVINFO.Ptr, param7, HDEV, param8, "ptr", param9, HANDLE, param10, DHPDEV)
        return result
    }

    /**
     * A PFN_DrvEnablePDEV that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvEnablePDEV {
        /**
         * Creates a PFN_DrvEnablePDEV pointer that invokes the given AHK function when called.
         * @param {Func(DEVMODEW, PWSTR, UInt32, HSURF, UInt32, GDIINFO, UInt32, DEVINFO, HDEV, PWSTR, HANDLE) => DHPDEV} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 11)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 11 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DEVMODEW.Ptr, PWSTR, UInt32, HSURF.Ptr, UInt32, GDIINFO.Ptr, UInt32, DEVINFO.Ptr, HDEV, PWSTR, HANDLE, DHPDEV])
        }

        __Delete() => CallbackFree(this.value)
    }
}
