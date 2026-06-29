#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IPinInfo extends IDispatch {
    /**
     * The interface identifier for IPinInfo
     * @type {Guid}
     */
    static IID := Guid("{56a868bd-0ad4-11ce-b03a-0020af0ba770}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPinInfo interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Pin                 : IntPtr
        get_ConnectedTo         : IntPtr
        get_ConnectionMediaType : IntPtr
        get_FilterInfo          : IntPtr
        get_Name                : IntPtr
        get_Direction           : IntPtr
        get_PinID               : IntPtr
        get_MediaTypes          : IntPtr
        Connect                 : IntPtr
        ConnectDirect           : IntPtr
        ConnectWithType         : IntPtr
        Disconnect              : IntPtr
        Render                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPinInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        ppUnk := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, ppUnk, "HRESULT")
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
        strPinID := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, strPinID, "HRESULT")
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

    Query(iid) {
        if (IPinInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Pin := CallbackCreate(GetMethod(implObj, "get_Pin"), flags, 2)
        this.vtbl.get_ConnectedTo := CallbackCreate(GetMethod(implObj, "get_ConnectedTo"), flags, 2)
        this.vtbl.get_ConnectionMediaType := CallbackCreate(GetMethod(implObj, "get_ConnectionMediaType"), flags, 2)
        this.vtbl.get_FilterInfo := CallbackCreate(GetMethod(implObj, "get_FilterInfo"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_Direction := CallbackCreate(GetMethod(implObj, "get_Direction"), flags, 2)
        this.vtbl.get_PinID := CallbackCreate(GetMethod(implObj, "get_PinID"), flags, 2)
        this.vtbl.get_MediaTypes := CallbackCreate(GetMethod(implObj, "get_MediaTypes"), flags, 2)
        this.vtbl.Connect := CallbackCreate(GetMethod(implObj, "Connect"), flags, 2)
        this.vtbl.ConnectDirect := CallbackCreate(GetMethod(implObj, "ConnectDirect"), flags, 2)
        this.vtbl.ConnectWithType := CallbackCreate(GetMethod(implObj, "ConnectWithType"), flags, 3)
        this.vtbl.Disconnect := CallbackCreate(GetMethod(implObj, "Disconnect"), flags, 1)
        this.vtbl.Render := CallbackCreate(GetMethod(implObj, "Render"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Pin)
        CallbackFree(this.vtbl.get_ConnectedTo)
        CallbackFree(this.vtbl.get_ConnectionMediaType)
        CallbackFree(this.vtbl.get_FilterInfo)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_Direction)
        CallbackFree(this.vtbl.get_PinID)
        CallbackFree(this.vtbl.get_MediaTypes)
        CallbackFree(this.vtbl.Connect)
        CallbackFree(this.vtbl.ConnectDirect)
        CallbackFree(this.vtbl.ConnectWithType)
        CallbackFree(this.vtbl.Disconnect)
        CallbackFree(this.vtbl.Render)
    }
}
