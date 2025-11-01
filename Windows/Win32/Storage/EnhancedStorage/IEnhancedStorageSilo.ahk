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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInfo", "GetActions", "SendCommand", "GetPortableDevice", "GetDevicePath"]

    /**
     * 
     * @param {Pointer<SILO_INFO>} pSiloInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienhancedstoragesilo-getinfo
     */
    GetInfo(pSiloInfo) {
        result := ComCall(3, this, "ptr", pSiloInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<IEnhancedStorageSiloAction>>} pppIEnhancedStorageSiloActions 
     * @param {Pointer<Integer>} pcEnhancedStorageSiloActions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienhancedstoragesilo-getactions
     */
    GetActions(pppIEnhancedStorageSiloActions, pcEnhancedStorageSiloActions) {
        pcEnhancedStorageSiloActionsMarshal := pcEnhancedStorageSiloActions is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr*", pppIEnhancedStorageSiloActions, pcEnhancedStorageSiloActionsMarshal, pcEnhancedStorageSiloActions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Command 
     * @param {Pointer<Integer>} pbCommandBuffer 
     * @param {Integer} cbCommandBuffer 
     * @param {Pointer<Integer>} pbResponseBuffer 
     * @param {Pointer<Integer>} pcbResponseBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienhancedstoragesilo-sendcommand
     */
    SendCommand(Command, pbCommandBuffer, cbCommandBuffer, pbResponseBuffer, pcbResponseBuffer) {
        pbCommandBufferMarshal := pbCommandBuffer is VarRef ? "char*" : "ptr"
        pbResponseBufferMarshal := pbResponseBuffer is VarRef ? "char*" : "ptr"
        pcbResponseBufferMarshal := pcbResponseBuffer is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "char", Command, pbCommandBufferMarshal, pbCommandBuffer, "uint", cbCommandBuffer, pbResponseBufferMarshal, pbResponseBuffer, pcbResponseBufferMarshal, pcbResponseBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPortableDevice>} ppIPortableDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienhancedstoragesilo-getportabledevice
     */
    GetPortableDevice(ppIPortableDevice) {
        result := ComCall(6, this, "ptr*", ppIPortableDevice, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszSiloDevicePath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienhancedstoragesilo-getdevicepath
     */
    GetDevicePath(ppwszSiloDevicePath) {
        result := ComCall(7, this, "ptr", ppwszSiloDevicePath, "HRESULT")
        return result
    }
}
