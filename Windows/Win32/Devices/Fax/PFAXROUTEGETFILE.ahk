#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * A fax routing method calls the FaxRouteGetFile callback function to retrieve the name of a specific file from the fax file list associated with a received fax document.
 * @remarks
 * The fax routing method must call the <i>FaxRouteGetFile</i> function twice. The first time the routing method calls <i>FaxRouteGetFile</i> it must pass a null pointer in the <i>FileNameBuffer</i> parameter. The fax service sets the <i>RequiredSize</i> parameter to the size required for the <i>FileNameBuffer</i> parameter. The fax routing method must allocate the memory required for the buffer from the heap specified by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxroute/nf-faxroute-faxrouteinitialize">FaxRouteInitialize</a> function, and call <i>FaxRouteGetFile</i> again. The second time the routing method calls <i>FaxRouteGetFile</i> it must pass a valid pointer in the <i>FileNameBuffer</i> parameter.
 * 
 * The fax service passes a pointer to the <i>FaxRouteGetFile</i> callback function when the fax service calls <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxroute/nf-faxroute-faxrouteinitialize">FaxRouteInitialize</a>. The service passes the pointer in a <a href="https://docs.microsoft.com/windows/desktop/api/faxroute/ns-faxroute-fax_route_callbackroutines">FAX_ROUTE_CALLBACKROUTINES</a> structure.
 * 
 * The <b>PFAXROUTEGETFILE</b> data type is a pointer to a <i>FaxRouteGetFile</i> function.
 * 
 * For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-file-lists">Fax File Lists</a>.
 * @see https://learn.microsoft.com/windows/win32/api/faxroute/nc-faxroute-pfaxroutegetfile
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAXROUTEGETFILE {
    value : IntPtr

    __value {
        set {
            if (value is PFAXROUTEGETFILE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} JobId Type: <b>DWORD</b>
     * 
     * Specifies a unique number that identifies the fax job that received the fax document.
     * @param {Integer} Index Type: <b>DWORD</b>
     * 
     * Specifies a unique number that identifies the requested file.
     * @param {Integer} FileNameBuffer Type: <b>LPWSTR</b>
     * 
     * Pointer to a buffer that receives a null-terminated Unicode character string that contains the requested file name. For more information, see the following Remarks section.
     * @param {Pointer<Integer>} RequiredSize Type: <b>LPDWORD</b>
     * 
     * Pointer to an unsigned <b>DWORD</b> variable. If the <i>FileNameBuffer</i> parameter is <b>NULL</b>, receives the required size, in bytes, of the buffer pointed to by the <i>FileNameBuffer</i> parameter. If <i>FileNameBuffer</i> parameter is not <b>NULL</b>, this variable indicates the output buffer size. For more information, see the following Remarks section.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, the fax service calls <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>, described in MSDN.
     */
    Call(JobId, Index, FileNameBuffer, RequiredSize) {
        RequiredSizeMarshal := RequiredSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, UInt32, JobId, UInt32, Index, IntPtr, FileNameBuffer, RequiredSizeMarshal, RequiredSize, BOOL)
        return result
    }

    /**
     * A PFAXROUTEGETFILE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXROUTEGETFILE {
        /**
         * Creates a PFAXROUTEGETFILE pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, IntPtr, "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, IntPtr, "uint*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
