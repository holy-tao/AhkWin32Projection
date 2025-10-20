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
     * 
     * @param {Pointer<Guid>} pSignature 
     * @returns {HRESULT} 
     */
    GetDeviceSignature(pSignature) {
        result := ComCall(3, this, "ptr", pSignature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszName 
     * @returns {HRESULT} 
     */
    GetFriendlyName(ppszName) {
        result := ComCall(4, this, "ptr", ppszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pf11d 
     * @returns {HRESULT} 
     */
    IsDot11d(pf11d) {
        result := ComCall(5, this, "char*", pf11d, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pfAdHocCapable 
     * @returns {HRESULT} 
     */
    IsAdHocCapable(pfAdHocCapable) {
        result := ComCall(6, this, "char*", pfAdHocCapable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pfIsRadioOn 
     * @returns {HRESULT} 
     */
    IsRadioOn(pfIsRadioOn) {
        result := ComCall(7, this, "char*", pfIsRadioOn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDot11AdHocNetwork>} ppNetwork 
     * @returns {HRESULT} 
     */
    GetActiveNetwork(ppNetwork) {
        result := ComCall(8, this, "ptr", ppNetwork, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumDot11AdHocSecuritySettings>} ppEnum 
     * @returns {HRESULT} 
     */
    GetIEnumSecuritySettings(ppEnum) {
        result := ComCall(9, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pFilterGuid 
     * @param {Pointer<IEnumDot11AdHocNetworks>} ppEnum 
     * @returns {HRESULT} 
     */
    GetIEnumDot11AdHocNetworks(pFilterGuid, ppEnum) {
        result := ComCall(10, this, "ptr", pFilterGuid, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pState 
     * @returns {HRESULT} 
     */
    GetStatus(pState) {
        result := ComCall(11, this, "int*", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
