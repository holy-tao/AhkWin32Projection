#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ITargetFrame extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITargetFrame
     * @type {Guid}
     */
    static IID => Guid("{d5f78c80-5252-11cf-90fa-00aa0042106e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFrameName", "GetFrameName", "GetParentFrame", "FindFrame", "SetFrameSrc", "GetFrameSrc", "GetFramesContainer", "SetFrameOptions", "GetFrameOptions", "SetFrameMargins", "GetFrameMargins", "RemoteNavigate", "OnChildFrameActivate", "OnChildFrameDeactivate"]

    /**
     * 
     * @param {PWSTR} pszFrameName 
     * @returns {HRESULT} 
     */
    SetFrameName(pszFrameName) {
        pszFrameName := pszFrameName is String ? StrPtr(pszFrameName) : pszFrameName

        result := ComCall(3, this, "ptr", pszFrameName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszFrameName 
     * @returns {HRESULT} 
     */
    GetFrameName(ppszFrameName) {
        result := ComCall(4, this, "ptr", ppszFrameName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppunkParent 
     * @returns {HRESULT} 
     */
    GetParentFrame(ppunkParent) {
        result := ComCall(5, this, "ptr*", ppunkParent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszTargetName 
     * @param {IUnknown} ppunkContextFrame 
     * @param {Integer} dwFlags 
     * @param {Pointer<IUnknown>} ppunkTargetFrame 
     * @returns {HRESULT} 
     */
    FindFrame(pszTargetName, ppunkContextFrame, dwFlags, ppunkTargetFrame) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

        result := ComCall(6, this, "ptr", pszTargetName, "ptr", ppunkContextFrame, "uint", dwFlags, "ptr*", ppunkTargetFrame, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszFrameSrc 
     * @returns {HRESULT} 
     */
    SetFrameSrc(pszFrameSrc) {
        pszFrameSrc := pszFrameSrc is String ? StrPtr(pszFrameSrc) : pszFrameSrc

        result := ComCall(7, this, "ptr", pszFrameSrc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszFrameSrc 
     * @returns {HRESULT} 
     */
    GetFrameSrc(ppszFrameSrc) {
        result := ComCall(8, this, "ptr", ppszFrameSrc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOleContainer>} ppContainer 
     * @returns {HRESULT} 
     */
    GetFramesContainer(ppContainer) {
        result := ComCall(9, this, "ptr*", ppContainer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetFrameOptions(dwFlags) {
        result := ComCall(10, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetFrameOptions(pdwFlags) {
        result := ComCall(11, this, "uint*", pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwWidth 
     * @param {Integer} dwHeight 
     * @returns {HRESULT} 
     */
    SetFrameMargins(dwWidth, dwHeight) {
        result := ComCall(12, this, "uint", dwWidth, "uint", dwHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwWidth 
     * @param {Pointer<Integer>} pdwHeight 
     * @returns {HRESULT} 
     */
    GetFrameMargins(pdwWidth, pdwHeight) {
        result := ComCall(13, this, "uint*", pdwWidth, "uint*", pdwHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cLength 
     * @param {Pointer<Integer>} pulData 
     * @returns {HRESULT} 
     */
    RemoteNavigate(cLength, pulData) {
        result := ComCall(14, this, "uint", cLength, "uint*", pulData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkChildFrame 
     * @returns {HRESULT} 
     */
    OnChildFrameActivate(pUnkChildFrame) {
        result := ComCall(15, this, "ptr", pUnkChildFrame, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkChildFrame 
     * @returns {HRESULT} 
     */
    OnChildFrameDeactivate(pUnkChildFrame) {
        result := ComCall(16, this, "ptr", pUnkChildFrame, "HRESULT")
        return result
    }
}
