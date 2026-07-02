#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CSEDB_RSTMAPW.ahk" { CSEDB_RSTMAPW }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct FNCERTSRVRESTOREREGISTERW {
    value : IntPtr

    __value {
        set {
            if (value is FNCERTSRVRESTOREREGISTERW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} hbc 
     * @param {PWSTR} pwszCheckPointFilePath 
     * @param {PWSTR} pwszLogPath 
     * @param {Pointer<CSEDB_RSTMAPW>} rgrstmap 
     * @param {Integer} crstmap 
     * @param {PWSTR} pwszBackupLogPath 
     * @param {Integer} genLow 
     * @param {Integer} genHigh 
     * @returns {HRESULT} 
     */
    Call(hbc, pwszCheckPointFilePath, pwszLogPath, rgrstmap, crstmap, pwszBackupLogPath, genLow, genHigh) {
        pwszCheckPointFilePath := pwszCheckPointFilePath is String ? StrPtr(pwszCheckPointFilePath) : pwszCheckPointFilePath
        pwszLogPath := pwszLogPath is String ? StrPtr(pwszLogPath) : pwszLogPath
        pwszBackupLogPath := pwszBackupLogPath is String ? StrPtr(pwszBackupLogPath) : pwszBackupLogPath

        hbcMarshal := hbc is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, hbcMarshal, hbc, "ptr", pwszCheckPointFilePath, "ptr", pwszLogPath, CSEDB_RSTMAPW.Ptr, rgrstmap, Int32, crstmap, "ptr", pwszBackupLogPath, UInt32, genLow, UInt32, genHigh, "HRESULT")
        return result
    }

    /**
     * A FNCERTSRVRESTOREREGISTERW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FNCERTSRVRESTOREREGISTERW {
        /**
         * Creates a FNCERTSRVRESTOREREGISTERW pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PWSTR, PWSTR, CSEDB_RSTMAPW, Int32, PWSTR, UInt32, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PWSTR, PWSTR, CSEDB_RSTMAPW.Ptr, Int32, PWSTR, UInt32, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
