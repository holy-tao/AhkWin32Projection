#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the contents of a stream buffer.
 * @remarks
 * 
  * This metadata can be used to implement optimizations that require knowledge of a stream buffer's contents. For example, XAPOs that always produce silent output from silent input can check the flag on the input stream buffer to determine if any signal processing is necessary. If silent, the XAPO can simply set the flag on the output stream buffer to silent and return, thus averting the work of processing silent data.
  * 
  * 
  * 
  * Likewise, XAPOs that receive valid input data, but generate silence (for any reason), may set the output stream buffer's flag accordingly, rather than writing silent samples to the buffer.
  * 
  * 
  * 
  * These flags represent what should be assumed is in the respective buffer. The flags may not reflect what is actually stored in memory. For example, the XAPO_BUFFER_SILENT indicates that silent data should be assumed, however the respective memory may be uninitialized
  * 
  * 
  * 
  * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
  * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xapo/ne-xapo-xapo_buffer_flags
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class XAPO_BUFFER_FLAGS{

    /**
     * Stream buffer contains only silent samples.
     * @type {Integer (Int32)}
     */
    static XAPO_BUFFER_SILENT => 0

    /**
     * Stream buffer contains audio data to be processed.
     * @type {Integer (Int32)}
     */
    static XAPO_BUFFER_VALID => 1
}
