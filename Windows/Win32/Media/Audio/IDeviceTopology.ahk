#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-idevicetopology-getconnectorcount
     */
    GetConnectorCount(pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<IConnector>} ppConnector 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-idevicetopology-getconnector
     */
    GetConnector(nIndex, ppConnector) {
        result := ComCall(4, this, "uint", nIndex, "ptr*", ppConnector, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-idevicetopology-getsubunitcount
     */
    GetSubunitCount(pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<ISubunit>} ppSubunit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-idevicetopology-getsubunit
     */
    GetSubunit(nIndex, ppSubunit) {
        result := ComCall(6, this, "uint", nIndex, "ptr*", ppSubunit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nId 
     * @param {Pointer<IPart>} ppPart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-idevicetopology-getpartbyid
     */
    GetPartById(nId, ppPart) {
        result := ComCall(7, this, "uint", nId, "ptr*", ppPart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwstrDeviceId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-idevicetopology-getdeviceid
     */
    GetDeviceId(ppwstrDeviceId) {
        result := ComCall(8, this, "ptr", ppwstrDeviceId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPart} pIPartFrom 
     * @param {IPart} pIPartTo 
     * @param {BOOL} bRejectMixedPaths 
     * @param {Pointer<IPartsList>} ppParts 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-idevicetopology-getsignalpath
     */
    GetSignalPath(pIPartFrom, pIPartTo, bRejectMixedPaths, ppParts) {
        result := ComCall(9, this, "ptr", pIPartFrom, "ptr", pIPartTo, "int", bRejectMixedPaths, "ptr*", ppParts, "HRESULT")
        return result
    }
}
