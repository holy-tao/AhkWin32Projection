#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Callback interface to receive notifications from a network source on the progress of an asynchronous open operation.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsourceopenmonitor
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSourceOpenMonitor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSourceOpenMonitor
     * @type {Guid}
     */
    static IID => Guid("{059054b3-027c-494c-a27d-9113291cf87f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnSourceEvent"]

    /**
     * Called by the network source when the open operation begins or ends.
     * @param {IMFMediaEvent} pEvent Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaevent">IMFMediaEvent</a> interface.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsourceopenmonitor-onsourceevent
     */
    OnSourceEvent(pEvent) {
        result := ComCall(3, this, "ptr", pEvent, "HRESULT")
        return result
    }
}
