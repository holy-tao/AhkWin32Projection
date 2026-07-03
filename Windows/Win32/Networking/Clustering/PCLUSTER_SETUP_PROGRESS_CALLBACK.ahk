#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CLUSTER_SETUP_PHASE.ahk" { CLUSTER_SETUP_PHASE }
#Import ".\CLUSTER_SETUP_PHASE_SEVERITY.ahk" { CLUSTER_SETUP_PHASE_SEVERITY }
#Import ".\CLUSTER_SETUP_PHASE_TYPE.ahk" { CLUSTER_SETUP_PHASE_TYPE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSTER_SETUP_PROGRESS_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSTER_SETUP_PROGRESS_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pvCallbackArg 
     * @param {CLUSTER_SETUP_PHASE} eSetupPhase 
     * @param {CLUSTER_SETUP_PHASE_TYPE} ePhaseType 
     * @param {CLUSTER_SETUP_PHASE_SEVERITY} ePhaseSeverity 
     * @param {Integer} dwPercentComplete 
     * @param {PWSTR} lpszObjectName 
     * @param {Integer} dwStatus 
     * @returns {BOOL} 
     */
    Call(pvCallbackArg, eSetupPhase, ePhaseType, ePhaseSeverity, dwPercentComplete, lpszObjectName, dwStatus) {
        lpszObjectName := lpszObjectName is String ? StrPtr(lpszObjectName) : lpszObjectName

        pvCallbackArgMarshal := pvCallbackArg is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pvCallbackArgMarshal, pvCallbackArg, CLUSTER_SETUP_PHASE, eSetupPhase, CLUSTER_SETUP_PHASE_TYPE, ePhaseType, CLUSTER_SETUP_PHASE_SEVERITY, ePhaseSeverity, UInt32, dwPercentComplete, "ptr", lpszObjectName, UInt32, dwStatus, BOOL)
        return result
    }

    /**
     * A PCLUSTER_SETUP_PROGRESS_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSTER_SETUP_PROGRESS_CALLBACK {
        /**
         * Creates a PCLUSTER_SETUP_PROGRESS_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", CLUSTER_SETUP_PHASE, CLUSTER_SETUP_PHASE_TYPE, CLUSTER_SETUP_PHASE_SEVERITY, UInt32, PWSTR, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", CLUSTER_SETUP_PHASE, CLUSTER_SETUP_PHASE_TYPE, CLUSTER_SETUP_PHASE_SEVERITY, UInt32, PWSTR, UInt32, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
