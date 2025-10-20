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
     * 
     * @param {Pointer<RECT>} prcBounds 
     * @returns {HRESULT} 
     */
    OnWindowOpening(prcBounds) {
        result := ComCall(3, this, "ptr", prcBounds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prcBounds 
     * @returns {HRESULT} 
     */
    OnWindowOpened(prcBounds) {
        result := ComCall(4, this, "ptr", prcBounds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prcUpdatedBounds 
     * @returns {HRESULT} 
     */
    OnWindowUpdating(prcUpdatedBounds) {
        result := ComCall(5, this, "ptr", prcUpdatedBounds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prcUpdatedBounds 
     * @returns {HRESULT} 
     */
    OnWindowUpdated(prcUpdatedBounds) {
        result := ComCall(6, this, "ptr", prcUpdatedBounds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnWindowClosing() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnWindowClosed() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
