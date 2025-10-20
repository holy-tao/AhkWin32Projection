#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMediaEvent.ahk

/**
 * The IMediaEventEx interface inherits the IMediaEvent interface, which contains methods for retrieving event notifications and for overriding the filter graph's default handling of events.
 * @see https://docs.microsoft.com/windows/win32/api//control/nn-control-imediaeventex
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaEventEx extends IMediaEvent{
    /**
     * The interface identifier for IMediaEventEx
     * @type {Guid}
     */
    static IID => Guid("{56a868c0-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * 
     * @param {Pointer} hwnd 
     * @param {Integer} lMsg 
     * @param {Pointer} lInstanceData 
     * @returns {HRESULT} 
     */
    SetNotifyWindow(hwnd, lMsg, lInstanceData) {
        result := ComCall(13, this, "ptr", hwnd, "int", lMsg, "ptr", lInstanceData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lNoNotifyFlags 
     * @returns {HRESULT} 
     */
    SetNotifyFlags(lNoNotifyFlags) {
        result := ComCall(14, this, "int", lNoNotifyFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lplNoNotifyFlags 
     * @returns {HRESULT} 
     */
    GetNotifyFlags(lplNoNotifyFlags) {
        result := ComCall(15, this, "int*", lplNoNotifyFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
