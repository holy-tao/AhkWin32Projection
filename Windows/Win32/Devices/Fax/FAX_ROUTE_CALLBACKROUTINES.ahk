#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FAX_ROUTE_CALLBACKROUTINES structure contains pointers to callback functions the fax service provides.
 * @remarks
 * The fax routing extension DLL must store the pointers to these callback functions in a global variable for later use.
 * 
 * If the <b>SizeOfStruct</b> member is greater than sizeof(FAX_ROUTE_CALLBACKROUTINES), this indicates that the <b>FAX_ROUTE_CALLBACKROUTINES</b> structure has been updated by Microsoft, and your application is using an earlier version. To maintain backward compatibility, changes will be appended to the original prototype of the <b>FAX_ROUTE_CALLBACKROUTINES</b> structure. For example, new members for additional callback functions will be added sequentially after the <b>FaxRouteModifyRoutingData</b> member.
 * 
 * For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-routing-extension-registration">Fax Routing Extension Registration</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-file-lists">Fax File Lists</a>.
 * @see https://learn.microsoft.com/windows/win32/api/faxroute/ns-faxroute-fax_route_callbackroutines
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_ROUTE_CALLBACKROUTINES extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the size, in bytes, of the <b>FAX_ROUTE_CALLBACKROUTINES</b> structure. The fax service sets this member to sizeof(FAX_ROUTE_CALLBACKROUTINES). For information about backward compatibility, see the following Remarks section.
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>PFAXROUTEADDFILE</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxroute/nc-faxroute-pfaxrouteaddfile">FaxRouteAddFile</a> callback function that a fax routing method uses to add a file to the fax file list associated with a received fax document.
     * @type {Pointer<PFAXROUTEADDFILE>}
     */
    FaxRouteAddFile {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>PFAXROUTEDELETEFILE</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxroute/nc-faxroute-pfaxroutedeletefile">FaxRouteDeleteFile</a> callback function that a fax routing method uses to delete a file from the fax file list associated with a received fax document.
     * @type {Pointer<PFAXROUTEDELETEFILE>}
     */
    FaxRouteDeleteFile {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>PFAXROUTEGETFILE</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxroute/nc-faxroute-pfaxroutegetfile">FaxRouteGetFile</a> callback function that a fax routing method uses to retrieve a specific file name from the fax file list associated with a received fax document.
     * @type {Pointer<PFAXROUTEGETFILE>}
     */
    FaxRouteGetFile {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>PFAXROUTEENUMFILES</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxroute/nc-faxroute-pfaxrouteenumfiles">FaxRouteEnumFiles</a> callback function that a fax routing method uses to enumerate the files in the fax file list associated with a received fax document.
     * @type {Pointer<PFAXROUTEENUMFILES>}
     */
    FaxRouteEnumFiles {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>PFAXROUTEMODIFYROUTINGDATA</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxroute/nc-faxroute-pfaxroutemodifyroutingdata">FaxRouteModifyRoutingData</a> callback function that a fax routing method uses to modify the routing data associated with a subsequent fax routing method.
     * @type {Pointer<PFAXROUTEMODIFYROUTINGDATA>}
     */
    FaxRouteModifyRoutingData {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
