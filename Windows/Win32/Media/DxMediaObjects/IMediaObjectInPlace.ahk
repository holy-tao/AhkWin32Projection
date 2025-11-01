#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMediaObjectInPlace interface provides methods for processing data in place. A Microsoft DirectX Media Object (DMO) can expose this interface if it meets the following conditions:\_
 * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nn-mediaobj-imediaobjectinplace
 * @namespace Windows.Win32.Media.DxMediaObjects
 * @version v4.0.30319
 */
class IMediaObjectInPlace extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaObjectInPlace
     * @type {Guid}
     */
    static IID => Guid("{651b9ad0-0fc7-4aa9-9538-d89931010741}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Process", "Clone", "GetLatency"]

    /**
     * Performs ink recognition synchronously.
     * @param {Integer} ulSize 
     * @param {Pointer} pData 
     * @param {Integer} refTimeStart 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} This function can return one of these values.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function did not process the ink because the ink has been fully processed, or the <a href="/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-endinkinput">EndInkInput</a> function has not been called and the recognizer does not support incremental processing of ink.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TPC_S_INTERRUPTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process was interrupted by a call to the <a href="/windows/desktop/api/recapis/nf-recapis-adviseinkchange">AdviseInkChange</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-process
     */
    Process(ulSize, pData, refTimeStart, dwFlags) {
        result := ComCall(3, this, "uint", ulSize, "ptr", pData, "int64", refTimeStart, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMediaObjectInPlace>} ppMediaObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobjectinplace-clone
     */
    Clone(ppMediaObject) {
        result := ComCall(4, this, "ptr*", ppMediaObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pLatencyTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobjectinplace-getlatency
     */
    GetLatency(pLatencyTime) {
        result := ComCall(5, this, "int64*", pLatencyTime, "HRESULT")
        return result
    }
}
