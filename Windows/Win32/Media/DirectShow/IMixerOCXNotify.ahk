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
     * 
     * @param {Pointer<RECT>} lpcRect 
     * @returns {HRESULT} 
     */
    OnInvalidateRect(lpcRect) {
        result := ComCall(3, this, "ptr", lpcRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulStatusFlags 
     * @returns {HRESULT} 
     */
    OnStatusChange(ulStatusFlags) {
        result := ComCall(4, this, "uint", ulStatusFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulDataFlags 
     * @returns {HRESULT} 
     */
    OnDataChange(ulDataFlags) {
        result := ComCall(5, this, "uint", ulDataFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
