#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IWebBrowser.ahk

/**
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
     * @param {BSTR} Property 
     * @param {VARIANT} vtValue 
     * @returns {HRESULT} 
     */
    PutProperty(Property, vtValue) {
        Property := Property is String ? BSTR.Alloc(Property).Value : Property

        result := ComCall(34, this, "ptr", Property, "ptr", vtValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Property 
     * @returns {VARIANT} 
     */
    GetProperty(Property) {
        Property := Property is String ? BSTR.Alloc(Property).Value : Property

        pvtValue := VARIANT()
        result := ComCall(35, this, "ptr", Property, "ptr", pvtValue, "HRESULT")
        return pvtValue
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        Name := BSTR()
        result := ComCall(36, this, "ptr", Name, "HRESULT")
        return Name
    }

    /**
     * 
     * @returns {SHANDLE_PTR} 
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-iwebbrowserapp-get_hwnd
     */
    get_HWND() {
        result := ComCall(37, this, "ptr*", &pHWND := 0, "HRESULT")
        return pHWND
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_FullName() {
        FullName := BSTR()
        result := ComCall(38, this, "ptr", FullName, "HRESULT")
        return FullName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        Path := BSTR()
        result := ComCall(39, this, "ptr", Path, "HRESULT")
        return Path
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Visible() {
        result := ComCall(40, this, "short*", &pBool := 0, "HRESULT")
        return pBool
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     */
    put_Visible(Value) {
        result := ComCall(41, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_StatusBar() {
        result := ComCall(42, this, "short*", &pBool := 0, "HRESULT")
        return pBool
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     */
    put_StatusBar(Value) {
        result := ComCall(43, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_StatusText() {
        StatusText := BSTR()
        result := ComCall(44, this, "ptr", StatusText, "HRESULT")
        return StatusText
    }

    /**
     * 
     * @param {BSTR} StatusText 
     * @returns {HRESULT} 
     */
    put_StatusText(StatusText) {
        StatusText := StatusText is String ? BSTR.Alloc(StatusText).Value : StatusText

        result := ComCall(45, this, "ptr", StatusText, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-iwebbrowserapp-get_toolbar
     */
    get_ToolBar() {
        result := ComCall(46, this, "int*", &Value := 0, "HRESULT")
        return Value
    }

    /**
     * 
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
        result := ComCall(48, this, "short*", &Value := 0, "HRESULT")
        return Value
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     */
    put_MenuBar(Value) {
        result := ComCall(49, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_FullScreen() {
        result := ComCall(50, this, "short*", &pbFullScreen := 0, "HRESULT")
        return pbFullScreen
    }

    /**
     * 
     * @param {VARIANT_BOOL} bFullScreen 
     * @returns {HRESULT} 
     */
    put_FullScreen(bFullScreen) {
        result := ComCall(51, this, "short", bFullScreen, "HRESULT")
        return result
    }
}
