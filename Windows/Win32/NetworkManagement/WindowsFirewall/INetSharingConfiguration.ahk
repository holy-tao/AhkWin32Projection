#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\INetSharingPortMappingCollection.ahk
#Include .\INetSharingPortMapping.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetSharingConfiguration interface provides methods to manage connection sharing, port mapping, and Internet Connection Firewall.
 * @see https://docs.microsoft.com/windows/win32/api//netcon/nn-netcon-inetsharingconfiguration
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetSharingConfiguration extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetSharingConfiguration
     * @type {Guid}
     */
    static IID => Guid("{c08956b6-1cd3-11d1-b1c5-00805fc1270e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SharingEnabled", "get_SharingConnectionType", "DisableSharing", "EnableSharing", "get_InternetFirewallEnabled", "DisableInternetFirewall", "EnableInternetFirewall", "get_EnumPortMappings", "AddPortMapping", "RemovePortMapping"]

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingconfiguration-get_sharingenabled
     */
    get_SharingEnabled() {
        result := ComCall(7, this, "short*", &pbEnabled := 0, "HRESULT")
        return pbEnabled
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingconfiguration-get_sharingconnectiontype
     */
    get_SharingConnectionType() {
        result := ComCall(8, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingconfiguration-disablesharing
     */
    DisableSharing() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingconfiguration-enablesharing
     */
    EnableSharing(Type) {
        result := ComCall(10, this, "int", Type, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingconfiguration-get_internetfirewallenabled
     */
    get_InternetFirewallEnabled() {
        result := ComCall(11, this, "short*", &pbEnabled := 0, "HRESULT")
        return pbEnabled
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingconfiguration-disableinternetfirewall
     */
    DisableInternetFirewall() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingconfiguration-enableinternetfirewall
     */
    EnableInternetFirewall() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {INetSharingPortMappingCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingconfiguration-get_enumportmappings
     */
    get_EnumPortMappings(Flags) {
        result := ComCall(14, this, "int", Flags, "ptr*", &ppColl := 0, "HRESULT")
        return INetSharingPortMappingCollection(ppColl)
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Integer} ucIPProtocol 
     * @param {Integer} usExternalPort 
     * @param {Integer} usInternalPort 
     * @param {Integer} dwOptions 
     * @param {BSTR} bstrTargetNameOrIPAddress 
     * @param {Integer} eTargetType 
     * @returns {INetSharingPortMapping} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingconfiguration-addportmapping
     */
    AddPortMapping(bstrName, ucIPProtocol, usExternalPort, usInternalPort, dwOptions, bstrTargetNameOrIPAddress, eTargetType) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrTargetNameOrIPAddress := bstrTargetNameOrIPAddress is String ? BSTR.Alloc(bstrTargetNameOrIPAddress).Value : bstrTargetNameOrIPAddress

        result := ComCall(15, this, "ptr", bstrName, "char", ucIPProtocol, "ushort", usExternalPort, "ushort", usInternalPort, "uint", dwOptions, "ptr", bstrTargetNameOrIPAddress, "int", eTargetType, "ptr*", &ppMapping := 0, "HRESULT")
        return INetSharingPortMapping(ppMapping)
    }

    /**
     * 
     * @param {INetSharingPortMapping} pMapping 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingconfiguration-removeportmapping
     */
    RemovePortMapping(pMapping) {
        result := ComCall(16, this, "ptr", pMapping, "HRESULT")
        return result
    }
}
