#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The POFFLINE_V2_ROUTINE callback function marks a resource as unavailable for use after cleanup processing is complete.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-poffline_v2_routine
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct POFFLINE_V2_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is POFFLINE_V2_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} Resource A resource identifier for the resource to be taken offline.
     * @param {PWSTR} DestinationNodeName The name of the node that is to contain the resource when the operation completes.
     * @param {Integer} OfflineFlags 
     * @param {Integer} InBuffer A pointer to a buffer that contains  data for the operation; otherwise <b>NULL</b> if the operation does not require data.
     * @param {Integer} InBufferSize The size of the <i>InBuffer</i> parameter, in bytes.
     * @param {Integer} Reserved Reserved.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request completed successfully, and the resource is offline.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_PENDING</b></dt>
     * <dt>997 (0x3E5)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request is still pending, and a thread has been activated to process the offline request.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the operation was not successful for other reasons, 
     *        this function returns one of the 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
     */
    Call(Resource, DestinationNodeName, OfflineFlags, InBuffer, InBufferSize, Reserved) {
        DestinationNodeName := DestinationNodeName is String ? StrPtr(DestinationNodeName) : DestinationNodeName

        ResourceMarshal := Resource is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, ResourceMarshal, Resource, "ptr", DestinationNodeName, UInt32, OfflineFlags, IntPtr, InBuffer, UInt32, InBufferSize, UInt32, Reserved, UInt32)
        return result
    }

    /**
     * A POFFLINE_V2_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends POFFLINE_V2_ROUTINE {
        /**
         * Creates a POFFLINE_V2_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PWSTR, UInt32, IntPtr, UInt32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PWSTR, UInt32, IntPtr, UInt32, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
