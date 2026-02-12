#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IDynamicPortMapping.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class IDynamicPortMappingCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDynamicPortMappingCollection
     * @type {Guid}
     */
    static IID => Guid("{b60de00f-156e-4e8d-9ec1-3a2342c10899}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_Count", "Remove", "Add"]

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(pVal)
    }

    /**
     * 
     * @param {BSTR} bstrRemoteHost 
     * @param {Integer} lExternalPort 
     * @param {BSTR} bstrProtocol 
     * @returns {IDynamicPortMapping} 
     */
    get_Item(bstrRemoteHost, lExternalPort, bstrProtocol) {
        if(bstrRemoteHost is String) {
            pin := BSTR.Alloc(bstrRemoteHost)
            bstrRemoteHost := pin.Value
        }
        if(bstrProtocol is String) {
            pin := BSTR.Alloc(bstrProtocol)
            bstrProtocol := pin.Value
        }

        result := ComCall(8, this, "ptr", bstrRemoteHost, "int", lExternalPort, "ptr", bstrProtocol, "ptr*", &ppDPM := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDynamicPortMapping(ppDPM)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(9, this, "int*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Creating, Altering, and Removing Views
     * @param {BSTR} bstrRemoteHost 
     * @param {Integer} lExternalPort 
     * @param {BSTR} bstrProtocol 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/server-management-objects-smo/tasks/creating-altering-and-removing-views
     */
    Remove(bstrRemoteHost, lExternalPort, bstrProtocol) {
        if(bstrRemoteHost is String) {
            pin := BSTR.Alloc(bstrRemoteHost)
            bstrRemoteHost := pin.Value
        }
        if(bstrProtocol is String) {
            pin := BSTR.Alloc(bstrProtocol)
            bstrProtocol := pin.Value
        }

        result := ComCall(10, this, "ptr", bstrRemoteHost, "int", lExternalPort, "ptr", bstrProtocol, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * You can add, show, hide, and delete sections in the ShapeSheet.
     * @param {BSTR} bstrRemoteHost 
     * @param {Integer} lExternalPort 
     * @param {BSTR} bstrProtocol 
     * @param {Integer} lInternalPort 
     * @param {BSTR} bstrInternalClient 
     * @param {VARIANT_BOOL} bEnabled 
     * @param {BSTR} bstrDescription 
     * @param {Integer} lLeaseDuration 
     * @returns {IDynamicPortMapping} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/add-show-hide-or-delete-a-section
     */
    Add(bstrRemoteHost, lExternalPort, bstrProtocol, lInternalPort, bstrInternalClient, bEnabled, bstrDescription, lLeaseDuration) {
        if(bstrRemoteHost is String) {
            pin := BSTR.Alloc(bstrRemoteHost)
            bstrRemoteHost := pin.Value
        }
        if(bstrProtocol is String) {
            pin := BSTR.Alloc(bstrProtocol)
            bstrProtocol := pin.Value
        }
        if(bstrInternalClient is String) {
            pin := BSTR.Alloc(bstrInternalClient)
            bstrInternalClient := pin.Value
        }
        if(bstrDescription is String) {
            pin := BSTR.Alloc(bstrDescription)
            bstrDescription := pin.Value
        }

        result := ComCall(11, this, "ptr", bstrRemoteHost, "int", lExternalPort, "ptr", bstrProtocol, "int", lInternalPort, "ptr", bstrInternalClient, "short", bEnabled, "ptr", bstrDescription, "int", lLeaseDuration, "ptr*", &ppDPM := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDynamicPortMapping(ppDPM)
    }
}
