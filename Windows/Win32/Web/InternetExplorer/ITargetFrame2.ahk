#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ITargetFrame2 extends IUnknown{
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
     * 
     * @param {PWSTR} pszFrameName 
     * @returns {HRESULT} 
     */
    SetFrameName(pszFrameName) {
        pszFrameName := pszFrameName is String ? StrPtr(pszFrameName) : pszFrameName

        result := ComCall(3, this, "ptr", pszFrameName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszFrameName 
     * @returns {HRESULT} 
     */
    GetFrameName(ppszFrameName) {
        result := ComCall(4, this, "ptr", ppszFrameName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppunkParent 
     * @returns {HRESULT} 
     */
    GetParentFrame(ppunkParent) {
        result := ComCall(5, this, "ptr", ppunkParent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszFrameSrc 
     * @returns {HRESULT} 
     */
    SetFrameSrc(pszFrameSrc) {
        pszFrameSrc := pszFrameSrc is String ? StrPtr(pszFrameSrc) : pszFrameSrc

        result := ComCall(6, this, "ptr", pszFrameSrc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszFrameSrc 
     * @returns {HRESULT} 
     */
    GetFrameSrc(ppszFrameSrc) {
        result := ComCall(7, this, "ptr", ppszFrameSrc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOleContainer>} ppContainer 
     * @returns {HRESULT} 
     */
    GetFramesContainer(ppContainer) {
        result := ComCall(8, this, "ptr", ppContainer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetFrameOptions(dwFlags) {
        result := ComCall(9, this, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetFrameOptions(pdwFlags) {
        result := ComCall(10, this, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwWidth 
     * @param {Integer} dwHeight 
     * @returns {HRESULT} 
     */
    SetFrameMargins(dwWidth, dwHeight) {
        result := ComCall(11, this, "uint", dwWidth, "uint", dwHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwWidth 
     * @param {Pointer<UInt32>} pdwHeight 
     * @returns {HRESULT} 
     */
    GetFrameMargins(pdwWidth, pdwHeight) {
        result := ComCall(12, this, "uint*", pdwWidth, "uint*", pdwHeight, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(13, this, "ptr", pszTargetName, "uint", dwFlags, "ptr", ppunkTargetFrame, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(14, this, "ptr", pszTargetName, "ptr", ppszTargetAlias, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
