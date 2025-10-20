#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMixerOCXNotify interface is implemented by clients and called by the Overlay Mixer to send notifications of events affecting the video display rectangle.
 * @see https://docs.microsoft.com/windows/win32/api//mixerocx/nn-mixerocx-imixerocxnotify
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMixerOCXNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMixerOCXNotify
     * @type {Guid}
     */
    static IID => Guid("{81a3bd31-dee1-11d1-8508-00a0c91f9ca0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnInvalidateRect", "OnStatusChange", "OnDataChange"]

    /**
     * 
     * @param {Pointer<RECT>} lpcRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mixerocx/nf-mixerocx-imixerocxnotify-oninvalidaterect
     */
    OnInvalidateRect(lpcRect) {
        result := ComCall(3, this, "ptr", lpcRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulStatusFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mixerocx/nf-mixerocx-imixerocxnotify-onstatuschange
     */
    OnStatusChange(ulStatusFlags) {
        result := ComCall(4, this, "uint", ulStatusFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulDataFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mixerocx/nf-mixerocx-imixerocxnotify-ondatachange
     */
    OnDataChange(ulDataFlags) {
        result := ComCall(5, this, "uint", ulDataFlags, "HRESULT")
        return result
    }
}
