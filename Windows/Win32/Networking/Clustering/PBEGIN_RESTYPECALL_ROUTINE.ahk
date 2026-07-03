#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Starts a call to a resource control code. The PBEGIN_RESTYPECALL_ROUTINE type defines a pointer to this callback function.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-pbegin_restypecall_routine
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PBEGIN_RESTYPECALL_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PBEGIN_RESTYPECALL_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} ResourceTypeName The name of the resource type.
     * @param {Integer} ControlCode The control code to call.
     * @param {Pointer<Void>} InBuffer A pointer to the buffer that contains the input data for the call to the control code.
     * @param {Integer} InBufferSize The size of the buffer specified by <i>InBuffer</i>, in bytes.
     * @param {Pointer<Void>} OutBuffer A pointer to the buffer that contains the output data for the call to the control code.
     * @param {Integer} OutBufferSize The size of the buffer specified by <i>OutBuffer</i>, in bytes.
     * @param {Pointer<Integer>} BytesReturned The size of the data returned by <i>OutBuffer</i>, in bytes.
     * @param {Integer} _context The context to the resource type control code that was called.
     * 
     * <b>Windows Server 2012 R2:  </b>This parameter was added in Windows Server 2016.
     * @param {Pointer<BOOL>} ReturnedAsynchronously <b>TRUE</b> if the operation returns asynchronously; otherwise, <b>FALSE</b>.
     * 
     * <b>Windows Server 2012 R2:  </b>This parameter was added in Windows Server 2016.
     * @returns {Integer} The function returns one of the following values, or a system error code:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_RESOURCE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource ID was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested control code is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(ResourceTypeName, ControlCode, InBuffer, InBufferSize, OutBuffer, OutBufferSize, BytesReturned, _context, ReturnedAsynchronously) {
        ResourceTypeName := ResourceTypeName is String ? StrPtr(ResourceTypeName) : ResourceTypeName

        InBufferMarshal := InBuffer is VarRef ? "ptr" : "ptr"
        OutBufferMarshal := OutBuffer is VarRef ? "ptr" : "ptr"
        BytesReturnedMarshal := BytesReturned is VarRef ? "uint*" : "ptr"
        ReturnedAsynchronouslyMarshal := ReturnedAsynchronously is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, "ptr", ResourceTypeName, UInt32, ControlCode, InBufferMarshal, InBuffer, UInt32, InBufferSize, OutBufferMarshal, OutBuffer, UInt32, OutBufferSize, BytesReturnedMarshal, BytesReturned, Int64, _context, ReturnedAsynchronouslyMarshal, ReturnedAsynchronously, UInt32)
        return result
    }

    /**
     * A PBEGIN_RESTYPECALL_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PBEGIN_RESTYPECALL_ROUTINE {
        /**
         * Creates a PBEGIN_RESTYPECALL_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, UInt32, "ptr", UInt32, "ptr", UInt32, "uint*", Int64, BOOL) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 9)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 9 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, UInt32, "ptr", UInt32, "ptr", UInt32, "uint*", Int64, BOOL.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
