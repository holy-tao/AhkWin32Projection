#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\SHANDLE_PTR.ahk" { SHANDLE_PTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWebBrowser.ahk" { IWebBrowser }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IWebBrowserApp extends IWebBrowser {
    /**
     * The interface identifier for IWebBrowserApp
     * @type {Guid}
     */
    static IID := Guid("{0002df05-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWebBrowserApp interfaces
    */
    struct Vtbl extends IWebBrowser.Vtbl {
        Quit           : IntPtr
        ClientToWindow : IntPtr
        PutProperty    : IntPtr
        GetProperty    : IntPtr
        get_Name       : IntPtr
        get_HWND       : IntPtr
        get_FullName   : IntPtr
        get_Path       : IntPtr
        get_Visible    : IntPtr
        put_Visible    : IntPtr
        get_StatusBar  : IntPtr
        put_StatusBar  : IntPtr
        get_StatusText : IntPtr
        put_StatusText : IntPtr
        get_ToolBar    : IntPtr
        put_ToolBar    : IntPtr
        get_MenuBar    : IntPtr
        put_MenuBar    : IntPtr
        get_FullScreen : IntPtr
        put_FullScreen : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWebBrowserApp.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {SHANDLE_PTR} 
     */
    HWND {
        get => this.get_HWND()
    }

    /**
     * @type {BSTR} 
     */
    FullName {
        get => this.get_FullName()
    }

    /**
     * @type {BSTR} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Visible {
        get => this.get_Visible()
        set => this.put_Visible(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    StatusBar {
        get => this.get_StatusBar()
        set => this.put_StatusBar(value)
    }

    /**
     * @type {BSTR} 
     */
    StatusText {
        get => this.get_StatusText()
        set => this.put_StatusText(value)
    }

    /**
     * @type {Integer} 
     */
    ToolBar {
        get => this.get_ToolBar()
        set => this.put_ToolBar(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    MenuBar {
        get => this.get_MenuBar()
        set => this.put_MenuBar(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    FullScreen {
        get => this.get_FullScreen()
        set => this.put_FullScreen(value)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Quit() {
        result := ComCall(32, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcx 
     * @param {Pointer<Integer>} pcy 
     * @returns {HRESULT} 
     */
    ClientToWindow(pcx, pcy) {
        pcxMarshal := pcx is VarRef ? "int*" : "ptr"
        pcyMarshal := pcy is VarRef ? "int*" : "ptr"

        result := ComCall(33, this, pcxMarshal, pcx, pcyMarshal, pcy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _Property 
     * @param {VARIANT} vtValue 
     * @returns {HRESULT} 
     */
    PutProperty(_Property, vtValue) {
        _Property := _Property is String ? BSTR.Alloc(_Property).Value : _Property

        result := ComCall(34, this, BSTR, _Property, VARIANT, vtValue, "HRESULT")
        return result
    }

    /**
     * The GetProperty function returns a handle to a given property.
     * @remarks
     * The **GetProperty** function can be used to obtain the property handle needed to locate instances of the property. The functions used to locate property instances are [FindPropertyInstance](findpropertyinstance.md) (which locates the first instance) and [FindPropertyInstanceRestart](findpropertyinstancerestart.md) (which locates the next instance).
     * 
     * [*Experts*](e.md) and [*parsers*](p.md) can call the **GetProperty** function.
     * @param {BSTR} _Property 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/NetMon2/getproperty
     */
    GetProperty(_Property) {
        _Property := _Property is String ? BSTR.Alloc(_Property).Value : _Property

        pvtValue := VARIANT()
        result := ComCall(35, this, BSTR, _Property, VARIANT.Ptr, pvtValue, "HRESULT")
        return pvtValue
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        Name := BSTR.Owned()
        result := ComCall(36, this, BSTR.Ptr, Name, "HRESULT")
        return Name
    }

    /**
     * Gets the handle of the Windows Internet Explorer main window.
     * @remarks
     * Internet Explorer 7. With the introduction of tabbed browsing, the return value of this method can be ambiguous. To alleviate confusion and maintain the highest level of compatibility with existing applications, this method returns a handle to the top-level window frame, not the currently selected tab.
     * @returns {SHANDLE_PTR} 
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-iwebbrowserapp-get_hwnd
     */
    get_HWND() {
        result := ComCall(37, this, SHANDLE_PTR.Ptr, &pHWND := 0, "HRESULT")
        return pHWND
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_FullName() {
        FullName := BSTR.Owned()
        result := ComCall(38, this, BSTR.Ptr, FullName, "HRESULT")
        return FullName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        _Path := BSTR.Owned()
        result := ComCall(39, this, BSTR.Ptr, _Path, "HRESULT")
        return _Path
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Visible() {
        result := ComCall(40, this, VARIANT_BOOL.Ptr, &pBool := 0, "HRESULT")
        return pBool
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     */
    put_Visible(Value) {
        result := ComCall(41, this, VARIANT_BOOL, Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_StatusBar() {
        result := ComCall(42, this, VARIANT_BOOL.Ptr, &pBool := 0, "HRESULT")
        return pBool
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     */
    put_StatusBar(Value) {
        result := ComCall(43, this, VARIANT_BOOL, Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_StatusText() {
        StatusText := BSTR.Owned()
        result := ComCall(44, this, BSTR.Ptr, StatusText, "HRESULT")
        return StatusText
    }

    /**
     * 
     * @param {BSTR} StatusText 
     * @returns {HRESULT} 
     */
    put_StatusText(StatusText) {
        StatusText := StatusText is String ? BSTR.Alloc(StatusText).Value : StatusText

        result := ComCall(45, this, BSTR, StatusText, "HRESULT")
        return result
    }

    /**
     * Sets or gets whether toolbars for the object are visible.
     * @remarks
     * When the IWebBrowser2::ToolBar property is set to FALSE, it is not equivalent to the "toolbar=no" feature of window.open. Instead, it turns off all user interface elements that can be considered toolbars, leaving Windows Internet Explorer in a blank state. 
     * 
     * The WebBrowser object saves the value of this property, but otherwise ignores it.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-iwebbrowserapp-get_toolbar
     */
    get_ToolBar() {
        result := ComCall(46, this, "int*", &Value := 0, "HRESULT")
        return Value
    }

    /**
     * Sets or gets whether toolbars for the object are visible.
     * @remarks
     * When the IWebBrowser2::ToolBar property is set to FALSE, it is not equivalent to the "toolbar=no" feature of window.open. Instead, it turns off all user interface elements that can be considered toolbars, leaving Windows Internet Explorer in a blank state. 
     * 
     * The WebBrowser object saves the value of this property, but otherwise ignores it.
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-iwebbrowserapp-put_toolbar
     */
    put_ToolBar(Value) {
        result := ComCall(47, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_MenuBar() {
        result := ComCall(48, this, VARIANT_BOOL.Ptr, &Value := 0, "HRESULT")
        return Value
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     */
    put_MenuBar(Value) {
        result := ComCall(49, this, VARIANT_BOOL, Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_FullScreen() {
        result := ComCall(50, this, VARIANT_BOOL.Ptr, &pbFullScreen := 0, "HRESULT")
        return pbFullScreen
    }

    /**
     * 
     * @param {VARIANT_BOOL} bFullScreen 
     * @returns {HRESULT} 
     */
    put_FullScreen(bFullScreen) {
        result := ComCall(51, this, VARIANT_BOOL, bFullScreen, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWebBrowserApp.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Quit := CallbackCreate(GetMethod(implObj, "Quit"), flags, 1)
        this.vtbl.ClientToWindow := CallbackCreate(GetMethod(implObj, "ClientToWindow"), flags, 3)
        this.vtbl.PutProperty := CallbackCreate(GetMethod(implObj, "PutProperty"), flags, 3)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 3)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_HWND := CallbackCreate(GetMethod(implObj, "get_HWND"), flags, 2)
        this.vtbl.get_FullName := CallbackCreate(GetMethod(implObj, "get_FullName"), flags, 2)
        this.vtbl.get_Path := CallbackCreate(GetMethod(implObj, "get_Path"), flags, 2)
        this.vtbl.get_Visible := CallbackCreate(GetMethod(implObj, "get_Visible"), flags, 2)
        this.vtbl.put_Visible := CallbackCreate(GetMethod(implObj, "put_Visible"), flags, 2)
        this.vtbl.get_StatusBar := CallbackCreate(GetMethod(implObj, "get_StatusBar"), flags, 2)
        this.vtbl.put_StatusBar := CallbackCreate(GetMethod(implObj, "put_StatusBar"), flags, 2)
        this.vtbl.get_StatusText := CallbackCreate(GetMethod(implObj, "get_StatusText"), flags, 2)
        this.vtbl.put_StatusText := CallbackCreate(GetMethod(implObj, "put_StatusText"), flags, 2)
        this.vtbl.get_ToolBar := CallbackCreate(GetMethod(implObj, "get_ToolBar"), flags, 2)
        this.vtbl.put_ToolBar := CallbackCreate(GetMethod(implObj, "put_ToolBar"), flags, 2)
        this.vtbl.get_MenuBar := CallbackCreate(GetMethod(implObj, "get_MenuBar"), flags, 2)
        this.vtbl.put_MenuBar := CallbackCreate(GetMethod(implObj, "put_MenuBar"), flags, 2)
        this.vtbl.get_FullScreen := CallbackCreate(GetMethod(implObj, "get_FullScreen"), flags, 2)
        this.vtbl.put_FullScreen := CallbackCreate(GetMethod(implObj, "put_FullScreen"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Quit)
        CallbackFree(this.vtbl.ClientToWindow)
        CallbackFree(this.vtbl.PutProperty)
        CallbackFree(this.vtbl.GetProperty)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_HWND)
        CallbackFree(this.vtbl.get_FullName)
        CallbackFree(this.vtbl.get_Path)
        CallbackFree(this.vtbl.get_Visible)
        CallbackFree(this.vtbl.put_Visible)
        CallbackFree(this.vtbl.get_StatusBar)
        CallbackFree(this.vtbl.put_StatusBar)
        CallbackFree(this.vtbl.get_StatusText)
        CallbackFree(this.vtbl.put_StatusText)
        CallbackFree(this.vtbl.get_ToolBar)
        CallbackFree(this.vtbl.put_ToolBar)
        CallbackFree(this.vtbl.get_MenuBar)
        CallbackFree(this.vtbl.put_MenuBar)
        CallbackFree(this.vtbl.get_FullScreen)
        CallbackFree(this.vtbl.put_FullScreen)
    }
}
