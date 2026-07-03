#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The FaxRouteEnumFile callback function receives the file names in the fax file list associated with a received fax document.
 * @remarks
 * The fax routing extension DLL must register the <i>FaxRouteEnumFile</i> callback function by passing its address to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxroute/nc-faxroute-pfaxrouteenumfiles">FaxRouteEnumFiles</a> function.
 * 
 * For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-file-lists">Fax File Lists</a>.
 * @see https://learn.microsoft.com/windows/win32/api/faxroute/nc-faxroute-pfaxrouteenumfile
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAXROUTEENUMFILE {
    value : IntPtr

    __value {
        set {
            if (value is PFAXROUTEENUMFILE) {
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
     * @param {Pointer<Guid>} GuidOwner Type: <b>GUID*</b>
     * 
     * Pointer to the GUID associated with the fax routing method that added the file to the fax file list. (This file is specified by the <i>FileName</i> parameter.)
     * @param {Pointer<Guid>} GuidCaller Type: <b>GUID*</b>
     * 
     * Pointer to the GUID associated with the fax routing method that called the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxroute/nc-faxroute-pfaxrouteenumfiles">FaxRouteEnumFiles</a> function. (<i>FaxRouteEnumFiles</i> passes a pointer to the <i>FaxRouteEnumFile</i> function.) Note that this parameter has the same value as the <i>Guid</i> parameter of <i>FaxRouteEnumFiles</i>. The <i>GuidCaller</i> parameter can be <b>NULL</b>.
     * @param {PWSTR} FileName Type: <b>LPCWSTR</b>
     * 
     * Pointer to a constant null-terminated Unicode character string. The fax service sets this variable to the fully qualified path and name of one file in the fax file list associated with the received fax document.
     * @param {Pointer<Void>} _Context Type: <b>PVOID</b>
     * 
     * Pointer to an extension-defined value supplied by the fax routing method identified by the <i>GuidCaller</i> parameter. This is an opaque value that the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxroute/nc-faxroute-pfaxrouteenumfiles">FaxRouteEnumFiles</a> function passes to <i>FaxRouteEnumFile</i>.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * The function returns a nonzero value to continue enumeration, or zero to stop enumeration.
     */
    Call(JobId, GuidOwner, GuidCaller, FileName, _Context) {
        FileName := FileName is String ? StrPtr(FileName) : FileName

        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, UInt32, JobId, Guid.Ptr, GuidOwner, Guid.Ptr, GuidCaller, "ptr", FileName, _ContextMarshal, _Context, BOOL)
        return result
    }

    /**
     * A PFAXROUTEENUMFILE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXROUTEENUMFILE {
        /**
         * Creates a PFAXROUTEENUMFILE pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, Guid, Guid, PWSTR, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, Guid.Ptr, Guid.Ptr, PWSTR, "ptr", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
