#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IPerChannelDbLevel interface represents a generic subunit control interface that provides per-channel control over the volume level, in decibels, of an audio stream or of a frequency band in an audio stream.
 * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nn-devicetopology-iperchanneldblevel
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IPerChannelDbLevel extends IUnknown {
    /**
     * The interface identifier for IPerChannelDbLevel
     * @type {Guid}
     */
    static IID := Guid("{c2f8e001-f205-4bc9-99bc-c13b1e048ccb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPerChannelDbLevel interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetChannelCount     : IntPtr
        GetLevelRange       : IntPtr
        GetLevel            : IntPtr
        SetLevel            : IntPtr
        SetLevelUniform     : IntPtr
        SetLevelAllChannels : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPerChannelDbLevel.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetChannelCount method gets the number of channels in the audio stream. (IPerChannelDbLevel.GetChannelCount)
     * @returns {Integer} Pointer to a <b>UINT</b> variable into which the method writes the channel count (the number of channels in the audio stream).
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iperchanneldblevel-getchannelcount
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
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iperchanneldblevel-getlevelrange
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
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iperchanneldblevel-getlevel
     */
    GetLevel(nChannel) {
        result := ComCall(5, this, "uint", nChannel, "float*", &pfLevelDB := 0, "HRESULT")
        return pfLevelDB
    }

    /**
     * The SetLevel method sets the volume level, in decibels, of the specified channel.
     * @remarks
     * If the caller specifies a value for <i>fLevelDB</i> that is an exact stepping value, the <b>SetLevel</b> method completes successfully. A subsequent call to the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iperchanneldblevel-getlevel">IPerChannelDbLevel::GetLevel</a> method will return either the value that was set, or one of the following values:<ul>
     * <li>If the set value was below the minimum, the <b>GetLevel</b> method returns the minimum value.</li>
     * <li>If the set value was above the maximum, the <b>GetLevel</b> method returns the maximum value.</li>
     * <li>If the set value was between two stepping values, the <b>GetLevel</b> method returns a value that could be the next stepping value above or the stepping value below the set value; the relative distances from the set value to the neighboring stepping values is unimportant. The value that the <b>GetLevel</b> method returns is whichever value has more of an impact on the signal path.</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iperchanneldblevel-setlevel
     */
    SetLevel(nChannel, fLevelDB, pguidEventContext) {
        result := ComCall(6, this, "uint", nChannel, "float", fLevelDB, Guid.Ptr, pguidEventContext, "HRESULT")
        return result
    }

    /**
     * The SetLevelUniform method sets all channels in the audio stream to the same uniform volume level, in decibels.
     * @remarks
     * If the specified uniform level is beyond the range that the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iperchanneldblevel-getlevelrange">IPerChannelDbLevel::GetLevelRange</a> method reports for a particular channel, the <b>SetLevelUniform</b> call clamps the value for that channel to the supported range and completes successfully. A subsequent call to the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iperchanneldblevel-getlevel">IPerChannelDbLevel::GetLevel</a> method retrieves the actual value used for that channel.
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
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iperchanneldblevel-setleveluniform
     */
    SetLevelUniform(fLevelDB, pguidEventContext) {
        result := ComCall(7, this, "float", fLevelDB, Guid.Ptr, pguidEventContext, "HRESULT")
        return result
    }

    /**
     * The SetLevelAllChannels method sets the volume levels, in decibels, of all the channels in the audio stream.
     * @remarks
     * If the specified level value for any channel is beyond the range that the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iperchanneldblevel-getlevelrange">IPerChannelDbLevel::GetLevelRange</a> method reports for that channel, the <b>SetLevelAllChannels</b> call clamps the value to the supported range and completes successfully. A subsequent call to the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iperchanneldblevel-getlevel">IPerChannelDbLevel::GetLevel</a> method retrieves the actual value used for that channel.
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
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iperchanneldblevel-setlevelallchannels
     */
    SetLevelAllChannels(aLevelsDB, cChannels, pguidEventContext) {
        aLevelsDBMarshal := aLevelsDB is VarRef ? "float*" : "ptr"

        result := ComCall(8, this, aLevelsDBMarshal, aLevelsDB, "uint", cChannels, Guid.Ptr, pguidEventContext, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPerChannelDbLevel.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetChannelCount := CallbackCreate(GetMethod(implObj, "GetChannelCount"), flags, 2)
        this.vtbl.GetLevelRange := CallbackCreate(GetMethod(implObj, "GetLevelRange"), flags, 5)
        this.vtbl.GetLevel := CallbackCreate(GetMethod(implObj, "GetLevel"), flags, 3)
        this.vtbl.SetLevel := CallbackCreate(GetMethod(implObj, "SetLevel"), flags, 4)
        this.vtbl.SetLevelUniform := CallbackCreate(GetMethod(implObj, "SetLevelUniform"), flags, 3)
        this.vtbl.SetLevelAllChannels := CallbackCreate(GetMethod(implObj, "SetLevelAllChannels"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetChannelCount)
        CallbackFree(this.vtbl.GetLevelRange)
        CallbackFree(this.vtbl.GetLevel)
        CallbackFree(this.vtbl.SetLevel)
        CallbackFree(this.vtbl.SetLevelUniform)
        CallbackFree(this.vtbl.SetLevelAllChannels)
    }
}
