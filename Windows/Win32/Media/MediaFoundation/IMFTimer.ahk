#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a timer that invokes a callback at a specified time.
 * @remarks
 * 
 * The presentation clock exposes this interface. To get a pointer to the interface, call <b>QueryInterface</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imftimer
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTimer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFTimer
     * @type {Guid}
     */
    static IID => Guid("{e56e4cbd-8f70-49d8-a0f8-edb3d6ab9bf2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetTimer", "CancelTimer"]

    /**
     * Creates a timer with the specified time-out value.
     * @param {Integer} dwFlags 
     * @param {Integer} llClockTime 
     * @param {IMFAsyncCallback} pCallback 
     * @param {IUnknown} punkState 
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-settimer
     */
    SetTimer(dwFlags, llClockTime, pCallback, punkState) {
        result := ComCall(3, this, "uint", dwFlags, "int64", llClockTime, "ptr", pCallback, "ptr", punkState, "ptr*", &ppunkKey := 0, "HRESULT")
        return IUnknown(ppunkKey)
    }

    /**
     * 
     * @param {IUnknown} punkKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftimer-canceltimer
     */
    CancelTimer(punkKey) {
        result := ComCall(4, this, "ptr", punkKey, "HRESULT")
        return result
    }
}
