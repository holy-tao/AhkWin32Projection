#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * A fax routing method calls the FaxRouteAddFile callback function to add a file to the fax file list associated with a received fax document.
 * @remarks
 * The fax service passes a pointer to the <i>FaxRouteAddFile</i> callback function when the fax service calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxroute/nf-faxroute-faxrouteinitialize">FaxRouteInitialize</a> function. The service passes the pointer in a <a href="https://docs.microsoft.com/windows/desktop/api/faxroute/ns-faxroute-fax_route_callbackroutines">FAX_ROUTE_CALLBACKROUTINES</a> structure.
 * 
 * The <b>PFAXROUTEADDFILE</b> data type defines a pointer to a <i>FaxRouteAddFile</i> function. 
 * 
 * For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-file-lists">Fax File Lists</a>.
 * @see https://learn.microsoft.com/windows/win32/api/faxroute/nc-faxroute-pfaxrouteaddfile
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAXROUTEADDFILE {
    value : IntPtr

    __value {
        set {
            if (value is PFAXROUTEADDFILE) {
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
     * @param {PWSTR} FileName Type: <b>LPCWSTR</b>
     * 
     * Pointer to a constant null-terminated Unicode character string. The string contains the fully qualified path and name of the file to add to the fax file list associated with the received fax document.
     * @param {Pointer<Guid>} Guid Type: <b>GUID*</b>
     * 
     * Pointer to a null-terminated Unicode character string that contains the GUID for the fax routing method that is adding the file.
     * @returns {Integer} Type: <b>LONG</b>
     * 
     * If the function succeeds, the return value is the file number of the file added to the fax file list associated with the received fax.
     * 
     * If the function fails, the return value is 1. To get extended error information, the fax service calls <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>, described in MSDN.
     */
    Call(JobId, FileName, Guid) {
        FileName := FileName is String ? StrPtr(FileName) : FileName

        result := DllCall(this.value, UInt32, JobId, "ptr", FileName, Guid.Ptr, Guid, Int32)
        return result
    }

    /**
     * A PFAXROUTEADDFILE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXROUTEADDFILE {
        /**
         * Creates a PFAXROUTEADDFILE pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, PWSTR, Guid) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, PWSTR, Guid.Ptr, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
