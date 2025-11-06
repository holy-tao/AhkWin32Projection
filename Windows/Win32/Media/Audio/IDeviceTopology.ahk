#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IConnector.ahk
#Include .\ISubunit.ahk
#Include .\IPart.ahk
#Include .\IPartsList.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDeviceTopology interface provides access to the topology of an audio device.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-idevicetopology
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IDeviceTopology extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeviceTopology
     * @type {Guid}
     */
    static IID => Guid("{2a07407e-6497-4a18-9787-32f79bd0d98f}")

    /**
     * The class identifier for DeviceTopology
     * @type {Guid}
     */
    static CLSID => Guid("{1df639d0-5ec1-47aa-9379-828dc1aa8c59}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetConnectorCount", "GetConnector", "GetSubunitCount", "GetSubunit", "GetPartById", "GetDeviceId", "GetSignalPath"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-idevicetopology-getconnectorcount
     */
    GetConnectorCount() {
        result := ComCall(3, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {IConnector} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-idevicetopology-getconnector
     */
    GetConnector(nIndex) {
        result := ComCall(4, this, "uint", nIndex, "ptr*", &ppConnector := 0, "HRESULT")
        return IConnector(ppConnector)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-idevicetopology-getsubunitcount
     */
    GetSubunitCount() {
        result := ComCall(5, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {ISubunit} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-idevicetopology-getsubunit
     */
    GetSubunit(nIndex) {
        result := ComCall(6, this, "uint", nIndex, "ptr*", &ppSubunit := 0, "HRESULT")
        return ISubunit(ppSubunit)
    }

    /**
     * 
     * @param {Integer} nId 
     * @returns {IPart} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-idevicetopology-getpartbyid
     */
    GetPartById(nId) {
        result := ComCall(7, this, "uint", nId, "ptr*", &ppPart := 0, "HRESULT")
        return IPart(ppPart)
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-idevicetopology-getdeviceid
     */
    GetDeviceId() {
        result := ComCall(8, this, "ptr*", &ppwstrDeviceId := 0, "HRESULT")
        return ppwstrDeviceId
    }

    /**
     * 
     * @param {IPart} pIPartFrom 
     * @param {IPart} pIPartTo 
     * @param {BOOL} bRejectMixedPaths 
     * @returns {IPartsList} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-idevicetopology-getsignalpath
     */
    GetSignalPath(pIPartFrom, pIPartTo, bRejectMixedPaths) {
        result := ComCall(9, this, "ptr", pIPartFrom, "ptr", pIPartTo, "int", bRejectMixedPaths, "ptr*", &ppParts := 0, "HRESULT")
        return IPartsList(ppParts)
    }
}
