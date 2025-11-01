#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMMDeviceCollection interface represents a collection of multimedia device resources.
 * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nn-mmdeviceapi-immdevicecollection
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IMMDeviceCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMMDeviceCollection
     * @type {Guid}
     */
    static IID => Guid("{0bd7a1be-7a1a-44db-8397-cc5392387b5e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "Item"]

    /**
     * 
     * @param {Pointer<Integer>} pcDevices 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdevicecollection-getcount
     */
    GetCount(pcDevices) {
        pcDevicesMarshal := pcDevices is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pcDevicesMarshal, pcDevices, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nDevice 
     * @param {Pointer<IMMDevice>} ppDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdevicecollection-item
     */
    Item(nDevice, ppDevice) {
        result := ComCall(4, this, "uint", nDevice, "ptr*", ppDevice, "HRESULT")
        return result
    }
}
