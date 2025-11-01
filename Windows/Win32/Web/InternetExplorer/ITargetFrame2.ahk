#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ITargetFrame2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITargetFrame2
     * @type {Guid}
     */
    static IID => Guid("{86d52e11-94a8-11d0-82af-00c04fd5ae38}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFrameName", "GetFrameName", "GetParentFrame", "SetFrameSrc", "GetFrameSrc", "GetFramesContainer", "SetFrameOptions", "GetFrameOptions", "SetFrameMargins", "GetFrameMargins", "FindFrame", "GetTargetAlias"]

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
     * @param {PWSTR} pszFrameSrc 
     * @returns {HRESULT} 
     */
    SetFrameSrc(pszFrameSrc) {
        pszFrameSrc := pszFrameSrc is String ? StrPtr(pszFrameSrc) : pszFrameSrc

        result := ComCall(6, this, "ptr", pszFrameSrc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszFrameSrc 
     * @returns {HRESULT} 
     */
    GetFrameSrc(ppszFrameSrc) {
        result := ComCall(7, this, "ptr", ppszFrameSrc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOleContainer>} ppContainer 
     * @returns {HRESULT} 
     */
    GetFramesContainer(ppContainer) {
        result := ComCall(8, this, "ptr*", ppContainer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetFrameOptions(dwFlags) {
        result := ComCall(9, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetFrameOptions(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwWidth 
     * @param {Integer} dwHeight 
     * @returns {HRESULT} 
     */
    SetFrameMargins(dwWidth, dwHeight) {
        result := ComCall(11, this, "uint", dwWidth, "uint", dwHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwWidth 
     * @param {Pointer<Integer>} pdwHeight 
     * @returns {HRESULT} 
     */
    GetFrameMargins(pdwWidth, pdwHeight) {
        pdwWidthMarshal := pdwWidth is VarRef ? "uint*" : "ptr"
        pdwHeightMarshal := pdwHeight is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pdwWidthMarshal, pdwWidth, pdwHeightMarshal, pdwHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszTargetName 
     * @param {Integer} dwFlags 
     * @param {Pointer<IUnknown>} ppunkTargetFrame 
     * @returns {HRESULT} 
     */
    FindFrame(pszTargetName, dwFlags, ppunkTargetFrame) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

        result := ComCall(13, this, "ptr", pszTargetName, "uint", dwFlags, "ptr*", ppunkTargetFrame, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszTargetName 
     * @param {Pointer<PWSTR>} ppszTargetAlias 
     * @returns {HRESULT} 
     */
    GetTargetAlias(pszTargetName, ppszTargetAlias) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

        result := ComCall(14, this, "ptr", pszTargetName, "ptr", ppszTargetAlias, "HRESULT")
        return result
    }
}
