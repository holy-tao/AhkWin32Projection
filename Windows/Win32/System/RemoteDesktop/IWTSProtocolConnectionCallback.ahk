#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * IWTSProtocolConnectionCallback is no longer available. Instead, use IWRdsProtocolConnectionCallback.
 * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nn-wtsprotocol-iwtsprotocolconnectioncallback
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWTSProtocolConnectionCallback extends IUnknown{
    /**
     * The interface identifier for IWTSProtocolConnectionCallback
     * @type {Guid}
     */
    static IID => Guid("{23083765-75eb-41fe-b4fb-e086242afa0f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    OnReady() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Reason 
     * @param {Integer} Source 
     * @returns {HRESULT} 
     */
    BrokenConnection(Reason, Source) {
        result := ComCall(4, this, "uint", Reason, "uint", Source, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopScreenUpdates() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The RedrawWindow function updates the specified rectangle or region in a window's client area.
     * @param {Pointer<WTS_SMALL_RECT>} rect 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-redrawwindow
     */
    RedrawWindow(rect) {
        result := ComCall(6, this, "ptr", rect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WTS_DISPLAY_IOCTL>} DisplayIOCtl 
     * @returns {HRESULT} 
     */
    DisplayIOCtl(DisplayIOCtl) {
        result := ComCall(7, this, "ptr", DisplayIOCtl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
