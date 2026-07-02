#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Performs an operation that applies to a resource type.
 * @remarks
 * Some control codes should be handled by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-dlls">resource DLL</a>, 
 *      while others should be left to the Resource Monitor. For effective implementation strategies of the 
 *      <b>ResourceTypeControl</b> entry-point function, see 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/implementing-resourcetypecontrol">Implementing ResourceTypeControl</a>.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-presource_type_control_routine
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESOURCE_TYPE_CONTROL_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PRESOURCE_TYPE_CONTROL_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} ResourceTypeName Type of resource to be affected by the operation.
     * @param {Integer} ControlCode <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/about-control-codes">Control code</a> that represents the operation to be 
     *        performed. For a list of valid values for the <i>ControlCode</i> parameter, see 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-type-control-codes">Resource Type Control Codes</a>.
     * @param {Pointer<Void>} InBuffer Pointer to a buffer containing data to be used in the operation. <i>InBuffer</i> can be 
     *        <b>NULL</b> if the operation does not require data.
     * @param {Integer} InBufferSize Size, in bytes, of the buffer pointed to by <i>InBuffer</i>.
     * @param {Pointer<Void>} OutBuffer Pointer to a buffer containing data resulting from the operation. <i>OutBuffer</i> can be 
     *        <b>NULL</b> if the operation returns no data.
     * @param {Integer} OutBufferSize Size, in bytes, of the available space pointed to by <i>OutBuffer</i>.
     * @param {Pointer<Integer>} BytesReturned Number of bytes in the buffer pointed to by <i>OutBuffer</i> that actually contain 
     *        data.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function returns a 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>. The following is a possible error 
     *        code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource DLL requested that the 
     *          <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-monitor">Resource Monitor</a> perform default processing (if any) 
     *          for <i>ControlCode</i> in addition to processing supplied by the DLL (if any).
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(ResourceTypeName, ControlCode, InBuffer, InBufferSize, OutBuffer, OutBufferSize, BytesReturned) {
        ResourceTypeName := ResourceTypeName is String ? StrPtr(ResourceTypeName) : ResourceTypeName

        InBufferMarshal := InBuffer is VarRef ? "ptr" : "ptr"
        OutBufferMarshal := OutBuffer is VarRef ? "ptr" : "ptr"
        BytesReturnedMarshal := BytesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, "ptr", ResourceTypeName, UInt32, ControlCode, InBufferMarshal, InBuffer, UInt32, InBufferSize, OutBufferMarshal, OutBuffer, UInt32, OutBufferSize, BytesReturnedMarshal, BytesReturned, UInt32)
        return result
    }

    /**
     * A PRESOURCE_TYPE_CONTROL_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESOURCE_TYPE_CONTROL_ROUTINE {
        /**
         * Creates a PRESOURCE_TYPE_CONTROL_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, UInt32, "ptr", UInt32, "ptr", UInt32, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, UInt32, "ptr", UInt32, "ptr", UInt32, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
