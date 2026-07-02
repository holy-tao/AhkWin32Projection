#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HREGREADBATCH.ahk" { HREGREADBATCH }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSTER_REG_READ_BATCH_ADD_COMMAND {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSTER_REG_READ_BATCH_ADD_COMMAND) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HREGREADBATCH} _hRegReadBatch 
     * @param {PWSTR} wzSubkeyName 
     * @param {PWSTR} wzValueName 
     * @returns {Integer} 
     */
    Call(_hRegReadBatch, wzSubkeyName, wzValueName) {
        wzSubkeyName := wzSubkeyName is String ? StrPtr(wzSubkeyName) : wzSubkeyName
        wzValueName := wzValueName is String ? StrPtr(wzValueName) : wzValueName

        result := DllCall(this.value, HREGREADBATCH, _hRegReadBatch, "ptr", wzSubkeyName, "ptr", wzValueName, Int32)
        return result
    }

    /**
     * A PCLUSTER_REG_READ_BATCH_ADD_COMMAND that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSTER_REG_READ_BATCH_ADD_COMMAND {
        /**
         * Creates a PCLUSTER_REG_READ_BATCH_ADD_COMMAND pointer that invokes the given AHK function when called.
         * @param {Func(HREGREADBATCH, PWSTR, PWSTR) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HREGREADBATCH, PWSTR, PWSTR, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
