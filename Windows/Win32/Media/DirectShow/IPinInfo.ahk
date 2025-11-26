#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\Foundation\BSTR.ahk

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
     * @type {IUnknown} 
     */
    Pin {
        get => this.get_Pin()
    }

    /**
     * @type {IDispatch} 
     */
    ConnectedTo {
        get => this.get_ConnectedTo()
    }

    /**
     * @type {IDispatch} 
     */
    ConnectionMediaType {
        get => this.get_ConnectionMediaType()
    }

    /**
     * @type {IDispatch} 
     */
    FilterInfo {
        get => this.get_FilterInfo()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {Integer} 
     */
    Direction {
        get => this.get_Direction()
    }

    /**
     * @type {BSTR} 
     */
    PinID {
        get => this.get_PinID()
    }

    /**
     * @type {IDispatch} 
     */
    MediaTypes {
        get => this.get_MediaTypes()
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get_Pin() {
        result := ComCall(7, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_ConnectedTo() {
        result := ComCall(8, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IDispatch(ppUnk)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_ConnectionMediaType() {
        result := ComCall(9, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IDispatch(ppUnk)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_FilterInfo() {
        result := ComCall(10, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IDispatch(ppUnk)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        ppUnk := BSTR()
        result := ComCall(11, this, "ptr", ppUnk, "HRESULT")
        return ppUnk
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Direction() {
        result := ComCall(12, this, "int*", &ppDirection := 0, "HRESULT")
        return ppDirection
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PinID() {
        strPinID := BSTR()
        result := ComCall(13, this, "ptr", strPinID, "HRESULT")
        return strPinID
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_MediaTypes() {
        result := ComCall(14, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IDispatch(ppUnk)
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
