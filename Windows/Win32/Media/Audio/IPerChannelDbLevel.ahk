#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPerChannelDbLevel interface represents a generic subunit control interface that provides per-channel control over the volume level, in decibels, of an audio stream or of a frequency band in an audio stream.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-iperchanneldblevel
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IPerChannelDbLevel extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerChannelDbLevel
     * @type {Guid}
     */
    static IID => Guid("{c2f8e001-f205-4bc9-99bc-c13b1e048ccb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetChannelCount", "GetLevelRange", "GetLevel", "SetLevel", "SetLevelUniform", "SetLevelAllChannels"]

    /**
     * The GetChannelCount method gets the number of channels in the audio stream.
     * @returns {Integer} Pointer to a <b>UINT</b> variable into which the method writes the channel count (the number of channels in the audio stream).
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-iperchanneldblevel-getchannelcount
     */
    GetChannelCount() {
        result := ComCall(3, this, "uint*", &pcChannels := 0, "HRESULT")
        return pcChannels
    }

    /**
     * The GetLevelRange method gets the range, in decibels, of the volume level of the specified channel.
     * @param {Integer} nChannel The number of the selected channel. If the audio stream has <i>n</i> channels, the channels are numbered from 0 to <i>n</i>– 1. To get the number of channels in the stream, call the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iperchanneldblevel-getchannelcount">IPerChannelDbLevel::GetChannelCount</a> method.
     * @param {Pointer<Float>} pfMinLevelDB Pointer to a <b>float</b> variable into which the method writes the minimum volume level in decibels.
     * @param {Pointer<Float>} pfMaxLevelDB Pointer to a <b>float</b> variable into which the method writes the maximum volume level in decibels.
     * @param {Pointer<Float>} pfStepping Pointer to a <b>float</b> variable into which the method writes the stepping value between consecutive volume levels in the range  <i>*pfMinLevelDB</i> to  <i>*pfMaxLevelDB</i>. If the difference between the maximum and minimum volume levels is <i>d</i> decibels, and the range is divided into <i>n</i> steps (uniformly sized intervals), then the volume can have <i>n</i> + 1 discrete levels and the size of the step between consecutive levels is <i>d</i> / <i>n</i> decibels.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>nChannel</i> is out of range.
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
     * Pointer <i>pfminLevelDB</i>, <i>pfmaxLevelDB</i>, or <i>pfmaxLevelDB</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-iperchanneldblevel-getlevelrange
     */
    GetLevelRange(nChannel, pfMinLevelDB, pfMaxLevelDB, pfStepping) {
        pfMinLevelDBMarshal := pfMinLevelDB is VarRef ? "float*" : "ptr"
        pfMaxLevelDBMarshal := pfMaxLevelDB is VarRef ? "float*" : "ptr"
        pfSteppingMarshal := pfStepping is VarRef ? "float*" : "ptr"

        result := ComCall(4, this, "uint", nChannel, pfMinLevelDBMarshal, pfMinLevelDB, pfMaxLevelDBMarshal, pfMaxLevelDB, pfSteppingMarshal, pfStepping, "HRESULT")
        return result
    }

    /**
     * The GetLevel method gets the volume level, in decibels, of the specified channel.
     * @param {Integer} nChannel The channel number. If the audio stream has <i>N</i> channels, the channels are numbered from 0 to <i>N</i>– 1. To get the number of channels in the stream, call the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iperchanneldblevel-getchannelcount">IPerChannelDbLevel::GetChannelCount</a> method.
     * @returns {Float} Pointer to a <b>float</b> variable into which the method writes the volume level, in decibels, of the specified channel.
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-iperchanneldblevel-getlevel
     */
    GetLevel(nChannel) {
        result := ComCall(5, this, "uint", nChannel, "float*", &pfLevelDB := 0, "HRESULT")
        return pfLevelDB
    }

    /**
     * The SetLevel method sets the volume level, in decibels, of the specified channel.
     * @param {Integer} nChannel The number of the selected channel. If the audio stream has <i>N</i> channels, the channels are numbered from 0 to <i>N</i>– 1. To get the number of channels in the stream, call the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iperchanneldblevel-getchannelcount">IPerChannelDbLevel::GetChannelCount</a> method.
     * @param {Float} fLevelDB The new volume level in decibels. A positive value represents gain, and a negative value represents attenuation.
     * @param {Pointer<Guid>} pguidEventContext Context value for the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-icontrolchangenotify-onnotify">IControlChangeNotify::OnNotify</a> method. This parameter points to an event-context GUID. If the <b>SetLevel</b> call changes the state of the level control, all clients that have registered <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-icontrolchangenotify">IControlChangeNotify</a> interfaces with that control receive notifications. In its implementation of the <b>OnNotify</b> method, a client can inspect the event-context GUID to discover whether it or another client is the source of the control-change event. If the caller supplies a <b>NULL</b> pointer for this parameter, the client's notification method receives a <b>NULL</b> context pointer.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>nChannel</i> is out of range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-iperchanneldblevel-setlevel
     */
    SetLevel(nChannel, fLevelDB, pguidEventContext) {
        result := ComCall(6, this, "uint", nChannel, "float", fLevelDB, "ptr", pguidEventContext, "HRESULT")
        return result
    }

    /**
     * The SetLevelUniform method sets all channels in the audio stream to the same uniform volume level, in decibels.
     * @param {Float} fLevelDB The new uniform level in decibels.
     * @param {Pointer<Guid>} pguidEventContext Context value for the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-icontrolchangenotify-onnotify">IControlChangeNotify::OnNotify</a> method. This parameter points to an event-context GUID. If the <b>SetLevelUniform</b> call changes the state of the level control, all clients that have registered <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-icontrolchangenotify">IControlChangeNotify</a> interfaces with that control receive notifications. In its implementation of the <b>OnNotify</b> method, a client can inspect the event-context GUID to discover whether it or another client is the source of the control-change event. If the caller supplies a <b>NULL</b> pointer for this parameter, the client's notification method receives a <b>NULL</b> context pointer.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-iperchanneldblevel-setleveluniform
     */
    SetLevelUniform(fLevelDB, pguidEventContext) {
        result := ComCall(7, this, "float", fLevelDB, "ptr", pguidEventContext, "HRESULT")
        return result
    }

    /**
     * The SetLevelAllChannels method sets the volume levels, in decibels, of all the channels in the audio stream.
     * @param {Pointer<Float>} aLevelsDB Pointer to an array of volume levels. This parameter points to a caller-allocated <b>float</b> array into which the method writes the new volume levels, in decibels, for all the channels. The method writes the level for a particular channel into the array element whose index matches the channel number. If the audio stream contains <i>n</i> channels, the channels are numbered 0 to <i>n</i>– 1. To get the number of channels in the stream, call the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iperchanneldblevel-getchannelcount">IPerChannelDbLevel::GetChannelCount</a> method.
     * @param {Integer} cChannels The number of elements in the <i>aLevelsDB</i> array. If this parameter does not match the number of channels in the audio stream, the method fails without modifying the <i>aLevelsDB</i> array.
     * @param {Pointer<Guid>} pguidEventContext Context value for the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-icontrolchangenotify-onnotify">IControlChangeNotify::OnNotify</a> method. This parameter points to an event-context GUID. If the <b>SetLevelAllChannels</b> call changes the state of the level control, all clients that have registered <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-icontrolchangenotify">IControlChangeNotify</a> interfaces with that control receive notifications. In its implementation of the <b>OnNotify</b> method, a client can inspect the event-context GUID to discover whether it or another client is the source of the control-change event. If the caller supplies a <b>NULL</b> pointer for this parameter, the client's notification method receives a <b>NULL</b> context pointer.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>cChannels</i> does not equal the number of channels.
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
     * Pointer <i>aLevelsDB</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-iperchanneldblevel-setlevelallchannels
     */
    SetLevelAllChannels(aLevelsDB, cChannels, pguidEventContext) {
        aLevelsDBMarshal := aLevelsDB is VarRef ? "float*" : "ptr"

        result := ComCall(8, this, aLevelsDBMarshal, aLevelsDB, "uint", cChannels, "ptr", pguidEventContext, "HRESULT")
        return result
    }
}
