#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the methods that enable a site object to manage each embedded control within a container.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-iolecontrolsite
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleControlSite extends IUnknown{
    /**
     * The interface identifier for IOleControlSite
     * @type {Guid}
     */
    static IID => Guid("{b196b289-bab4-101a-b69c-00aa00341d07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    OnControlInfoChanged() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fLock 
     * @returns {HRESULT} 
     */
    LockInPlaceActive(fLock) {
        result := ComCall(4, this, "int", fLock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppDisp 
     * @returns {HRESULT} 
     */
    GetExtendedControl(ppDisp) {
        result := ComCall(5, this, "ptr", ppDisp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<POINTL>} pPtlHimetric 
     * @param {Pointer<POINTF>} pPtfContainer 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    TransformCoords(pPtlHimetric, pPtfContainer, dwFlags) {
        result := ComCall(6, this, "ptr", pPtlHimetric, "ptr", pPtfContainer, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MSG>} pMsg 
     * @param {Integer} grfModifiers 
     * @returns {HRESULT} 
     */
    TranslateAccelerator(pMsg, grfModifiers) {
        result := ComCall(7, this, "ptr", pMsg, "uint", grfModifiers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fGotFocus 
     * @returns {HRESULT} 
     */
    OnFocus(fGotFocus) {
        result := ComCall(8, this, "int", fGotFocus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ShowPropertyFrame() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
