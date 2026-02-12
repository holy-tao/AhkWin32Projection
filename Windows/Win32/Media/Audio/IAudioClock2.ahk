#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioClock2 interface is used to get the current device position.
 * @see https://learn.microsoft.com/windows/win32/api//content/audioclient/nn-audioclient-iaudioclock2
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioClock2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioClock2
     * @type {Guid}
     */
    static IID => Guid("{6f49ff73-6727-49ac-a008-d98cf5e70048}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDevicePosition"]

    /**
     * The GetDevicePosition method gets the current device position, in frames, directly from the hardware.
     * @remarks
     * This method only applies to shared-mode streams. 
     * 
     * This method retrieves two correlated stream-position values:
     *         
     *       
     *         
     * 
     * <ul>
     * <li>Device position. The client retrieves the unprocessed device position in <i>DevicePosition</i>. This is the stream position of the sample that is currently playing through the speakers (for a rendering stream) or being recorded through the microphone (for a capture stream). The sampling rate of the device endpoint may be different from the sampling rate of the mix format used by the client.
     * 					To retrieve the device position from the client, call <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclock-getposition">IAudioClock::GetPosition</a>.
     * 				</li>
     * <li>Performance counter. The client retrieves the performance counter in <i>QPCPosition</i>. <b>GetDevicePosition</b> obtains the counter value by calling the <b>QueryPerformanceCounter</b> function at the time that the audio endpoint device stores the stream position in the <i>DevicePosition</i> parameter of the <b>GetDevicePosition</b> method. <b>GetDevicePosition</b> converts the counter value to 100-nanosecond time units. For more information about <b>QueryPerformanceCounter</b> and <b>QueryPerformanceFrequency</b>, see the Windows SDK documentation.</li>
     * </ul>
     * Given the device position and the performance counter at the time of the <b>GetDevicePosition</b> call, the client can get a more timely estimate of the device position at a later time by calling <b>QueryPerformanceCounter</b> to obtain the current performance counter, and extrapolating the device position based on how far the counter has advanced since the original device position was recorded. The client can call the <b>QueryPerformanceCounter</b> function to get the frequency of the clock that increments the counter. Before comparing the raw counter value obtained from <b>QueryPerformanceCounter</b> to the value retrieved by <b>GetDevicePosition</b>, convert the raw counter value to 100-nanosecond time units as follows:
     * 
     * <ol>
     * <li>Multiply the raw counter value by 10,000,000.</li>
     * <li>Divide the result by the counter frequency obtained from <b>QueryPerformanceFrequency</b>.</li>
     * </ol>
     * @param {Pointer<Integer>} DevicePosition Receives the device position, in frames. The received position is an unprocessed value that the method obtains directly from the hardware. For more information, see Remarks.
     * @param {Pointer<Integer>} QPCPosition Receives the value of the performance counter at the time that the audio endpoint device read the device position retrieved in the <i>DevicePosition</i> parameter in response to the <b>GetDevicePosition</b> call.  
     * 					 <b>GetDevicePosition</b> converts the counter value to 100-nanosecond time units before writing it to <i>QPCPosition</i>.
     * 					<i>QPCPosition</i> can be <b>NULL</b> if the client does not require the performance counter value.
     * 				For more information, see Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK.
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
     * Parameter <i>DevicePosition</i> is <b>NULL</b>.
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
     * The audio endpoint has been disconnected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_S_POSITION_STALLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-start">IAudioClient::Start</a> method has not been called for this stream.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/audioclient/nf-audioclient-iaudioclock2-getdeviceposition
     */
    GetDevicePosition(DevicePosition, QPCPosition) {
        DevicePositionMarshal := DevicePosition is VarRef ? "uint*" : "ptr"
        QPCPositionMarshal := QPCPosition is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, DevicePositionMarshal, DevicePosition, QPCPositionMarshal, QPCPosition, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
