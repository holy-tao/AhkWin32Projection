#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * A fax routing method calls the FaxRouteModifyRoutingData callback function to modify the routing data for a subsequent fax routing method.
 * @remarks
 * The fax service passes a pointer to the <i>FaxRouteModifyRoutingData</i> function when the fax service calls <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxroute/nf-faxroute-faxrouteinitialize">FaxRouteInitialize</a>. The service passes the pointer in a <a href="https://docs.microsoft.com/windows/desktop/api/faxroute/ns-faxroute-fax_route_callbackroutines">FAX_ROUTE_CALLBACKROUTINES</a> structure.
 * 
 * The <b>PFAXROUTEMODIFYROUTINGDATA</b> data type defines a pointer to a <i>FaxRouteModifyRoutingData</i> function.
 * 
 * A fax routing method can call the <i>FaxRouteModifyRoutingData</i> callback function to change the routing information for a subsequent routing method. The function does this by modifying the <b>RoutingInfoData</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/faxroute/ns-faxroute-fax_route">FAX_ROUTE</a> structure that applies to the subsequent method. This allows a fax routing extension to retrieve user-defined routing data and to provide additional callback information to a different routing method. When the subsequent routing method executes, it processes the received fax transmission using the modified routing data.
 * 
 * The fax routing method specified by the <i>RoutingGuid</i> parameter must have a lower priority and must run after the calling routing method. The priority level determines the relative order in which the fax service calls the fax routing methods when the service receives a fax document.
 * @see https://learn.microsoft.com/windows/win32/api/faxroute/nc-faxroute-pfaxroutemodifyroutingdata
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAXROUTEMODIFYROUTINGDATA {
    value : IntPtr

    __value {
        set {
            if (value is PFAXROUTEMODIFYROUTINGDATA) {
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
     * @param {PWSTR} RoutingGuid Type: <b>LPCWSTR</b>
     * 
     * Pointer to a constant null-terminated Unicode character string that specifies the GUID of the fax routing method to modify.
     * @param {Pointer<Integer>} RoutingData Type: <b>LPBYTE</b>
     * 
     * Pointer to a buffer that contains additional routing data defined by the routing extension. For more information, see the following Remarks section. 
     * 
     *                     
     * 
     * The fax routing method that calls the <i>FaxRouteModifyRoutingData</i> function and the routing method specified by the <i>RoutingGuid</i> parameter must interpret the data in the <i>RoutingData</i> parameter.
     * @param {Integer} RoutingDataSize Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that is the size, in bytes, of the buffer pointed to by the <i>RoutingData</i> parameter.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, the fax service calls <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>, described in MSDN.
     */
    Call(JobId, RoutingGuid, RoutingData, RoutingDataSize) {
        RoutingGuid := RoutingGuid is String ? StrPtr(RoutingGuid) : RoutingGuid

        RoutingDataMarshal := RoutingData is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, UInt32, JobId, "ptr", RoutingGuid, RoutingDataMarshal, RoutingData, UInt32, RoutingDataSize, BOOL)
        return result
    }

    /**
     * A PFAXROUTEMODIFYROUTINGDATA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXROUTEMODIFYROUTINGDATA {
        /**
         * Creates a PFAXROUTEMODIFYROUTINGDATA pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, PWSTR, "char*", UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, PWSTR, "char*", UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
