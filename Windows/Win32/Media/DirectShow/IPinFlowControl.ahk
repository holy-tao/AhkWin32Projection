#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Blocks data flow from an active output pin.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ipinflowcontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IPinFlowControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPinFlowControl
     * @type {Guid}
     */
    static IID => Guid("{c56e9858-dbf3-4f6b-8119-384af2060deb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Block"]

    /**
     * The Block method blocks or unblocks the flow of data from the pin.
     * @param {Integer} dwBlockFlags 
     * @param {HANDLE} hEvent Handle to an event object, or <b>NULL</b>. If this parameter is non-<b>NULL</b>, the method is asynchronous and returns immediately. The event is signaled when the operation completes. If this parameter is <b>NULL</b>, the method is synchronous and does not complete until the pin is blocked. If <i>dwBlockFlags</i> is zero, this parameter must be <b>NULL</b>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pin is already unblocked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_PIN_ALREADY_BLOCKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pin is already blocked on another thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_PIN_ALREADY_BLOCKED_ON_THIS_THREAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pin is already blocked on the calling thread.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ipinflowcontrol-block
     */
    Block(dwBlockFlags, hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(3, this, "uint", dwBlockFlags, "ptr", hEvent, "HRESULT")
        return result
    }
}
