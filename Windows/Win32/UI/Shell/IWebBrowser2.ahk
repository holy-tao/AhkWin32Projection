#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWebBrowserApp.ahk

/**
 * Exposes methods that are implemented by the WebBrowser control (Microsoft ActiveX control) or implemented by an instance of the InternetExplorer application (OLE Automation).
 * @see https://docs.microsoft.com/windows/win32/api//exdisp/nn-exdisp-iwebbrowser2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IWebBrowser2 extends IWebBrowserApp{
    /**
     * The interface identifier for IWebBrowser2
     * @type {Guid}
     */
    static IID => Guid("{d30c1661-cdaf-11d0-8a3e-00c04fc9e26e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 52

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
        result := ComCall(52, this, "ptr", URL, "ptr", Flags, "ptr", TargetFrameName, "ptr", PostData, "ptr", Headers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cmdID 
     * @param {Pointer<Int32>} pcmdf 
     * @returns {HRESULT} 
     */
    QueryStatusWB(cmdID, pcmdf) {
        result := ComCall(53, this, "int", cmdID, "int*", pcmdf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cmdID 
     * @param {Integer} cmdexecopt 
     * @param {Pointer<VARIANT>} pvaIn 
     * @param {Pointer<VARIANT>} pvaOut 
     * @returns {HRESULT} 
     */
    ExecWB(cmdID, cmdexecopt, pvaIn, pvaOut) {
        result := ComCall(54, this, "int", cmdID, "int", cmdexecopt, "ptr", pvaIn, "ptr", pvaOut, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(55, this, "ptr", pvaClsid, "ptr", pvarShow, "ptr", pvarSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plReadyState 
     * @returns {HRESULT} 
     */
    get_ReadyState(plReadyState) {
        result := ComCall(56, this, "int*", plReadyState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbOffline 
     * @returns {HRESULT} 
     */
    get_Offline(pbOffline) {
        result := ComCall(57, this, "ptr", pbOffline, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bOffline 
     * @returns {HRESULT} 
     */
    put_Offline(bOffline) {
        result := ComCall(58, this, "short", bOffline, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbSilent 
     * @returns {HRESULT} 
     */
    get_Silent(pbSilent) {
        result := ComCall(59, this, "ptr", pbSilent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bSilent 
     * @returns {HRESULT} 
     */
    put_Silent(bSilent) {
        result := ComCall(60, this, "short", bSilent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbRegister 
     * @returns {HRESULT} 
     */
    get_RegisterAsBrowser(pbRegister) {
        result := ComCall(61, this, "ptr", pbRegister, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bRegister 
     * @returns {HRESULT} 
     */
    put_RegisterAsBrowser(bRegister) {
        result := ComCall(62, this, "short", bRegister, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbRegister 
     * @returns {HRESULT} 
     */
    get_RegisterAsDropTarget(pbRegister) {
        result := ComCall(63, this, "ptr", pbRegister, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bRegister 
     * @returns {HRESULT} 
     */
    put_RegisterAsDropTarget(bRegister) {
        result := ComCall(64, this, "short", bRegister, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbRegister 
     * @returns {HRESULT} 
     */
    get_TheaterMode(pbRegister) {
        result := ComCall(65, this, "ptr", pbRegister, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bRegister 
     * @returns {HRESULT} 
     */
    put_TheaterMode(bRegister) {
        result := ComCall(66, this, "short", bRegister, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Value 
     * @returns {HRESULT} 
     */
    get_AddressBar(Value) {
        result := ComCall(67, this, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     */
    put_AddressBar(Value) {
        result := ComCall(68, this, "short", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Value 
     * @returns {HRESULT} 
     */
    get_Resizable(Value) {
        result := ComCall(69, this, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     */
    put_Resizable(Value) {
        result := ComCall(70, this, "short", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
