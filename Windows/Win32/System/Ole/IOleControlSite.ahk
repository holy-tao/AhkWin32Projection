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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnControlInfoChanged", "LockInPlaceActive", "GetExtendedControl", "TransformCoords", "TranslateAccelerator", "OnFocus", "ShowPropertyFrame"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iolecontrolsite-oncontrolinfochanged
     */
    OnControlInfoChanged() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fLock 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iolecontrolsite-lockinplaceactive
     */
    LockInPlaceActive(fLock) {
        result := ComCall(4, this, "int", fLock, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppDisp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iolecontrolsite-getextendedcontrol
     */
    GetExtendedControl(ppDisp) {
        result := ComCall(5, this, "ptr*", ppDisp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<POINTL>} pPtlHimetric 
     * @param {Pointer<POINTF>} pPtfContainer 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iolecontrolsite-transformcoords
     */
    TransformCoords(pPtlHimetric, pPtfContainer, dwFlags) {
        result := ComCall(6, this, "ptr", pPtlHimetric, "ptr", pPtfContainer, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MSG>} pMsg 
     * @param {Integer} grfModifiers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iolecontrolsite-translateaccelerator
     */
    TranslateAccelerator(pMsg, grfModifiers) {
        result := ComCall(7, this, "ptr", pMsg, "uint", grfModifiers, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fGotFocus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iolecontrolsite-onfocus
     */
    OnFocus(fGotFocus) {
        result := ComCall(8, this, "int", fGotFocus, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iolecontrolsite-showpropertyframe
     */
    ShowPropertyFrame() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
