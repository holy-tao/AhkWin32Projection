#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfMouseSink interface is implemented by a text service to receive mouse event notifications. A mouse event sink is installed with the ITfMouseTracker::AdviseMouseSink method of one of the ITfMouseTracker interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfmousesink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfMouseSink extends IUnknown{
    /**
     * The interface identifier for ITfMouseSink
     * @type {Guid}
     */
    static IID => Guid("{a1adaaa2-3a24-449d-ac96-5183e7f5c217}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} uEdge 
     * @param {Integer} uQuadrant 
     * @param {Integer} dwBtnStatus 
     * @param {Pointer<BOOL>} pfEaten 
     * @returns {HRESULT} 
     */
    OnMouseEvent(uEdge, uQuadrant, dwBtnStatus, pfEaten) {
        result := ComCall(3, this, "uint", uEdge, "uint", uQuadrant, "uint", dwBtnStatus, "ptr", pfEaten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
