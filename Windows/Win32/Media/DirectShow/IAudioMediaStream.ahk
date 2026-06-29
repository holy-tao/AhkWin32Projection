#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMediaStream.ahk" { IMediaStream }
#Import ".\IAudioData.ahk" { IAudioData }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Audio\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import ".\IAudioStreamSample.ahk" { IAudioStreamSample }

/**
 * Note  This interface is deprecated.
 * @see https://learn.microsoft.com/windows/win32/api/austream/nn-austream-iaudiomediastream
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAudioMediaStream extends IMediaStream {
    /**
     * The interface identifier for IAudioMediaStream
     * @type {Guid}
     */
    static IID := Guid("{f7537560-a3be-11d0-8212-00c04fc32c45}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioMediaStream interfaces
    */
    struct Vtbl extends IMediaStream.Vtbl {
        GetFormat    : IntPtr
        SetFormat    : IntPtr
        CreateSample : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioMediaStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Retrieves the stream data's current format.
     * @remarks
     * Currently, Microsoft DirectShow supports only PCM wave data.
     * @returns {WAVEFORMATEX} Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure that contains the stream data's current format.
     * @see https://learn.microsoft.com/windows/win32/api/austream/nf-austream-iaudiomediastream-getformat
     */
    GetFormat() {
        pWaveFormatCurrent := WAVEFORMATEX()
        result := ComCall(9, this, WAVEFORMATEX.Ptr, pWaveFormatCurrent, "HRESULT")
        return pWaveFormatCurrent
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Sets the format for the stream.
     * @param {Pointer<WAVEFORMATEX>} lpWaveFormat Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure that contains stream format information.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value, which can include the following values or others not listed.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MS_E_INCOMPATIBLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Format of the <a href="https://docs.microsoft.com/windows/desktop/api/austream/nn-austream-iaudiodata">IAudioData</a> object is not compatible with stream.
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
     * Invalid argument.
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
     * <b>NULL</b> pointer argument.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/austream/nf-austream-iaudiomediastream-setformat
     */
    SetFormat(lpWaveFormat) {
        result := ComCall(10, this, WAVEFORMATEX.Ptr, lpWaveFormat, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Creates an audio stream sample for use with the specified stream.
     * @remarks
     * The <i>pAudioData</i> object defines the data's format.
     * @param {IAudioData} pAudioData Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/austream/nn-austream-iaudiodata">IAudioData</a> container. <b>IAudioData</b> objects can be referenced by samples in more than one stream.
     * @param {Integer} dwFlags Reserved for flag data. Must be zero.
     * @returns {IAudioStreamSample} Address of a pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/austream/nn-austream-iaudiostreamsample">IAudioStreamSample</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/austream/nf-austream-iaudiomediastream-createsample
     */
    CreateSample(pAudioData, dwFlags) {
        result := ComCall(11, this, "ptr", pAudioData, "uint", dwFlags, "ptr*", &ppSample := 0, "HRESULT")
        return IAudioStreamSample(ppSample)
    }

    Query(iid) {
        if (IAudioMediaStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFormat := CallbackCreate(GetMethod(implObj, "GetFormat"), flags, 2)
        this.vtbl.SetFormat := CallbackCreate(GetMethod(implObj, "SetFormat"), flags, 2)
        this.vtbl.CreateSample := CallbackCreate(GetMethod(implObj, "CreateSample"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFormat)
        CallbackFree(this.vtbl.SetFormat)
        CallbackFree(this.vtbl.CreateSample)
    }
}
