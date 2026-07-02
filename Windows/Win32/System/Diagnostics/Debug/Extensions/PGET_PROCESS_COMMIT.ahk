#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PROCESS_COMMIT_USAGE.ahk" { PROCESS_COMMIT_USAGE }
#Import ".\IDebugClient.ahk" { IDebugClient }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PGET_PROCESS_COMMIT {
    value : IntPtr

    __value {
        set {
            if (value is PGET_PROCESS_COMMIT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IDebugClient} Client 
     * @param {Pointer<Integer>} TotalCommitCharge 
     * @param {Pointer<Integer>} NumberOfProcesses 
     * @param {Pointer<Pointer<PROCESS_COMMIT_USAGE>>} CommitData 
     * @returns {HRESULT} 
     */
    Call(Client, TotalCommitCharge, NumberOfProcesses, CommitData) {
        TotalCommitChargeMarshal := TotalCommitCharge is VarRef ? "uint*" : "ptr"
        NumberOfProcessesMarshal := NumberOfProcesses is VarRef ? "uint*" : "ptr"
        CommitDataMarshal := CommitData is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, "ptr", Client, TotalCommitChargeMarshal, TotalCommitCharge, NumberOfProcessesMarshal, NumberOfProcesses, CommitDataMarshal, CommitData, "HRESULT")
        return result
    }

    /**
     * A PGET_PROCESS_COMMIT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGET_PROCESS_COMMIT {
        /**
         * Creates a PGET_PROCESS_COMMIT pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "uint*", "uint*", "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "uint*", "uint*", "ptr*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
