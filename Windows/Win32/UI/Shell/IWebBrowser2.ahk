#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWebBrowserApp.ahk" { IWebBrowserApp }
#Import "..\..\System\Ole\OLECMDF.ahk" { OLECMDF }
#Import "..\..\System\Ole\READYSTATE.ahk" { READYSTATE }
#Import "..\..\System\Ole\OLECMDEXECOPT.ahk" { OLECMDEXECOPT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Ole\OLECMDID.ahk" { OLECMDID }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Exposes methods that are implemented by the WebBrowser control (Microsoft ActiveX control) or implemented by an instance of the InternetExplorer application (OLE Automation).
 * @see https://learn.microsoft.com/windows/win32/api/exdisp/nn-exdisp-iwebbrowser2
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IWebBrowser2 extends IWebBrowserApp {
    /**
     * The interface identifier for IWebBrowser2
     * @type {Guid}
     */
    static IID := Guid("{d30c1661-cdaf-11d0-8a3e-00c04fc9e26e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWebBrowser2 interfaces
    */
    struct Vtbl extends IWebBrowserApp.Vtbl {
        Navigate2                : IntPtr
        QueryStatusWB            : IntPtr
        ExecWB                   : IntPtr
        ShowBrowserBar           : IntPtr
        get_ReadyState           : IntPtr
        get_Offline              : IntPtr
        put_Offline              : IntPtr
        get_Silent               : IntPtr
        put_Silent               : IntPtr
        get_RegisterAsBrowser    : IntPtr
        put_RegisterAsBrowser    : IntPtr
        get_RegisterAsDropTarget : IntPtr
        put_RegisterAsDropTarget : IntPtr
        get_TheaterMode          : IntPtr
        put_TheaterMode          : IntPtr
        get_AddressBar           : IntPtr
        put_AddressBar           : IntPtr
        get_Resizable            : IntPtr
        put_Resizable            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWebBrowser2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {READYSTATE} 
     */
    ReadyState {
        get => this.get_ReadyState()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Offline {
        get => this.get_Offline()
        set => this.put_Offline(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Silent {
        get => this.get_Silent()
        set => this.put_Silent(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    RegisterAsBrowser {
        get => this.get_RegisterAsBrowser()
        set => this.put_RegisterAsBrowser(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    RegisterAsDropTarget {
        get => this.get_RegisterAsDropTarget()
        set => this.put_RegisterAsDropTarget(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    TheaterMode {
        get => this.get_TheaterMode()
        set => this.put_TheaterMode(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AddressBar {
        get => this.get_AddressBar()
        set => this.put_AddressBar(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Resizable {
        get => this.get_Resizable()
        set => this.put_Resizable(value)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} URL 
     * @param {Pointer<VARIANT>} Flags 
     * @param {Pointer<VARIANT>} TargetFrameName 
     * @param {Pointer<VARIANT>} PostData 
     * @param {Pointer<VARIANT>} Headers 
     * @returns {HRESULT} 
     */
    Navigate2(URL, Flags, TargetFrameName, PostData, Headers) {
        result := ComCall(52, this, VARIANT.Ptr, URL, VARIANT.Ptr, Flags, VARIANT.Ptr, TargetFrameName, VARIANT.Ptr, PostData, VARIANT.Ptr, Headers, "HRESULT")
        return result
    }

    /**
     * 
     * @param {OLECMDID} cmdID 
     * @returns {OLECMDF} 
     */
    QueryStatusWB(cmdID) {
        result := ComCall(53, this, OLECMDID, cmdID, "int*", &pcmdf := 0, "HRESULT")
        return pcmdf
    }

    /**
     * 
     * @param {OLECMDID} cmdID 
     * @param {OLECMDEXECOPT} cmdexecopt 
     * @param {Pointer<VARIANT>} pvaIn 
     * @param {Pointer<VARIANT>} pvaOut 
     * @returns {HRESULT} 
     */
    ExecWB(cmdID, cmdexecopt, pvaIn, pvaOut) {
        result := ComCall(54, this, OLECMDID, cmdID, OLECMDEXECOPT, cmdexecopt, VARIANT.Ptr, pvaIn, VARIANT.Ptr, pvaOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvaClsid 
     * @param {Pointer<VARIANT>} pvarShow 
     * @param {Pointer<VARIANT>} pvarSize 
     * @returns {HRESULT} 
     */
    ShowBrowserBar(pvaClsid, pvarShow, pvarSize) {
        result := ComCall(55, this, VARIANT.Ptr, pvaClsid, VARIANT.Ptr, pvarShow, VARIANT.Ptr, pvarSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {READYSTATE} 
     */
    get_ReadyState() {
        result := ComCall(56, this, "int*", &plReadyState := 0, "HRESULT")
        return plReadyState
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Offline() {
        result := ComCall(57, this, VARIANT_BOOL.Ptr, &pbOffline := 0, "HRESULT")
        return pbOffline
    }

    /**
     * 
     * @param {VARIANT_BOOL} bOffline 
     * @returns {HRESULT} 
     */
    put_Offline(bOffline) {
        result := ComCall(58, this, VARIANT_BOOL, bOffline, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Silent() {
        result := ComCall(59, this, VARIANT_BOOL.Ptr, &pbSilent := 0, "HRESULT")
        return pbSilent
    }

    /**
     * 
     * @param {VARIANT_BOOL} bSilent 
     * @returns {HRESULT} 
     */
    put_Silent(bSilent) {
        result := ComCall(60, this, VARIANT_BOOL, bSilent, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_RegisterAsBrowser() {
        result := ComCall(61, this, VARIANT_BOOL.Ptr, &pbRegister := 0, "HRESULT")
        return pbRegister
    }

    /**
     * 
     * @param {VARIANT_BOOL} bRegister 
     * @returns {HRESULT} 
     */
    put_RegisterAsBrowser(bRegister) {
        result := ComCall(62, this, VARIANT_BOOL, bRegister, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_RegisterAsDropTarget() {
        result := ComCall(63, this, VARIANT_BOOL.Ptr, &pbRegister := 0, "HRESULT")
        return pbRegister
    }

    /**
     * 
     * @param {VARIANT_BOOL} bRegister 
     * @returns {HRESULT} 
     */
    put_RegisterAsDropTarget(bRegister) {
        result := ComCall(64, this, VARIANT_BOOL, bRegister, "HRESULT")
        return result
    }

    /**
     * Sets or gets whether the object is in theater mode. (Get)
     * @remarks
     * In theater mode, the object's main window fills the entire screen and displays a toolbar that has a minimal set of navigational buttons. A status bar is also provided in the upper-right corner of the screen. Explorer bars, such as  History  and Favorites , are displayed as an autohide pane on the left edge of the screen in theater mode. 
     * 
     * Setting TheaterMode (even to VARIANT_FALSE) resets the values of the IWebBrowser2::AddressBar and IWebBrowser2::ToolBar properties to VARIANT_TRUE. Disable the address bar and toolbars after you set the TheaterMode property. 
     * 
     * The WebBrowser object saves the value of this property, but otherwise ignores it.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-iwebbrowser2-get_theatermode
     */
    get_TheaterMode() {
        result := ComCall(65, this, VARIANT_BOOL.Ptr, &pbRegister := 0, "HRESULT")
        return pbRegister
    }

    /**
     * Sets or gets whether the object is in theater mode. (Put)
     * @remarks
     * In theater mode, the object's main window fills the entire screen and displays a toolbar that has a minimal set of navigational buttons. A status bar is also provided in the upper-right corner of the screen. Explorer bars, such as  History  and Favorites , are displayed as an autohide pane on the left edge of the screen in theater mode. 
     * 
     * Setting TheaterMode (even to VARIANT_FALSE) resets the values of the IWebBrowser2::AddressBar and IWebBrowser2::ToolBar properties to VARIANT_TRUE. Disable the address bar and toolbars after you set the TheaterMode property. 
     * 
     * The WebBrowser object saves the value of this property, but otherwise ignores it.
     * @param {VARIANT_BOOL} bRegister 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-iwebbrowser2-put_theatermode
     */
    put_TheaterMode(bRegister) {
        result := ComCall(66, this, VARIANT_BOOL, bRegister, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_AddressBar() {
        result := ComCall(67, this, VARIANT_BOOL.Ptr, &Value := 0, "HRESULT")
        return Value
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     */
    put_AddressBar(Value) {
        result := ComCall(68, this, VARIANT_BOOL, Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Resizable() {
        result := ComCall(69, this, VARIANT_BOOL.Ptr, &Value := 0, "HRESULT")
        return Value
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     */
    put_Resizable(Value) {
        result := ComCall(70, this, VARIANT_BOOL, Value, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWebBrowser2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Navigate2 := CallbackCreate(GetMethod(implObj, "Navigate2"), flags, 6)
        this.vtbl.QueryStatusWB := CallbackCreate(GetMethod(implObj, "QueryStatusWB"), flags, 3)
        this.vtbl.ExecWB := CallbackCreate(GetMethod(implObj, "ExecWB"), flags, 5)
        this.vtbl.ShowBrowserBar := CallbackCreate(GetMethod(implObj, "ShowBrowserBar"), flags, 4)
        this.vtbl.get_ReadyState := CallbackCreate(GetMethod(implObj, "get_ReadyState"), flags, 2)
        this.vtbl.get_Offline := CallbackCreate(GetMethod(implObj, "get_Offline"), flags, 2)
        this.vtbl.put_Offline := CallbackCreate(GetMethod(implObj, "put_Offline"), flags, 2)
        this.vtbl.get_Silent := CallbackCreate(GetMethod(implObj, "get_Silent"), flags, 2)
        this.vtbl.put_Silent := CallbackCreate(GetMethod(implObj, "put_Silent"), flags, 2)
        this.vtbl.get_RegisterAsBrowser := CallbackCreate(GetMethod(implObj, "get_RegisterAsBrowser"), flags, 2)
        this.vtbl.put_RegisterAsBrowser := CallbackCreate(GetMethod(implObj, "put_RegisterAsBrowser"), flags, 2)
        this.vtbl.get_RegisterAsDropTarget := CallbackCreate(GetMethod(implObj, "get_RegisterAsDropTarget"), flags, 2)
        this.vtbl.put_RegisterAsDropTarget := CallbackCreate(GetMethod(implObj, "put_RegisterAsDropTarget"), flags, 2)
        this.vtbl.get_TheaterMode := CallbackCreate(GetMethod(implObj, "get_TheaterMode"), flags, 2)
        this.vtbl.put_TheaterMode := CallbackCreate(GetMethod(implObj, "put_TheaterMode"), flags, 2)
        this.vtbl.get_AddressBar := CallbackCreate(GetMethod(implObj, "get_AddressBar"), flags, 2)
        this.vtbl.put_AddressBar := CallbackCreate(GetMethod(implObj, "put_AddressBar"), flags, 2)
        this.vtbl.get_Resizable := CallbackCreate(GetMethod(implObj, "get_Resizable"), flags, 2)
        this.vtbl.put_Resizable := CallbackCreate(GetMethod(implObj, "put_Resizable"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Navigate2)
        CallbackFree(this.vtbl.QueryStatusWB)
        CallbackFree(this.vtbl.ExecWB)
        CallbackFree(this.vtbl.ShowBrowserBar)
        CallbackFree(this.vtbl.get_ReadyState)
        CallbackFree(this.vtbl.get_Offline)
        CallbackFree(this.vtbl.put_Offline)
        CallbackFree(this.vtbl.get_Silent)
        CallbackFree(this.vtbl.put_Silent)
        CallbackFree(this.vtbl.get_RegisterAsBrowser)
        CallbackFree(this.vtbl.put_RegisterAsBrowser)
        CallbackFree(this.vtbl.get_RegisterAsDropTarget)
        CallbackFree(this.vtbl.put_RegisterAsDropTarget)
        CallbackFree(this.vtbl.get_TheaterMode)
        CallbackFree(this.vtbl.put_TheaterMode)
        CallbackFree(this.vtbl.get_AddressBar)
        CallbackFree(this.vtbl.put_AddressBar)
        CallbackFree(this.vtbl.get_Resizable)
        CallbackFree(this.vtbl.put_Resizable)
    }
}
