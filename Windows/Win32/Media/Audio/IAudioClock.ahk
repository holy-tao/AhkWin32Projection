#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioClock interface enables a client to monitor a stream's data rate and the current position in the stream.
 * @see https://docs.microsoft.com/windows/win32/api//audioclient/nn-audioclient-iaudioclock
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioClock extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioClock
     * @type {Guid}
     */
    static IID => Guid("{cd63314f-3fba-4a1b-812c-ef96358728e7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFrequency", "GetPosition", "GetCharacteristics"]

    /**
     * The GetFrequency method gets the device frequency.
     * @returns {Integer} Pointer to a <b>UINT64</b> variable into which the method writes the device frequency. For more information, see Remarks.
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudioclock-getfrequency
     */
    GetFrequency() {
        result := ComCall(3, this, "uint*", &pu64Frequency := 0, "HRESULT")
        return pu64Frequency
    }

    /**
     * The GetPosition method gets the current device position.
     * @param {Pointer<Integer>} pu64Position Pointer to a <b>UINT64</b> variable into which the method writes the device position. The device position is the offset from the start of the stream to the current position in the stream. However, the units in which this offset is expressed are undefined—the device position value has meaning only in relation to the frequency reported by the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclock-getfrequency">IAudioClock::GetFrequency</a> method. For more information, see Remarks.
     * @param {Pointer<Integer>} pu64QPCPosition Pointer to a <b>UINT64</b> variable into which the method writes the value of the performance counter at the time that the audio endpoint device read the device position (<i>*pu64Position</i>) in response to the <b>GetPosition</b> call. The method converts the counter value to 100-nanosecond time units before writing it to <i>*pu64QPCPosition</i>. This parameter can be <b>NULL</b> if the client does not require the performance counter value.
     * @returns {HRESULT} If the method succeeds and obtains an accurate reading of the position, it returns S_OK. If the method succeeds but the duration of the call is long enough to detract from the accuracy of the position reading, the method returns S_FALSE. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>pu64Position</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_DEVICE_INVALIDATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The audio endpoint device has been unplugged, or the audio hardware or associated hardware resources have been reconfigured, disabled, removed, or otherwise made unavailable for use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_SERVICE_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Windows audio service is not running.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudioclock-getposition
     */
    GetPosition(pu64Position, pu64QPCPosition) {
        pu64PositionMarshal := pu64Position is VarRef ? "uint*" : "ptr"
        pu64QPCPositionMarshal := pu64QPCPosition is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pu64PositionMarshal, pu64Position, pu64QPCPositionMarshal, pu64QPCPosition, "HRESULT")
        return result
    }

    /**
     * The GetCharacteristics method is reserved for future use.
     * @returns {Integer} Pointer to a <b>DWORD</b> variable into which the method writes a value that indicates the characteristics of the audio clock.
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-iaudioclock-getcharacteristics
     */
    GetCharacteristics() {
        result := ComCall(5, this, "uint*", &pdwCharacteristics := 0, "HRESULT")
        return pdwCharacteristics
    }
}
