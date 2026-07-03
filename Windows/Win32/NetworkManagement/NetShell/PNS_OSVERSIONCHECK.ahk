#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.NetShell
 */
export default struct PNS_OSVERSIONCHECK {
    value : IntPtr

    __value {
        set {
            if (value is PNS_OSVERSIONCHECK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} CIMOSType 
     * @param {Integer} CIMOSProductSuite 
     * @param {PWSTR} CIMOSVersion 
     * @param {PWSTR} CIMOSBuildNumber 
     * @param {PWSTR} CIMServicePackMajorVersion 
     * @param {PWSTR} CIMServicePackMinorVersion 
     * @param {Integer} uiReserved 
     * @param {Integer} dwReserved 
     * @returns {BOOL} 
     */
    Call(CIMOSType, CIMOSProductSuite, CIMOSVersion, CIMOSBuildNumber, CIMServicePackMajorVersion, CIMServicePackMinorVersion, uiReserved, dwReserved) {
        CIMOSVersion := CIMOSVersion is String ? StrPtr(CIMOSVersion) : CIMOSVersion
        CIMOSBuildNumber := CIMOSBuildNumber is String ? StrPtr(CIMOSBuildNumber) : CIMOSBuildNumber
        CIMServicePackMajorVersion := CIMServicePackMajorVersion is String ? StrPtr(CIMServicePackMajorVersion) : CIMServicePackMajorVersion
        CIMServicePackMinorVersion := CIMServicePackMinorVersion is String ? StrPtr(CIMServicePackMinorVersion) : CIMServicePackMinorVersion

        result := DllCall(this.value, UInt32, CIMOSType, UInt32, CIMOSProductSuite, "ptr", CIMOSVersion, "ptr", CIMOSBuildNumber, "ptr", CIMServicePackMajorVersion, "ptr", CIMServicePackMinorVersion, UInt32, uiReserved, UInt32, dwReserved, BOOL)
        return result
    }

    /**
     * A PNS_OSVERSIONCHECK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PNS_OSVERSIONCHECK {
        /**
         * Creates a PNS_OSVERSIONCHECK pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, PWSTR, PWSTR, PWSTR, PWSTR, UInt32, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, PWSTR, PWSTR, PWSTR, PWSTR, UInt32, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
