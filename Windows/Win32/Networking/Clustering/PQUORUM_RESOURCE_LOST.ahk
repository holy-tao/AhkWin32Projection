#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Called when control of the quorum resource has been lost.
 * @remarks
 * The <i>QuorumResourceLost</i> callback function is 
 *      called by a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-dlls">resource DLL</a> to notify the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-monitor">Resource Monitor</a> that control of the quorum resource has 
 *      been lost after arbitration. A pointer to the Resource Monitor's 
 *      <i>QuorumResourceLost</i> callback function is passed to 
 *      a quorum resource DLL in the call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-parbitrate_routine">Arbitrate</a>.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-pquorum_resource_lost
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PQUORUM_RESOURCE_LOST {
    value : IntPtr

    __value {
        set {
            if (value is PQUORUM_RESOURCE_LOST) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} Resource 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Resource) {
        DllCall(this.value, IntPtr, Resource)
    }

    /**
     * A PQUORUM_RESOURCE_LOST that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PQUORUM_RESOURCE_LOST {
        /**
         * Creates a PQUORUM_RESOURCE_LOST pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
