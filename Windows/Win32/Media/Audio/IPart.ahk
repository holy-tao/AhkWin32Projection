#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IControlInterface.ahk
#Include .\IPartsList.ahk
#Include .\IDeviceTopology.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPart interface represents a part (connector or subunit) of a device topology.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-ipart
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IPart extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPart
     * @type {Guid}
     */
    static IID => Guid("{ae2de0e4-5bca-4f2d-aa46-5d13f8fdb3a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetLocalId", "GetGlobalId", "GetPartType", "GetSubType", "GetControlInterfaceCount", "GetControlInterface", "EnumPartsIncoming", "EnumPartsOutgoing", "GetTopologyObject", "Activate", "RegisterControlChangeCallback", "UnregisterControlChangeCallback"]

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-getname
     */
    GetName() {
        result := ComCall(3, this, "ptr*", &ppwstrName := 0, "HRESULT")
        return ppwstrName
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-getlocalid
     */
    GetLocalId() {
        result := ComCall(4, this, "uint*", &pnId := 0, "HRESULT")
        return pnId
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-getglobalid
     */
    GetGlobalId() {
        result := ComCall(5, this, "ptr*", &ppwstrGlobalId := 0, "HRESULT")
        return ppwstrGlobalId
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-getparttype
     */
    GetPartType() {
        result := ComCall(6, this, "int*", &pPartType := 0, "HRESULT")
        return pPartType
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-getsubtype
     */
    GetSubType() {
        pSubType := Guid()
        result := ComCall(7, this, "ptr", pSubType, "HRESULT")
        return pSubType
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-getcontrolinterfacecount
     */
    GetControlInterfaceCount() {
        result := ComCall(8, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {IControlInterface} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-getcontrolinterface
     */
    GetControlInterface(nIndex) {
        result := ComCall(9, this, "uint", nIndex, "ptr*", &ppInterfaceDesc := 0, "HRESULT")
        return IControlInterface(ppInterfaceDesc)
    }

    /**
     * 
     * @returns {IPartsList} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-enumpartsincoming
     */
    EnumPartsIncoming() {
        result := ComCall(10, this, "ptr*", &ppParts := 0, "HRESULT")
        return IPartsList(ppParts)
    }

    /**
     * 
     * @returns {IPartsList} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-enumpartsoutgoing
     */
    EnumPartsOutgoing() {
        result := ComCall(11, this, "ptr*", &ppParts := 0, "HRESULT")
        return IPartsList(ppParts)
    }

    /**
     * 
     * @returns {IDeviceTopology} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-gettopologyobject
     */
    GetTopologyObject() {
        result := ComCall(12, this, "ptr*", &ppTopology := 0, "HRESULT")
        return IDeviceTopology(ppTopology)
    }

    /**
     * 
     * @param {Integer} dwClsContext 
     * @param {Pointer<Guid>} refiid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-activate
     */
    Activate(dwClsContext, refiid) {
        result := ComCall(13, this, "uint", dwClsContext, "ptr", refiid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {IControlChangeNotify} pNotify 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-registercontrolchangecallback
     */
    RegisterControlChangeCallback(riid, pNotify) {
        result := ComCall(14, this, "ptr", riid, "ptr", pNotify, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IControlChangeNotify} pNotify 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-unregistercontrolchangecallback
     */
    UnregisterControlChangeCallback(pNotify) {
        result := ComCall(15, this, "ptr", pNotify, "HRESULT")
        return result
    }
}
