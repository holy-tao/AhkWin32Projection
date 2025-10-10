#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines stream buffer parameters that may change from one call to the next. Used with the Process method.
 * @remarks
 * 
  * Although the format and maximum size values of a particular stream buffer are constant, as defined by the <a href="https://docs.microsoft.com/windows/win32/api/xapo/ns-xapo-xapo_lockforprocess_parameters">XAPO_LOCKFORPROCESS_BUFFER_PARAMETERS</a> structure, the actual memory address of the stream buffer is permitted to change. For constant-bit-rate (CBR) XAPOs, ValidFrameCount is constant and is always equal to the corresponding <b>XAPO_LOCKFORPROCESS_BUFFER_PARAMETERS</b>.MaxFrameCount for this buffer.
  * 
  * <div class="alert"><b>Note</b>  Only constant-bit-rate XAPOs are currently supported.</div>
  * <div> </div>
  * 
  * 
  * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
  * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xapo/ns-xapo-xapo_process_buffer_parameters
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class XAPO_PROCESS_BUFFER_PARAMETERS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Pointer to a stream buffer that contains audio data. The buffer must be 16-byte aligned, non-NULL, and must be at least <a href="https://docs.microsoft.com/windows/win32/api/xapo/ns-xapo-xapo_lockforprocess_parameters">XAPO_LOCKFORPROCESS_BUFFER_PARAMETERS</a>.MaxFrameCount frames in size.
     * @type {Pointer<Void>}
     */
    pBuffer {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/xapo/ne-xapo-xapo_buffer_flags">XAPO_BUFFER_FLAGS</a> enumeration describing the contents of the stream buffer.
     * @type {Integer}
     */
    BufferFlags {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Number of frames to process; this value must be within the range 0 to <a href="https://docs.microsoft.com/windows/win32/api/xapo/ns-xapo-xapo_lockforprocess_parameters">XAPO_LOCKFORPROCESS_BUFFER_PARAMETERS</a>.MaxFrameCount.
     * @type {Integer}
     */
    ValidFrameCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
