#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A fax routing method calls the FaxRouteAddFile callback function to add a file to the fax file list associated with a received fax document.
 * @remarks
 * The fax service passes a pointer to the <i>FaxRouteAddFile</i> callback function when the fax service calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxroute/nf-faxroute-faxrouteinitialize">FaxRouteInitialize</a> function. The service passes the pointer in a <a href="https://docs.microsoft.com/windows/desktop/api/faxroute/ns-faxroute-fax_route_callbackroutines">FAX_ROUTE_CALLBACKROUTINES</a> structure.
 * 
 * The <b>PFAXROUTEADDFILE</b> data type defines a pointer to a <i>FaxRouteAddFile</i> function. 
 * 
 * For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-file-lists">Fax File Lists</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/faxroute/nc-faxroute-pfaxrouteaddfile
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class PFAXROUTEADDFILE extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Integer} JobId 
     * @param {PWSTR} FileName 
     * @param {Pointer<Guid>} Guid 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(JobId, FileName, Guid) {
        FileName := FileName is String ? StrPtr(FileName) : FileName

        result := ComCall(3, this, "uint", JobId, "ptr", FileName, "ptr", Guid, "int")
        return result
    }
}
