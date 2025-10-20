#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * IEnhancedStorageSilo interface is the point of access for an IEEE 1667 silo and is used to obtain information and perform operations at the silo level.
 * @see https://docs.microsoft.com/windows/win32/api//ehstorapi/nn-ehstorapi-ienhancedstoragesilo
 * @namespace Windows.Win32.Storage.EnhancedStorage
 * @version v4.0.30319
 */
class IEnhancedStorageSilo extends IUnknown{
    /**
     * The interface identifier for IEnhancedStorageSilo
     * @type {Guid}
     */
    static IID => Guid("{5aef78c6-2242-4703-bf49-44b29357a359}")

    /**
     * The class identifier for EnhancedStorageSilo
     * @type {Guid}
     */
    static CLSID => Guid("{cb25220c-76c7-4fee-842b-f3383cd022bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<SILO_INFO>} pSiloInfo 
     * @returns {HRESULT} 
     */
    GetInfo(pSiloInfo) {
        result := ComCall(3, this, "ptr", pSiloInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnhancedStorageSiloAction>} pppIEnhancedStorageSiloActions 
     * @param {Pointer<UInt32>} pcEnhancedStorageSiloActions 
     * @returns {HRESULT} 
     */
    GetActions(pppIEnhancedStorageSiloActions, pcEnhancedStorageSiloActions) {
        result := ComCall(4, this, "ptr", pppIEnhancedStorageSiloActions, "uint*", pcEnhancedStorageSiloActions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Command 
     * @param {Pointer<Byte>} pbCommandBuffer 
     * @param {Integer} cbCommandBuffer 
     * @param {Pointer<Byte>} pbResponseBuffer 
     * @param {Pointer<UInt32>} pcbResponseBuffer 
     * @returns {HRESULT} 
     */
    SendCommand(Command, pbCommandBuffer, cbCommandBuffer, pbResponseBuffer, pcbResponseBuffer) {
        result := ComCall(5, this, "char", Command, "char*", pbCommandBuffer, "uint", cbCommandBuffer, "char*", pbResponseBuffer, "uint*", pcbResponseBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPortableDevice>} ppIPortableDevice 
     * @returns {HRESULT} 
     */
    GetPortableDevice(ppIPortableDevice) {
        result := ComCall(6, this, "ptr", ppIPortableDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszSiloDevicePath 
     * @returns {HRESULT} 
     */
    GetDevicePath(ppwszSiloDevicePath) {
        result := ComCall(7, this, "ptr", ppwszSiloDevicePath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
