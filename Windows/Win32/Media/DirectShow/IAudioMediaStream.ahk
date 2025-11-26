#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Audio\WAVEFORMATEX.ahk
#Include .\IAudioStreamSample.ahk
#Include .\IMediaStream.ahk

/**
 * Note  This interface is deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//austream/nn-austream-iaudiomediastream
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAudioMediaStream extends IMediaStream{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioMediaStream
     * @type {Guid}
     */
    static IID => Guid("{f7537560-a3be-11d0-8212-00c04fc32c45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFormat", "SetFormat", "CreateSample"]

    /**
     * Note  This interface is deprecated. New applications should not use it. Retrieves the stream data's current format.
     * @returns {WAVEFORMATEX} Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure that contains the stream data's current format.
     * @see https://docs.microsoft.com/windows/win32/api//austream/nf-austream-iaudiomediastream-getformat
     */
    GetFormat() {
        pWaveFormatCurrent := WAVEFORMATEX()
        result := ComCall(9, this, "ptr", pWaveFormatCurrent, "HRESULT")
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
     * Format of the <a href="/windows/desktop/api/austream/nn-austream-iaudiodata">IAudioData</a> object is not compatible with stream.
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
     * @see https://docs.microsoft.com/windows/win32/api//austream/nf-austream-iaudiomediastream-setformat
     */
    SetFormat(lpWaveFormat) {
        result := ComCall(10, this, "ptr", lpWaveFormat, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Creates an audio stream sample for use with the specified stream.
     * @param {IAudioData} pAudioData Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/austream/nn-austream-iaudiodata">IAudioData</a> container. <b>IAudioData</b> objects can be referenced by samples in more than one stream.
     * @param {Integer} dwFlags Reserved for flag data. Must be zero.
     * @returns {IAudioStreamSample} Address of a pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/austream/nn-austream-iaudiostreamsample">IAudioStreamSample</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//austream/nf-austream-iaudiomediastream-createsample
     */
    CreateSample(pAudioData, dwFlags) {
        result := ComCall(11, this, "ptr", pAudioData, "uint", dwFlags, "ptr*", &ppSample := 0, "HRESULT")
        return IAudioStreamSample(ppSample)
    }
}
