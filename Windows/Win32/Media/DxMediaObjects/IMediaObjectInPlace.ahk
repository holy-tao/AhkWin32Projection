#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMediaObjectInPlace.ahk
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
     * The Process method processes a block of data. The application supplies a pointer to a block of input data. The DMO processes the data in place.
     * @param {Integer} ulSize Size of the data, in bytes.
     * @param {Pointer} pData Pointer to a buffer of size <i>ulSize</i>. On input, the buffer holds the input data. If the method returns successfully, the buffer contains the output data.
     * @param {Integer} refTimeStart Start time of the data.
     * @param {Integer} dwFlags Either DMO_INPLACE_NORMAL or DMO_INPLACE_ZERO. See Remarks for more information.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure
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
     * Success. There is still data to process.
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
     * Success. There is no remaining data to process.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-imediaobjectinplace-process
     */
    Process(ulSize, pData, refTimeStart, dwFlags) {
        result := ComCall(3, this, "uint", ulSize, "ptr", pData, "int64", refTimeStart, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The Clone method creates a copy of the DMO in its current state.
     * @returns {IMediaObjectInPlace} Address of a pointer to receive the new DMO's <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nn-mediaobj-imediaobjectinplace">IMediaObjectInPlace</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-imediaobjectinplace-clone
     */
    Clone() {
        result := ComCall(4, this, "ptr*", &ppMediaObject := 0, "HRESULT")
        return IMediaObjectInPlace(ppMediaObject)
    }

    /**
     * The GetLatency method retrieves the latency introduced by this DMO.
     * @returns {Integer} Pointer to a variable that receives the latency, in 100-nanosecond units.
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-imediaobjectinplace-getlatency
     */
    GetLatency() {
        result := ComCall(5, this, "int64*", &pLatencyTime := 0, "HRESULT")
        return pLatencyTime
    }
}
