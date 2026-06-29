#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WM_CLIENT_PROPERTIES.ahk" { WM_CLIENT_PROPERTIES }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMClientConnections interface manages the collecting of information about clients connected to a writer network sink object.The writer network sink object exposes this interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmclientconnections
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMClientConnections extends IUnknown {
    /**
     * The interface identifier for IWMClientConnections
     * @type {Guid}
     */
    static IID := Guid("{73c66010-a299-41df-b1f0-ccf03b09c1c6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMClientConnections interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetClientCount      : IntPtr
        GetClientProperties : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMClientConnections.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetClientCount method retrieves the number of connected clients.
     * @returns {Integer} Pointer to a count of the clients that are connected.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmclientconnections-getclientcount
     */
    GetClientCount() {
        result := ComCall(3, this, "uint*", &pcClients := 0, "HRESULT")
        return pcClients
    }

    /**
     * The GetClientProperties method retrieves information, including the IP address and protocol, about a connected client.
     * @param {Integer} dwClientNum <b>DWORD</b> containing the client's index number.
     * @returns {WM_CLIENT_PROPERTIES} Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_client_properties">WM_CLIENT_PROPERTIES</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmclientconnections-getclientproperties
     */
    GetClientProperties(dwClientNum) {
        pClientProperties := WM_CLIENT_PROPERTIES()
        result := ComCall(4, this, "uint", dwClientNum, WM_CLIENT_PROPERTIES.Ptr, pClientProperties, "HRESULT")
        return pClientProperties
    }

    Query(iid) {
        if (IWMClientConnections.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetClientCount := CallbackCreate(GetMethod(implObj, "GetClientCount"), flags, 2)
        this.vtbl.GetClientProperties := CallbackCreate(GetMethod(implObj, "GetClientProperties"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetClientCount)
        CallbackFree(this.vtbl.GetClientProperties)
    }
}
