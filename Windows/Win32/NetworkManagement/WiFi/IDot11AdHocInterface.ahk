#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a wireless network interface card (NIC).
 * @see https://docs.microsoft.com/windows/win32/api//adhoc/nn-adhoc-idot11adhocinterface
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class IDot11AdHocInterface extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDot11AdHocInterface
     * @type {Guid}
     */
    static IID => Guid("{8f10cc2b-cf0d-42a0-acbe-e2de7007384d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceSignature", "GetFriendlyName", "IsDot11d", "IsAdHocCapable", "IsRadioOn", "GetActiveNetwork", "GetIEnumSecuritySettings", "GetIEnumDot11AdHocNetworks", "GetStatus"]

    /**
     * 
     * @param {Pointer<Guid>} pSignature 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocinterface-getdevicesignature
     */
    GetDeviceSignature(pSignature) {
        result := ComCall(3, this, "ptr", pSignature, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocinterface-getfriendlyname
     */
    GetFriendlyName(ppszName) {
        result := ComCall(4, this, "ptr", ppszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pf11d 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocinterface-isdot11d
     */
    IsDot11d(pf11d) {
        result := ComCall(5, this, "char*", pf11d, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pfAdHocCapable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocinterface-isadhoccapable
     */
    IsAdHocCapable(pfAdHocCapable) {
        result := ComCall(6, this, "char*", pfAdHocCapable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pfIsRadioOn 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocinterface-isradioon
     */
    IsRadioOn(pfIsRadioOn) {
        result := ComCall(7, this, "char*", pfIsRadioOn, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDot11AdHocNetwork>} ppNetwork 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocinterface-getactivenetwork
     */
    GetActiveNetwork(ppNetwork) {
        result := ComCall(8, this, "ptr*", ppNetwork, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumDot11AdHocSecuritySettings>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocinterface-getienumsecuritysettings
     */
    GetIEnumSecuritySettings(ppEnum) {
        result := ComCall(9, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pFilterGuid 
     * @param {Pointer<IEnumDot11AdHocNetworks>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocinterface-getienumdot11adhocnetworks
     */
    GetIEnumDot11AdHocNetworks(pFilterGuid, ppEnum) {
        result := ComCall(10, this, "ptr", pFilterGuid, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocinterface-getstatus
     */
    GetStatus(pState) {
        result := ComCall(11, this, "int*", pState, "HRESULT")
        return result
    }
}
