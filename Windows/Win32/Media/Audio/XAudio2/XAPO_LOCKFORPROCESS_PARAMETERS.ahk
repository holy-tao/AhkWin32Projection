#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\WAVEFORMATEX.ahk" { WAVEFORMATEX }

/**
 * Defines stream buffer parameters that remain constant while an XAPO is locked. Used with the IXAPO::LockForProcess method.
 * @remarks
 * The byte size of the respective stream buffer must be at least <i>MaxFrameCount</i> × (<i>pFormat</i>-&gt;nBlockAlign) bytes.
 * 
 * 
 * 
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * @see https://learn.microsoft.com/windows/win32/api/xapo/ns-xapo-xapo_lockforprocess_parameters
 * @namespace Windows.Win32.Media.Audio.XAudio2
 */
export default struct XAPO_LOCKFORPROCESS_PARAMETERS {
    #StructPack 8

    /**
     * A WAVFORMATEX describing the format for the stream buffer.
     */
    pFormat : WAVEFORMATEX.Ptr

    /**
     * Maximum number of frames in the stream buffer that <a href="https://docs.microsoft.com/windows/desktop/api/xapo/nf-xapo-ixapo-process">IXAPO::Process</a> would ever be required to handle, irrespective of dynamic parameter settings.
     */
    MaxFrameCount : UInt32

}
