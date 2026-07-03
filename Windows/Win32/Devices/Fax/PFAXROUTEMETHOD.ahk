#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FAX_ROUTE.ahk" { FAX_ROUTE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The FaxRouteMethod function is a placeholder for a function name defined by the fax routing extension DLL. This function executes a defined fax routing procedure.
 * @remarks
 * A fax routing method can manipulate the received Tagged Image File Format Class F (TIFF Class F) file. For example, one routing method could route the received Tagged Image File Format (TIFF) file to a specific destination such as a printer, or deliver the file in an email message to a user. Another routing method could convert the TIFF file to text using optical character recognition (OCR) technology, and then create a Microsoft Word document from the text. A fax routing method cannot delete or modify the TIFF file. For information about TIFF files, see <a href="https://msdn.microsoft.com/d7840c10-6059-40ed-9040-50eefefc7349">Fax Image Format</a>..
 * 
 * If you want the fax service to retry a failed routing method at a later time, the fax routing method must take the following steps.
 * 
 * <h3><a id="To_specify_that_the_fax_service_retry_a_fax_routing_method"></a><a id="to_specify_that_the_fax_service_retry_a_fax_routing_method"></a><a id="TO_SPECIFY_THAT_THE_FAX_SERVICE_RETRY_A_FAX_ROUTING_METHOD"></a>To specify that the fax service retry a fax routing method</h3>
 * <ol>
 * <li>Allocate a buffer to hold retry information for the fax routing method. The fax routing method must allocate the memory required for the buffer from the heap specified by the <a href="https://docs.microsoft.com/windows/win32/api/faxroute/nf-faxroute-faxrouteinitialize">FaxRouteInitialize</a> function.</li>
 * <li>Fill <i></i>the buffer with the information required to retry the fax routing method.</li>
 * <li>Set the <i>FailureData</i> parameter of the <b>FaxRouteMethod</b> function to a valid pointer value.</li>
 * </ol>
 * @see https://learn.microsoft.com/windows/win32/api/faxroute/nc-faxroute-pfaxroutemethod
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAXROUTEMETHOD {
    value : IntPtr

    __value {
        set {
            if (value is PFAXROUTEMETHOD) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<FAX_ROUTE>} param0 Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/faxroute/ns-faxroute-fax_route">FAX_ROUTE</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/faxroute/ns-faxroute-fax_route">FAX_ROUTE</a> structure that contains information about the received fax document.
     * @param {Pointer<Pointer<Void>>} param1 Type: <b>PVOID*</b>
     * 
     * Pointer to a variable that receives a pointer to a buffer that contains retry information for the fax routing method. This parameter can be equal to <b>NULL</b>. For more information, see the following Remarks section.
     * @param {Pointer<Integer>} param2 Type: <b>LPDWORD</b>
     * 
     * Pointer to an unsigned <b>DWORD</b> variable that receives the size, in bytes, of the buffer pointed to by the <i>FailureData</i> parameter.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, the fax service calls <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>, described in MSDN.
     */
    Call(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "ptr*" : "ptr"
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, FAX_ROUTE.Ptr, param0, param1Marshal, param1, param2Marshal, param2, BOOL)
        return result
    }

    /**
     * A PFAXROUTEMETHOD that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXROUTEMETHOD {
        /**
         * Creates a PFAXROUTEMETHOD pointer that invokes the given AHK function when called.
         * @param {Func(FAX_ROUTE, "ptr*", "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FAX_ROUTE.Ptr, "ptr*", "uint*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
