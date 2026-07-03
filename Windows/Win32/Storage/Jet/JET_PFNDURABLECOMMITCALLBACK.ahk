#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JET_COMMIT_ID.ahk" { JET_COMMIT_ID }
#Import ".\JET_INSTANCE.ahk" { JET_INSTANCE }

/**
 * Learn more about: JET_PFNDURABLECOMMITCALLBACK delegate
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-pfndurablecommitcallback-delegate
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_PFNDURABLECOMMITCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is JET_PFNDURABLECOMMITCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {JET_INSTANCE} instance 
     * @param {Pointer<JET_COMMIT_ID>} pCommitIdSeen 
     * @param {Integer} grbit 
     * @returns {Integer} 
     */
    Call(instance, pCommitIdSeen, grbit) {
        result := DllCall(this.value, JET_INSTANCE, instance, JET_COMMIT_ID.Ptr, pCommitIdSeen, UInt32, grbit, Int32)
        return result
    }

    /**
     * A JET_PFNDURABLECOMMITCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends JET_PFNDURABLECOMMITCALLBACK {
        /**
         * Creates a JET_PFNDURABLECOMMITCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(JET_INSTANCE, JET_COMMIT_ID, UInt32) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [JET_INSTANCE, JET_COMMIT_ID.Ptr, UInt32, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
