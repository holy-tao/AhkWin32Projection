#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOverlayNotify.ahk

/**
 * The IOverlayNotify2 interface derives from the IOverlayNotify interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ioverlaynotify2
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IOverlayNotify2 extends IOverlayNotify{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOverlayNotify2
     * @type {Guid}
     */
    static IID => Guid("{680efa10-d535-11d1-87c8-00a0c9223196}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnDisplayChange"]

    /**
     * The OnDisplayChange method provides notification that the exposed window area has changed.
     * @param {HMONITOR} hMonitor Handle to the monitor used for displaying the overlay.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ioverlaynotify2-ondisplaychange
     */
    OnDisplayChange(hMonitor) {
        hMonitor := hMonitor is Win32Handle ? NumGet(hMonitor, "ptr") : hMonitor

        result := ComCall(7, this, "ptr", hMonitor, "HRESULT")
        return result
    }
}
