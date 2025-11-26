#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Enables applications and other objects to receive notifications of changes in the progress of a downloading operation.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-iprogressnotify
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IProgressNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProgressNotify
     * @type {Guid}
     */
    static IID => Guid("{a9d758a0-4617-11cf-95fc-00aa00680db4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnProgress"]

    /**
     * Notifies registered objects and applications of the progress of a downloading operation.
     * @param {Integer} dwProgressCurrent The amount of data available.
     * @param {Integer} dwProgressMaximum The total amount of data to be downloaded.
     * @param {BOOL} fAccurate Indicates the accuracy of the values in <i>dwProgressCurrent</i> and <i>dwProgressMaximum</i>. They are either reliable (<b>TRUE</b>) or unreliable (<b>FALSE</b>). The <b>FALSE</b> value indicates that control structures for determining the actual position of, or amount of, data yet to be downloaded are not available.
     * @param {BOOL} fOwner Indicates whether this <b>OnProgress</b> call can control the blocking behavior of the operation. If <b>TRUE</b>, the caller can use return values from <b>OnProgress</b> to block (STG_S_BLOCK), retry (STG_S_RETRYNOW), or monitor (STG_S_MONITORING) the operation. If <b>FALSE</b>, the return value from <b>OnProgress</b> has no influence on blocking behavior.
     * @returns {HRESULT} This method can return the standard return values E_FAIL, E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_S_RETRYNOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller is to retry the operation immediately. (This value is most useful for applications that do blocking from within the callback routine.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_S_BLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller is to block the download and retry the call as needed to determine if additional data is available. This is the default behavior if no sinks are registered on the connection point.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_S_MONITORING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The callback recipient reliquishes control of the downloading process to one of the other objects or applications that have registered progress notification sinks on the same stream. This is useful if the notification sink is interested only in gathering statistics.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data is currently unavailable. The caller is to try again after some desired interval. The notification sink returns this value if the asynchronous storage is to operate in nonblocking mode.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-iprogressnotify-onprogress
     */
    OnProgress(dwProgressCurrent, dwProgressMaximum, fAccurate, fOwner) {
        result := ComCall(3, this, "uint", dwProgressCurrent, "uint", dwProgressMaximum, "int", fAccurate, "int", fOwner, "HRESULT")
        return result
    }
}
