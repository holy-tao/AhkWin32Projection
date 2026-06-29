#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IWMClientConnections.ahk" { IWMClientConnections }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IWMClientConnections2 interface retrieves advanced client information.The writer network sink object exposes this interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmclientconnections2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMClientConnections2 extends IWMClientConnections {
    /**
     * The interface identifier for IWMClientConnections2
     * @type {Guid}
     */
    static IID := Guid("{4091571e-4701-4593-bb3d-d5f5f0c74246}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMClientConnections2 interfaces
    */
    struct Vtbl extends IWMClientConnections.Vtbl {
        GetClientInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMClientConnections2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetClientInfo method retrieves information about a client attached to a writer network sink.
     * @param {Integer} dwClientNum <b>DWORD</b> containing the client number.
     * @param {PWSTR} pwszNetworkAddress Pointer to a wide-character <b>null</b>-terminated string containing the network address of the client. Pass <b>NULL</b> to retrieve the size of the string, which is returned in <i>pcchNetworkAddress</i>.
     * @param {Pointer<Integer>} pcchNetworkAddress Pointer to a <b>DWORD</b> containing the size of <i>pwszNetworkAddress</i>, in wide characters. This size includes the terminating <b>null</b> character.
     * @param {PWSTR} pwszPort Pointer to a wide-character <b>null</b>-terminated string containing the network port of the client. Pass <b>NULL</b> to retrieve the size of the string, which is returned in <i>pcchPort</i>.
     * @param {Pointer<Integer>} pcchPort Pointer to a <b>DWORD</b> containing the size of <i>pwszPort</i>, in wide characters. This size includes the terminating <b>null</b> character.
     * @param {PWSTR} pwszDNSName Pointer to a wide-character <b>null</b>-terminated string containing the name of the domain name server supporting the client. Pass <b>NULL</b> to retrieve the size of the string, which is returned in <i>pcchDNSName</i>.
     * @param {Pointer<Integer>} pcchDNSName Pointer to a <b>DWORD</b> containing the size of <i>pwszDNSName</i>, in wide characters. This size includes the terminating <b>null</b> character.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmclientconnections2-getclientinfo
     */
    GetClientInfo(dwClientNum, pwszNetworkAddress, pcchNetworkAddress, pwszPort, pcchPort, pwszDNSName, pcchDNSName) {
        pwszNetworkAddress := pwszNetworkAddress is String ? StrPtr(pwszNetworkAddress) : pwszNetworkAddress
        pwszPort := pwszPort is String ? StrPtr(pwszPort) : pwszPort
        pwszDNSName := pwszDNSName is String ? StrPtr(pwszDNSName) : pwszDNSName

        pcchNetworkAddressMarshal := pcchNetworkAddress is VarRef ? "uint*" : "ptr"
        pcchPortMarshal := pcchPort is VarRef ? "uint*" : "ptr"
        pcchDNSNameMarshal := pcchDNSName is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", dwClientNum, "ptr", pwszNetworkAddress, pcchNetworkAddressMarshal, pcchNetworkAddress, "ptr", pwszPort, pcchPortMarshal, pcchPort, "ptr", pwszDNSName, pcchDNSNameMarshal, pcchDNSName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMClientConnections2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetClientInfo := CallbackCreate(GetMethod(implObj, "GetClientInfo"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetClientInfo)
    }
}
