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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetNotifyWindow", "SetNotifyFlags", "GetNotifyFlags"]

    /**
     * 
     * @param {Pointer} hwnd 
     * @param {Integer} lMsg 
     * @param {Pointer} lInstanceData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaeventex-setnotifywindow
     */
    SetNotifyWindow(hwnd, lMsg, lInstanceData) {
        result := ComCall(13, this, "ptr", hwnd, "int", lMsg, "ptr", lInstanceData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lNoNotifyFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaeventex-setnotifyflags
     */
    SetNotifyFlags(lNoNotifyFlags) {
        result := ComCall(14, this, "int", lNoNotifyFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaeventex-getnotifyflags
     */
    GetNotifyFlags() {
        result := ComCall(15, this, "int*", &lplNoNotifyFlags := 0, "HRESULT")
        return lplNoNotifyFlags
    }
}
