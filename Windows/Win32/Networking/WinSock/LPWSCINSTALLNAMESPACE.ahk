#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWSCINSTALLNAMESPACE {
    value : IntPtr

    __value {
        set {
            if (value is LPWSCINSTALLNAMESPACE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} lpszIdentifier 
     * @param {PWSTR} lpszPathName 
     * @param {Integer} dwNameSpace 
     * @param {Integer} dwVersion 
     * @param {Pointer<Guid>} lpProviderId 
     * @returns {Integer} 
     */
    Call(lpszIdentifier, lpszPathName, dwNameSpace, dwVersion, lpProviderId) {
        lpszIdentifier := lpszIdentifier is String ? StrPtr(lpszIdentifier) : lpszIdentifier
        lpszPathName := lpszPathName is String ? StrPtr(lpszPathName) : lpszPathName

        result := DllCall(this.value, "ptr", lpszIdentifier, "ptr", lpszPathName, UInt32, dwNameSpace, UInt32, dwVersion, Guid.Ptr, lpProviderId, Int32)
        return result
    }

    /**
     * A LPWSCINSTALLNAMESPACE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWSCINSTALLNAMESPACE {
        /**
         * Creates a LPWSCINSTALLNAMESPACE pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, UInt32, UInt32, Guid) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, UInt32, UInt32, Guid.Ptr, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
