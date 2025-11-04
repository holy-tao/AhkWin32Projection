#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<PWSTR>} ppwstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-getname
     */
    GetName(ppwstrName) {
        result := ComCall(3, this, "ptr", ppwstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pnId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-getlocalid
     */
    GetLocalId(pnId) {
        pnIdMarshal := pnId is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pnIdMarshal, pnId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwstrGlobalId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-getglobalid
     */
    GetGlobalId(ppwstrGlobalId) {
        result := ComCall(5, this, "ptr", ppwstrGlobalId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pPartType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-getparttype
     */
    GetPartType(pPartType) {
        pPartTypeMarshal := pPartType is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pPartTypeMarshal, pPartType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pSubType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-getsubtype
     */
    GetSubType(pSubType) {
        result := ComCall(7, this, "ptr", pSubType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-getcontrolinterfacecount
     */
    GetControlInterfaceCount(pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<IControlInterface>} ppInterfaceDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-getcontrolinterface
     */
    GetControlInterface(nIndex, ppInterfaceDesc) {
        result := ComCall(9, this, "uint", nIndex, "ptr*", ppInterfaceDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPartsList>} ppParts 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-enumpartsincoming
     */
    EnumPartsIncoming(ppParts) {
        result := ComCall(10, this, "ptr*", ppParts, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPartsList>} ppParts 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-enumpartsoutgoing
     */
    EnumPartsOutgoing(ppParts) {
        result := ComCall(11, this, "ptr*", ppParts, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDeviceTopology>} ppTopology 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-gettopologyobject
     */
    GetTopologyObject(ppTopology) {
        result := ComCall(12, this, "ptr*", ppTopology, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwClsContext 
     * @param {Pointer<Guid>} refiid 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-activate
     */
    Activate(dwClsContext, refiid, ppvObject) {
        ppvObjectMarshal := ppvObject is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, "uint", dwClsContext, "ptr", refiid, ppvObjectMarshal, ppvObject, "HRESULT")
        return result
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
