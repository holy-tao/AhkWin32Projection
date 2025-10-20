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
     * 
     * @returns {HRESULT} 
     */
    Quit() {
        result := ComCall(32, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pcx 
     * @param {Pointer<Int32>} pcy 
     * @returns {HRESULT} 
     */
    ClientToWindow(pcx, pcy) {
        result := ComCall(33, this, "int*", pcx, "int*", pcy, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(34, this, "ptr", Property, "ptr", vtValue, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(35, this, "ptr", Property, "ptr", pvtValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Name 
     * @returns {HRESULT} 
     */
    get_Name(Name) {
        result := ComCall(36, this, "ptr", Name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SHANDLE_PTR>} pHWND 
     * @returns {HRESULT} 
     */
    get_HWND(pHWND) {
        result := ComCall(37, this, "ptr", pHWND, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} FullName 
     * @returns {HRESULT} 
     */
    get_FullName(FullName) {
        result := ComCall(38, this, "ptr", FullName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Path 
     * @returns {HRESULT} 
     */
    get_Path(Path) {
        result := ComCall(39, this, "ptr", Path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pBool 
     * @returns {HRESULT} 
     */
    get_Visible(pBool) {
        result := ComCall(40, this, "ptr", pBool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     */
    put_Visible(Value) {
        result := ComCall(41, this, "short", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pBool 
     * @returns {HRESULT} 
     */
    get_StatusBar(pBool) {
        result := ComCall(42, this, "ptr", pBool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     */
    put_StatusBar(Value) {
        result := ComCall(43, this, "short", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} StatusText 
     * @returns {HRESULT} 
     */
    get_StatusText(StatusText) {
        result := ComCall(44, this, "ptr", StatusText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} StatusText 
     * @returns {HRESULT} 
     */
    put_StatusText(StatusText) {
        StatusText := StatusText is String ? BSTR.Alloc(StatusText).Value : StatusText

        result := ComCall(45, this, "ptr", StatusText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Value 
     * @returns {HRESULT} 
     */
    get_ToolBar(Value) {
        result := ComCall(46, this, "int*", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    put_ToolBar(Value) {
        result := ComCall(47, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Value 
     * @returns {HRESULT} 
     */
    get_MenuBar(Value) {
        result := ComCall(48, this, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     */
    put_MenuBar(Value) {
        result := ComCall(49, this, "short", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbFullScreen 
     * @returns {HRESULT} 
     */
    get_FullScreen(pbFullScreen) {
        result := ComCall(50, this, "ptr", pbFullScreen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bFullScreen 
     * @returns {HRESULT} 
     */
    put_FullScreen(bFullScreen) {
        result := ComCall(51, this, "short", bFullScreen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
