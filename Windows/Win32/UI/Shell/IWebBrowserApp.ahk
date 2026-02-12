#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\Foundation\SHANDLE_PTR.ahk
#Include .\IWebBrowser.ahk

/**
 * Gets the handle of the Windows Internet Explorer main window.
 * @remarks
 * Internet Explorer 7. With the introduction of tabbed browsing, the return value of this method can be ambiguous. To alleviate confusion and maintain the highest level of compatibility with existing applications, this method returns a handle to the top-level window frame, not the currently selected tab.
 * @see https://learn.microsoft.com/windows/win32/api//content/exdisp/nf-exdisp-iwebbrowserapp-get_hwnd
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IWebBrowserApp extends IWebBrowser{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebBrowserApp
     * @type {Guid}
     */
    static IID => Guid("{0002df05-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 32

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Quit", "ClientToWindow", "PutProperty", "GetProperty", "get_Name", "get_HWND", "get_FullName", "get_Path", "get_Visible", "put_Visible", "get_StatusBar", "put_StatusBar", "get_StatusText", "put_StatusText", "get_ToolBar", "put_ToolBar", "get_MenuBar", "put_MenuBar", "get_FullScreen", "put_FullScreen"]

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
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/excel/quitframework
     */
    Quit() {
        result := ComCall(32, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(33, this, pcxMarshal, pcx, pcyMarshal, pcy, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} Property_ 
     * @param {VARIANT} vtValue 
     * @returns {HRESULT} 
     */
    PutProperty(Property_, vtValue) {
        if(Property_ is String) {
            pin := BSTR.Alloc(Property_)
            Property_ := pin.Value
        }

        result := ComCall(34, this, "ptr", Property_, "ptr", vtValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetProperty function returns a handle to a given property.
     * @remarks
     * The **GetProperty** function can be used to obtain the property handle needed to locate instances of the property. The functions used to locate property instances are [FindPropertyInstance](findpropertyinstance.md) (which locates the first instance) and [FindPropertyInstanceRestart](findpropertyinstancerestart.md) (which locates the next instance).
     * 
     * [*Experts*](e.md) and [*parsers*](p.md) can call the **GetProperty** function.
     * @param {BSTR} Property_ 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/NetMon2/getproperty
     */
    GetProperty(Property_) {
        if(Property_ is String) {
            pin := BSTR.Alloc(Property_)
            Property_ := pin.Value
        }

        pvtValue := VARIANT()
        result := ComCall(35, this, "ptr", Property_, "ptr", pvtValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvtValue
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        Name := BSTR()
        result := ComCall(36, this, "ptr", Name, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Name
    }

    /**
     * Gets the handle of the Windows Internet Explorer main window.
     * @remarks
     * Internet Explorer 7. With the introduction of tabbed browsing, the return value of this method can be ambiguous. To alleviate confusion and maintain the highest level of compatibility with existing applications, this method returns a handle to the top-level window frame, not the currently selected tab.
     * @returns {SHANDLE_PTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/exdisp/nf-exdisp-iwebbrowserapp-get_hwnd
     */
    get_HWND() {
        pHWND := SHANDLE_PTR()
        result := ComCall(37, this, "ptr", pHWND, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pHWND
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_FullName() {
        FullName := BSTR()
        result := ComCall(38, this, "ptr", FullName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FullName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        Path_ := BSTR()
        result := ComCall(39, this, "ptr", Path_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Path_
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Visible() {
        result := ComCall(40, this, "short*", &pBool := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pBool
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     */
    put_Visible(Value) {
        result := ComCall(41, this, "short", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_StatusBar() {
        result := ComCall(42, this, "short*", &pBool := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pBool
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     */
    put_StatusBar(Value) {
        result := ComCall(43, this, "short", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_StatusText() {
        StatusText := BSTR()
        result := ComCall(44, this, "ptr", StatusText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StatusText
    }

    /**
     * 
     * @param {BSTR} StatusText 
     * @returns {HRESULT} 
     */
    put_StatusText(StatusText) {
        if(StatusText is String) {
            pin := BSTR.Alloc(StatusText)
            StatusText := pin.Value
        }

        result := ComCall(45, this, "ptr", StatusText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets or gets whether toolbars for the object are visible.
     * @remarks
     * When the IWebBrowser2::ToolBar property is set to FALSE, it is not equivalent to the "toolbar=no" feature of window.open. Instead, it turns off all user interface elements that can be considered toolbars, leaving Windows Internet Explorer in a blank state. 
     * 
     * The WebBrowser object saves the value of this property, but otherwise ignores it.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/exdisp/nf-exdisp-iwebbrowserapp-get_toolbar
     */
    get_ToolBar() {
        result := ComCall(46, this, "int*", &Value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/exdisp/nf-exdisp-iwebbrowserapp-put_toolbar
     */
    put_ToolBar(Value) {
        result := ComCall(47, this, "int", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_MenuBar() {
        result := ComCall(48, this, "short*", &Value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Value
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     */
    put_MenuBar(Value) {
        result := ComCall(49, this, "short", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_FullScreen() {
        result := ComCall(50, this, "short*", &pbFullScreen := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbFullScreen
    }

    /**
     * 
     * @param {VARIANT_BOOL} bFullScreen 
     * @returns {HRESULT} 
     */
    put_FullScreen(bFullScreen) {
        result := ComCall(51, this, "short", bFullScreen, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
