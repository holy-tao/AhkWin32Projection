#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Performs an operation that applies to a resource.
 * @remarks
 * Some control codes should be handled by the resource DLL, while others should be left to the Resource Monitor. 
 *      For effective implementation strategies of the 
 *      <i>ResourceControl</i> entry-point function, see 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/implementing-resourcecontrol">Implementing ResourceControl</a>.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-presource_control_routine
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESOURCE_CONTROL_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PRESOURCE_CONTROL_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} Resource Resource identifier of the affected resource.
     * @param {Integer} ControlCode <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/about-control-codes">Control code</a> that represents the operation to be 
     *        performed. For a list of valid values for the <i>ControlCode</i> parameter, see 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-type-control-codes">Resource Type Control Codes</a>.
     * @param {Pointer<Void>} InBuffer Pointer to a buffer containing data to be used in the operation. <i>InBuffer</i> can be 
     *        <b>NULL</b> if no data is required.
     * @param {Integer} InBufferSize Size, in bytes, of the buffer pointed to by <i>InBuffer</i>.
     * @param {Pointer<Void>} OutBuffer Pointer to a buffer containing data resulting from the operation. <i>OutBuffer</i> can be 
     *        <b>NULL</b> if the operation does not need to return data.
     * @param {Integer} OutBufferSize Size, in bytes, of the available space pointed to by <i>OutBuffer</i>.
     * @param {Pointer<Integer>} BytesReturned Actual size, in bytes, of the data resulting from the operation.
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
     * The operation associated with <i>ControlCode</i> was completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FUNCTION</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-dlls">resource DLL</a> requested that the 
     *          <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-monitor">Resource Monitor</a> perform default processing (if any) 
     *          for <i>ControlCode</i> in addition to processing supplied by the DLL (if any).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * <dt>234 (0xEA)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The allocated size of <i>OutBuffer</i> was too small to hold the requested data. 
     *          <i>BytesReturned</i> indicates the required size. Always include the terminating 
     *          <b>NULL</b> when calculating the byte sizes of strings.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_RESOURCE_PROPERTIES_STORED</b></dt>
     * <dt>5024 (0x13A0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that new property values for a resource have been set in the cluster database, but the properties 
     *          have not yet taken effect. The new property values will be applied after the resource is taken offline and 
     *          brought online.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">Error code</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was unsuccessful.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(Resource, ControlCode, InBuffer, InBufferSize, OutBuffer, OutBufferSize, BytesReturned) {
        ResourceMarshal := Resource is VarRef ? "ptr" : "ptr"
        InBufferMarshal := InBuffer is VarRef ? "ptr" : "ptr"
        OutBufferMarshal := OutBuffer is VarRef ? "ptr" : "ptr"
        BytesReturnedMarshal := BytesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, ResourceMarshal, Resource, UInt32, ControlCode, InBufferMarshal, InBuffer, UInt32, InBufferSize, OutBufferMarshal, OutBuffer, UInt32, OutBufferSize, BytesReturnedMarshal, BytesReturned, UInt32)
        return result
    }

    /**
     * A PRESOURCE_CONTROL_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESOURCE_CONTROL_ROUTINE {
        /**
         * Creates a PRESOURCE_CONTROL_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, "ptr", UInt32, "ptr", UInt32, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, "ptr", UInt32, "ptr", UInt32, "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
