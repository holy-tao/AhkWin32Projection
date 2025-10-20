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
     * 
     * @param {Pointer<PWSTR>} ppwstrName 
     * @returns {HRESULT} 
     */
    GetName(ppwstrName) {
        result := ComCall(3, this, "ptr", ppwstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pnId 
     * @returns {HRESULT} 
     */
    GetLocalId(pnId) {
        result := ComCall(4, this, "uint*", pnId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwstrGlobalId 
     * @returns {HRESULT} 
     */
    GetGlobalId(ppwstrGlobalId) {
        result := ComCall(5, this, "ptr", ppwstrGlobalId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pPartType 
     * @returns {HRESULT} 
     */
    GetPartType(pPartType) {
        result := ComCall(6, this, "int*", pPartType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pSubType 
     * @returns {HRESULT} 
     */
    GetSubType(pSubType) {
        result := ComCall(7, this, "ptr", pSubType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pCount 
     * @returns {HRESULT} 
     */
    GetControlInterfaceCount(pCount) {
        result := ComCall(8, this, "uint*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<IControlInterface>} ppInterfaceDesc 
     * @returns {HRESULT} 
     */
    GetControlInterface(nIndex, ppInterfaceDesc) {
        result := ComCall(9, this, "uint", nIndex, "ptr", ppInterfaceDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPartsList>} ppParts 
     * @returns {HRESULT} 
     */
    EnumPartsIncoming(ppParts) {
        result := ComCall(10, this, "ptr", ppParts, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPartsList>} ppParts 
     * @returns {HRESULT} 
     */
    EnumPartsOutgoing(ppParts) {
        result := ComCall(11, this, "ptr", ppParts, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDeviceTopology>} ppTopology 
     * @returns {HRESULT} 
     */
    GetTopologyObject(ppTopology) {
        result := ComCall(12, this, "ptr", ppTopology, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwClsContext 
     * @param {Pointer<Guid>} refiid 
     * @param {Pointer<Void>} ppvObject 
     * @returns {HRESULT} 
     */
    Activate(dwClsContext, refiid, ppvObject) {
        result := ComCall(13, this, "uint", dwClsContext, "ptr", refiid, "ptr", ppvObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IControlChangeNotify>} pNotify 
     * @returns {HRESULT} 
     */
    RegisterControlChangeCallback(riid, pNotify) {
        result := ComCall(14, this, "ptr", riid, "ptr", pNotify, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IControlChangeNotify>} pNotify 
     * @returns {HRESULT} 
     */
    UnregisterControlChangeCallback(pNotify) {
        result := ComCall(15, this, "ptr", pNotify, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
