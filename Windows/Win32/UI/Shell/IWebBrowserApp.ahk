#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<VARIANT>} pvtValue 
     * @returns {HRESULT} 
     */
    GetProperty(Property, pvtValue) {
        Property := Property is String ? BSTR.Alloc(Property).Value : Property

        result := ComCall(35, this, "ptr", Property, "ptr", pvtValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Name 
     * @returns {HRESULT} 
     */
    get_Name(Name) {
        result := ComCall(36, this, "ptr", Name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SHANDLE_PTR>} pHWND 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-iwebbrowserapp-get_hwnd
     */
    get_HWND(pHWND) {
        result := ComCall(37, this, "ptr", pHWND, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} FullName 
     * @returns {HRESULT} 
     */
    get_FullName(FullName) {
        result := ComCall(38, this, "ptr", FullName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Path 
     * @returns {HRESULT} 
     */
    get_Path(Path) {
        result := ComCall(39, this, "ptr", Path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pBool 
     * @returns {HRESULT} 
     */
    get_Visible(pBool) {
        result := ComCall(40, this, "ptr", pBool, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} pBool 
     * @returns {HRESULT} 
     */
    get_StatusBar(pBool) {
        result := ComCall(42, this, "ptr", pBool, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} StatusText 
     * @returns {HRESULT} 
     */
    get_StatusText(StatusText) {
        result := ComCall(44, this, "ptr", StatusText, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-iwebbrowserapp-get_toolbar
     */
    get_ToolBar(Value) {
        ValueMarshal := Value is VarRef ? "int*" : "ptr"

        result := ComCall(46, this, ValueMarshal, Value, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} Value 
     * @returns {HRESULT} 
     */
    get_MenuBar(Value) {
        result := ComCall(48, this, "ptr", Value, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} pbFullScreen 
     * @returns {HRESULT} 
     */
    get_FullScreen(pbFullScreen) {
        result := ComCall(50, this, "ptr", pbFullScreen, "HRESULT")
        return result
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
