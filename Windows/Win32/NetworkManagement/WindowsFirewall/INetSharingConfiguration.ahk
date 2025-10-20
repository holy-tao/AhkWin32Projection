#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetSharingConfiguration interface provides methods to manage connection sharing, port mapping, and Internet Connection Firewall.
 * @see https://docs.microsoft.com/windows/win32/api//netcon/nn-netcon-inetsharingconfiguration
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetSharingConfiguration extends IDispatch{
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
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnabled 
     * @returns {HRESULT} 
     */
    get_SharingEnabled(pbEnabled) {
        result := ComCall(7, this, "ptr", pbEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pType 
     * @returns {HRESULT} 
     */
    get_SharingConnectionType(pType) {
        result := ComCall(8, this, "int*", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisableSharing() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @returns {HRESULT} 
     */
    EnableSharing(Type) {
        result := ComCall(10, this, "int", Type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnabled 
     * @returns {HRESULT} 
     */
    get_InternetFirewallEnabled(pbEnabled) {
        result := ComCall(11, this, "ptr", pbEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisableInternetFirewall() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EnableInternetFirewall() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<INetSharingPortMappingCollection>} ppColl 
     * @returns {HRESULT} 
     */
    get_EnumPortMappings(Flags, ppColl) {
        result := ComCall(14, this, "int", Flags, "ptr", ppColl, "int")
        if(result != 0)
            throw OSError(result)

        return result
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
     * @param {Pointer<INetSharingPortMapping>} ppMapping 
     * @returns {HRESULT} 
     */
    AddPortMapping(bstrName, ucIPProtocol, usExternalPort, usInternalPort, dwOptions, bstrTargetNameOrIPAddress, eTargetType, ppMapping) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrTargetNameOrIPAddress := bstrTargetNameOrIPAddress is String ? BSTR.Alloc(bstrTargetNameOrIPAddress).Value : bstrTargetNameOrIPAddress

        result := ComCall(15, this, "ptr", bstrName, "char", ucIPProtocol, "ushort", usExternalPort, "ushort", usInternalPort, "uint", dwOptions, "ptr", bstrTargetNameOrIPAddress, "int", eTargetType, "ptr", ppMapping, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INetSharingPortMapping>} pMapping 
     * @returns {HRESULT} 
     */
    RemovePortMapping(pMapping) {
        result := ComCall(16, this, "ptr", pMapping, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
