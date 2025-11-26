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
     * Sets a timer that invokes a callback at the specified time.
     * @param {Integer} dwFlags Bitwise OR of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mftimer_flags">MFTIMER_FLAGS</a> enumeration.
     * @param {Integer} llClockTime The time at which the timer should fire, in units of the clock's frequency. The time is either absolute or relative to the current time, depending on the value of <i>dwFlags</i>.
     * @param {IMFAsyncCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The caller must implement this interface. The callback's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">Invoke</a> method is called at the time specified in the <i>llClockTime</i> parameter.
     * @param {IUnknown} punkState Pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
     * @returns {IUnknown} Receives a pointer to the <b>IUnknown</b> interface of a cancellation object. The caller must release the interface. To cancel the timer, pass this pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftimer-canceltimer">IMFTimer::CancelTimer</a> method. This parameter can be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imftimer-settimer
     */
    SetTimer(dwFlags, llClockTime, pCallback, punkState) {
        result := ComCall(3, this, "uint", dwFlags, "int64", llClockTime, "ptr", pCallback, "ptr", punkState, "ptr*", &ppunkKey := 0, "HRESULT")
        return IUnknown(ppunkKey)
    }

    /**
     * Cancels a timer that was set using the IMFTimer::SetTimer method.
     * @param {IUnknown} punkKey Pointer to the <b>IUnknown</b> interface that was returned in the <i>ppunkKey</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftimer-settimer">SetTimer</a> method.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imftimer-canceltimer
     */
    CancelTimer(punkKey) {
        result := ComCall(4, this, "ptr", punkKey, "HRESULT")
        return result
    }
}
