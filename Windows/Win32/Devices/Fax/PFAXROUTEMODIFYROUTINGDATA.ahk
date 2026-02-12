#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/faxroute/nc-faxroute-pfaxroutemodifyroutingdata
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class PFAXROUTEMODIFYROUTINGDATA extends IUnknown {

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
     * @param {PWSTR} RoutingGuid 
     * @param {Pointer<Integer>} RoutingData 
     * @param {Integer} RoutingDataSize 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(JobId, RoutingGuid, RoutingData, RoutingDataSize) {
        RoutingGuid := RoutingGuid is String ? StrPtr(RoutingGuid) : RoutingGuid

        RoutingDataMarshal := RoutingData is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", JobId, "ptr", RoutingGuid, RoutingDataMarshal, RoutingData, "uint", RoutingDataSize, "int")
        return result
    }
}
