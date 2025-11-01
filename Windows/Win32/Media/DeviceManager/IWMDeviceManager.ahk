#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDeviceManager interface is the top level Windows Media Device Manager interface for applications.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdevicemanager
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDeviceManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDeviceManager
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a00-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRevision", "GetDeviceCount", "EnumDevices"]

    /**
     * 
     * @param {Pointer<Integer>} pdwRevision 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdevicemanager-getrevision
     */
    GetRevision(pdwRevision) {
        pdwRevisionMarshal := pdwRevision is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwRevisionMarshal, pdwRevision, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdevicemanager-getdevicecount
     */
    GetDeviceCount(pdwCount) {
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwCountMarshal, pdwCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWMDMEnumDevice>} ppEnumDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdevicemanager-enumdevices
     */
    EnumDevices(ppEnumDevice) {
        result := ComCall(5, this, "ptr*", ppEnumDevice, "HRESULT")
        return result
    }
}
