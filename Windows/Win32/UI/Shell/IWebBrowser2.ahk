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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Navigate2", "QueryStatusWB", "ExecWB", "ShowBrowserBar", "get_ReadyState", "get_Offline", "put_Offline", "get_Silent", "put_Silent", "get_RegisterAsBrowser", "put_RegisterAsBrowser", "get_RegisterAsDropTarget", "put_RegisterAsDropTarget", "get_TheaterMode", "put_TheaterMode", "get_AddressBar", "put_AddressBar", "get_Resizable", "put_Resizable"]

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
        result := ComCall(52, this, "ptr", URL, "ptr", Flags, "ptr", TargetFrameName, "ptr", PostData, "ptr", Headers, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cmdID 
     * @param {Pointer<Integer>} pcmdf 
     * @returns {HRESULT} 
     */
    QueryStatusWB(cmdID, pcmdf) {
        pcmdfMarshal := pcmdf is VarRef ? "int*" : "ptr"

        result := ComCall(53, this, "int", cmdID, pcmdfMarshal, pcmdf, "HRESULT")
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
        result := ComCall(54, this, "int", cmdID, "int", cmdexecopt, "ptr", pvaIn, "ptr", pvaOut, "HRESULT")
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
        result := ComCall(55, this, "ptr", pvaClsid, "ptr", pvarShow, "ptr", pvarSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plReadyState 
     * @returns {HRESULT} 
     */
    get_ReadyState(plReadyState) {
        plReadyStateMarshal := plReadyState is VarRef ? "int*" : "ptr"

        result := ComCall(56, this, plReadyStateMarshal, plReadyState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbOffline 
     * @returns {HRESULT} 
     */
    get_Offline(pbOffline) {
        result := ComCall(57, this, "ptr", pbOffline, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bOffline 
     * @returns {HRESULT} 
     */
    put_Offline(bOffline) {
        result := ComCall(58, this, "short", bOffline, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbSilent 
     * @returns {HRESULT} 
     */
    get_Silent(pbSilent) {
        result := ComCall(59, this, "ptr", pbSilent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bSilent 
     * @returns {HRESULT} 
     */
    put_Silent(bSilent) {
        result := ComCall(60, this, "short", bSilent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbRegister 
     * @returns {HRESULT} 
     */
    get_RegisterAsBrowser(pbRegister) {
        result := ComCall(61, this, "ptr", pbRegister, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bRegister 
     * @returns {HRESULT} 
     */
    put_RegisterAsBrowser(bRegister) {
        result := ComCall(62, this, "short", bRegister, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbRegister 
     * @returns {HRESULT} 
     */
    get_RegisterAsDropTarget(pbRegister) {
        result := ComCall(63, this, "ptr", pbRegister, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bRegister 
     * @returns {HRESULT} 
     */
    put_RegisterAsDropTarget(bRegister) {
        result := ComCall(64, this, "short", bRegister, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbRegister 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-iwebbrowser2-get_theatermode
     */
    get_TheaterMode(pbRegister) {
        result := ComCall(65, this, "ptr", pbRegister, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bRegister 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/exdisp/nf-exdisp-iwebbrowser2-put_theatermode
     */
    put_TheaterMode(bRegister) {
        result := ComCall(66, this, "short", bRegister, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Value 
     * @returns {HRESULT} 
     */
    get_AddressBar(Value) {
        result := ComCall(67, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     */
    put_AddressBar(Value) {
        result := ComCall(68, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Value 
     * @returns {HRESULT} 
     */
    get_Resizable(Value) {
        result := ComCall(69, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     */
    put_Resizable(Value) {
        result := ComCall(70, this, "short", Value, "HRESULT")
        return result
    }
}
