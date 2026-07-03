#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\PFAXROUTEENUMFILE.ahk" { PFAXROUTEENUMFILE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * A fax routing method calls the FaxRouteEnumFiles callback function to enumerate the files in the fax file list associated with a received fax document.
 * @remarks
 * The fax service passes a pointer to the <i>FaxRouteEnumFiles</i> callback function when the fax service calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxroute/nf-faxroute-faxrouteinitialize">FaxRouteInitialize</a> function. The service passes the pointer in a <a href="https://docs.microsoft.com/windows/desktop/api/faxroute/ns-faxroute-fax_route_callbackroutines">FAX_ROUTE_CALLBACKROUTINES</a> structure.
 * 
 * The <b>PFAXROUTEENUMFILES</b> data type defines a pointer to a <i>FaxRouteEnumFiles</i> function.
 * 
 * The fax routing extension DLL must supply the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxroute/nc-faxroute-pfaxrouteenumfile">FaxRouteEnumFile</a> function specified by the <i>FileEnumerator</i> parameter. The fax service calls <i>FaxRouteEnumFile</i> to enumerate the files in the fax file list for the fax routing method. The fax service calls <i>FaxRouteEnumFile</i> once for each file in the fax file list.
 * 
 * For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-file-lists">Fax File Lists</a>.
 * @see https://learn.microsoft.com/windows/win32/api/faxroute/nc-faxroute-pfaxrouteenumfiles
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAXROUTEENUMFILES {
    value : IntPtr

    __value {
        set {
            if (value is PFAXROUTEENUMFILES) {
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
     * @param {Pointer<Guid>} Guid Type: <b>GUID*</b>
     * 
     * Pointer to a null-terminated Unicode character string that contains the GUID for the fax routing method.
     * @param {Pointer<PFAXROUTEENUMFILE>} FileEnumerator Type: <b>PFAXROUTEENUMFILE</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxroute/nc-faxroute-pfaxrouteenumfile">FaxRouteEnumFile</a> callback function defined by the fax routing extension. <i>FaxRouteEnumFile</i> receives the file names in the fax file list associated with the received fax document.
     * @param {Pointer<Void>} _Context Type: <b>PVOID</b>
     * 
     * Pointer to an extension-defined value that <i>FaxRouteEnumFiles</i> passes to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxroute/nc-faxroute-pfaxrouteenumfile">FaxRouteEnumFile</a> function. The fax routing method can define this value.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, the fax service calls <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>, described in MSDN.
     */
    Call(JobId, Guid, FileEnumerator, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, UInt32, JobId, Guid.Ptr, Guid, PFAXROUTEENUMFILE, FileEnumerator, _ContextMarshal, _Context, BOOL)
        return result
    }

    /**
     * A PFAXROUTEENUMFILES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXROUTEENUMFILES {
        /**
         * Creates a PFAXROUTEENUMFILES pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, Guid, PFAXROUTEENUMFILE, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, Guid.Ptr, PFAXROUTEENUMFILE, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
