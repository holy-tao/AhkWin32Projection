#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IUIManagerEventSink interface is implemented by an app supporting IME UI integration to receive notifications of IME UI appearance.
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-iuimanagereventsink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IUIManagerEventSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIManagerEventSink
     * @type {Guid}
     */
    static IID => Guid("{cd91d690-a7e8-4265-9b38-8bb3bbaba7de}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnWindowOpening", "OnWindowOpened", "OnWindowUpdating", "OnWindowUpdated", "OnWindowClosing", "OnWindowClosed"]

    /**
     * 
     * @param {Pointer<RECT>} prcBounds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-iuimanagereventsink-onwindowopening
     */
    OnWindowOpening(prcBounds) {
        result := ComCall(3, this, "ptr", prcBounds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prcBounds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-iuimanagereventsink-onwindowopened
     */
    OnWindowOpened(prcBounds) {
        result := ComCall(4, this, "ptr", prcBounds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prcUpdatedBounds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-iuimanagereventsink-onwindowupdating
     */
    OnWindowUpdating(prcUpdatedBounds) {
        result := ComCall(5, this, "ptr", prcUpdatedBounds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prcUpdatedBounds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-iuimanagereventsink-onwindowupdated
     */
    OnWindowUpdated(prcUpdatedBounds) {
        result := ComCall(6, this, "ptr", prcUpdatedBounds, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-iuimanagereventsink-onwindowclosing
     */
    OnWindowClosing() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-iuimanagereventsink-onwindowclosed
     */
    OnWindowClosed() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
