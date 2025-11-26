#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Seeks a byte stream by time position.
 * @remarks
 * 
 * A byte stream can implement this interface if it supports time-based seeking. For example, a byte stream that reads data from a server  might implement the interface. Typically, a local file-based byte stream would not implement it.
 * 
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the byte stream object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfbytestreamtimeseek
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFByteStreamTimeSeek extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFByteStreamTimeSeek
     * @type {Guid}
     */
    static IID => Guid("{64976bfa-fb61-4041-9069-8c9a5f659beb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsTimeSeekSupported", "TimeSeek", "GetTimeSeekResult"]

    /**
     * Queries whether the byte stream supports time-based seeking.
     * @returns {BOOL} Receives the value <b>TRUE</b> if the byte stream supports time-based seeking, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfbytestreamtimeseek-istimeseeksupported
     */
    IsTimeSeekSupported() {
        result := ComCall(3, this, "int*", &pfTimeSeekIsSupported := 0, "HRESULT")
        return pfTimeSeekIsSupported
    }

    /**
     * Seeks to a new position in the byte stream.
     * @param {Integer} qwTimePosition The new position, in 100-nanosecond units.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfbytestreamtimeseek-timeseek
     */
    TimeSeek(qwTimePosition) {
        result := ComCall(4, this, "uint", qwTimePosition, "HRESULT")
        return result
    }

    /**
     * Gets the result of a time-based seek.
     * @param {Pointer<Integer>} pqwStartTime Receives the new position after the seek, in 100-nanosecond units.
     * @param {Pointer<Integer>} pqwStopTime Receives the stop time, in 100-nanosecond units. If the stop time is unknown, the value is zero.
     * @param {Pointer<Integer>} pqwDuration Receives the total duration of the file, in 100-nanosecond units. If the duration is unknown, the value is –1.
     * @returns {HRESULT} This method can return one of these values.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The byte stream does not support time-based seeking, or no data is available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfbytestreamtimeseek-gettimeseekresult
     */
    GetTimeSeekResult(pqwStartTime, pqwStopTime, pqwDuration) {
        pqwStartTimeMarshal := pqwStartTime is VarRef ? "uint*" : "ptr"
        pqwStopTimeMarshal := pqwStopTime is VarRef ? "uint*" : "ptr"
        pqwDurationMarshal := pqwDuration is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pqwStartTimeMarshal, pqwStartTime, pqwStopTimeMarshal, pqwStopTime, pqwDurationMarshal, pqwDuration, "HRESULT")
        return result
    }
}
