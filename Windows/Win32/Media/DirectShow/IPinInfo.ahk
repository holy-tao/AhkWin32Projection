#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IPinInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPinInfo
     * @type {Guid}
     */
    static IID => Guid("{56a868bd-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Pin", "get_ConnectedTo", "get_ConnectionMediaType", "get_FilterInfo", "get_Name", "get_Direction", "get_PinID", "get_MediaTypes", "Connect", "ConnectDirect", "ConnectWithType", "Disconnect", "Render"]

    /**
     * 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    get_Pin(ppUnk) {
        result := ComCall(7, this, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppUnk 
     * @returns {HRESULT} 
     */
    get_ConnectedTo(ppUnk) {
        result := ComCall(8, this, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppUnk 
     * @returns {HRESULT} 
     */
    get_ConnectionMediaType(ppUnk) {
        result := ComCall(9, this, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppUnk 
     * @returns {HRESULT} 
     */
    get_FilterInfo(ppUnk) {
        result := ComCall(10, this, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppUnk 
     * @returns {HRESULT} 
     */
    get_Name(ppUnk) {
        result := ComCall(11, this, "ptr", ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} ppDirection 
     * @returns {HRESULT} 
     */
    get_Direction(ppDirection) {
        result := ComCall(12, this, "int*", ppDirection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strPinID 
     * @returns {HRESULT} 
     */
    get_PinID(strPinID) {
        result := ComCall(13, this, "ptr", strPinID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppUnk 
     * @returns {HRESULT} 
     */
    get_MediaTypes(ppUnk) {
        result := ComCall(14, this, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pPin 
     * @returns {HRESULT} 
     */
    Connect(pPin) {
        result := ComCall(15, this, "ptr", pPin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pPin 
     * @returns {HRESULT} 
     */
    ConnectDirect(pPin) {
        result := ComCall(16, this, "ptr", pPin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pPin 
     * @param {IDispatch} pMediaType 
     * @returns {HRESULT} 
     */
    ConnectWithType(pPin, pMediaType) {
        result := ComCall(17, this, "ptr", pPin, "ptr", pMediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Disconnect() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Render() {
        result := ComCall(19, this, "HRESULT")
        return result
    }
}
