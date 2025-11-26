#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Base interface that represents an object that provides audio data to be rendered from a position in 3D space, relative to the user.
 * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nn-spatialaudioclient-ispatialaudioobjectbase
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISpatialAudioObjectBase extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAudioObjectBase
     * @type {Guid}
     */
    static IID => Guid("{cce0b8f2-8d4d-4efb-a8cf-3d6ecf1c30e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBuffer", "SetEndOfStream", "IsActive", "GetAudioObjectType"]

    /**
     * Gets a buffer that is used to supply the audio data for the ISpatialAudioObject.
     * @param {Pointer<Pointer<Integer>>} buffer The buffer into which audio data is written.
     * @param {Pointer<Integer>} bufferLength The length of the buffer in bytes. This length will be the value returned in the   <i>frameCountPerBuffer</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-beginupdatingaudioobjects">ISpatialAudioObjectRenderStream::BeginUpdatingAudioObjects</a> multiplied by the value of the <b>nBlockAlign</b> field of the <a href="https://docs.microsoft.com/windows/win32/api/mmreg/ns-mmreg-waveformatex">WAVEFORMATEX</a> structure passed in the     <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/ns-spatialaudioclient-spatialaudioobjectrenderstreamactivationparams">SpatialAudioObjectRenderStreamActivationParams</a>  
     *     parameter to  <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient-activatespatialaudiostream">ISpatialAudioClient::ActivateSpatialAudioStream</a>.
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
     * <dt><b>SPTLAUDCLNT_E_OUT_OF_ORDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-beginupdatingaudioobjects">ISpatialAudioObjectRenderStream::BeginUpdatingAudioObjects</a> was not called before the call to <b>GetBuffer</b>. This method must be called before the first time <b>GetBuffer</b> is called and after every subsequent call to <a href="/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-endupdatingaudioobjects">ISpatialAudioObjectRenderStream::EndUpdatingAudioObjects</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUDCLNT_E_RESOURCES_INVALIDATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectbase-setendofstream">SetEndOfStream</a> was called either explicitly or implicitly in a previous audio processing pass. <b>SetEndOfStream</b> is called implicitly by the system if <b>GetBuffer</b> is not called within an audio processing pass (between calls to <a href="/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-beginupdatingaudioobjects">ISpatialAudioObjectRenderStream::BeginUpdatingAudioObjects</a> and <a href="/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-endupdatingaudioobjects">ISpatialAudioObjectRenderStream::EndUpdatingAudioObjects</a>).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectbase-getbuffer
     */
    GetBuffer(buffer, bufferLength) {
        bufferMarshal := buffer is VarRef ? "ptr*" : "ptr"
        bufferLengthMarshal := bufferLength is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, bufferMarshal, buffer, bufferLengthMarshal, bufferLength, "HRESULT")
        return result
    }

    /**
     * Instructs the system that the final block of audio data has been submitted for the ISpatialAudioObject so that the object can be deactivated and it's resources reused.
     * @param {Integer} frameCount The number of audio frames in the audio buffer that should be included in the final processing pass. This number may be smaller than or equal to the value returned in  the <i>frameCountPerBuffer</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-beginupdatingaudioobjects">ISpatialAudioObjectRenderStream::BeginUpdatingAudioObjects</a>.
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
     * <dt><b>SPTLAUDCLNT_E_OUT_OF_ORDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-beginupdatingaudioobjects">ISpatialAudioObjectRenderStream::BeginUpdatingAudioObjects</a> was not called before the call to <b>SetEndOfStream</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SPTLAUDCLNT_E_RESOURCES_INVALIDATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectbase-setendofstream">SetEndOfStream</a> was called either explicitly or implicitly in a previous audio processing pass. <b>SetEndOfStream</b> is called implicitly by the system if <b>GetBuffer</b> is not called within an audio processing pass (between calls to <a href="/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-beginupdatingaudioobjects">ISpatialAudioObjectRenderStream::BeginUpdatingAudioObjects</a> and <a href="/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreambase-endupdatingaudioobjects">ISpatialAudioObjectRenderStream::EndUpdatingAudioObjects</a>).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectbase-setendofstream
     */
    SetEndOfStream(frameCount) {
        result := ComCall(4, this, "uint", frameCount, "HRESULT")
        return result
    }

    /**
     * Gets a boolean value indicating whether the ISpatialAudioObject is valid.
     * @returns {BOOL} <b>TRUE</b> if the audio object is currently valid; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectbase-isactive
     */
    IsActive() {
        result := ComCall(5, this, "int*", &isActive := 0, "HRESULT")
        return isActive
    }

    /**
     * Gets a value specifying the type of audio object that is represented by the ISpatialAudioObject.
     * @returns {Integer} A value specifying the type of audio object that is represented
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectbase-getaudioobjecttype
     */
    GetAudioObjectType() {
        result := ComCall(6, this, "int*", &audioObjectType := 0, "HRESULT")
        return audioObjectType
    }
}
