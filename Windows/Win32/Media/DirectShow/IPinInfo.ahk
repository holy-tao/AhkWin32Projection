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
     * Defines each configuration setting and associates it with a name. The Connection element is optional.
     * @param {IUnknown} pPin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/eaphost/eapconnectionpropertiesv1schema-connection-connections-element
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
     * The Disconnect event is reserved for future use.
     * @remarks
     * This event is reserved for future use.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WMP/axwmplib-axwindowsmediaplayer-disconnect
     */
    Disconnect() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * The Render method initializes the DVD filter graph.
     * @remarks
     * The `Render` method enables the **MSWebDVD** object to fully initialize the underlying DirectShow filter graph on startup. This eliminates the slight delay that otherwise occurs when the user issues the first command to play a disc or show a menu. There is no case in which `Render` needs to be called before calling any other method. For example, if the application calls [**PlayTitle**](playtitle-method.md) before the filter graph has been initialized, the **MSWebDVD** object calls `Render` automatically before attempting to play the disc.
     * @returns {HRESULT} <span id="iRender"></span><span id="irender"></span><span id="IRENDER"></span>*iRender*
     * 
     * Specifies an integer value indicating whether the filter graph will be destroyed and rebuilt.
     * 
     * 
     * 
     * | Value | Description                                                                                         |
     * |-------|-----------------------------------------------------------------------------------------------------|
     * | 0     | The filter graph will not be destroyed and rebuilt if it already exists. This is the default value. |
     * | 1     | The filter graph will be destroyed and rebuilt if it already exists.                                |
     * 
     * 
     * 
     *  
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/render-method
     */
    Render() {
        result := ComCall(19, this, "HRESULT")
        return result
    }
}
