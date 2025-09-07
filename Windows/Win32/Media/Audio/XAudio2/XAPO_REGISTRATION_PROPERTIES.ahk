#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Describes general characteristics of an XAPO. Used with IXAPO::GetRegistrationProperties, CXAPOParametersBase::CXAPOParametersBase, and CXAPOBase::CXAPOBase.
 * @remarks
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
  * Windows 10 (XAudio2.9); 
  *             Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * @see https://learn.microsoft.com/windows/win32/api/xapo/ns-xapo-xapo_registration_properties
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class XAPO_REGISTRATION_PROPERTIES extends Win32Struct
{
    static sizeof => 1060

    static packingSize => 1

    /**
     * COM class ID for use with the CoCreateInstance function.
     * @type {Pointer<Guid>}
     */
    clsid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Friendly name, a unicode string.
     * @type {String}
     */
    FriendlyName {
        get => StrGet(this.ptr + 8, 255, "UTF-16")
        set => StrPut(value, this.ptr + 8, 255, "UTF-16")
    }

    /**
     * Copyright information, a unicode string.
     * @type {String}
     */
    CopyrightInfo {
        get => StrGet(this.ptr + 520, 255, "UTF-16")
        set => StrPut(value, this.ptr + 520, 255, "UTF-16")
    }

    /**
     * Major version number.
     * @type {Integer}
     */
    MajorVersion {
        get => NumGet(this, 1032, "uint")
        set => NumPut("uint", value, this, 1032)
    }

    /**
     * Minor version number.
     * @type {Integer}
     */
    MinorVersion {
        get => NumGet(this, 1036, "uint")
        set => NumPut("uint", value, this, 1036)
    }

    /**
     * XAPO property flags that describe the general characteristics of process behavior. These flags are described in the following table. 
     * 	 
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>XAPO_FLAG_INPLACE_SUPPORTED</td>
     * <td>
     * XAPO supports in-place processing: the input stream buffer and output stream buffer 
     *             can be the same buffer depending on the input.
     * 
     * For example, consider an effect which may be ran in stereo to 5.1 mode or
     *             mono to mono mode.  When set to stereo to 5.1, it will be run with separate
     *             input and output buffers as format conversion is not permitted in-place.
     *             However, if configured to run mono to mono, the same XAPO can be run
     *             in-place.  Thus the same implementation may be conveniently reused
     *             for various input/output configurations, while taking advantage of
     *             in-place processing when possible.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>XAPO_FLAG_INPLACE_REQUIRED</td>
     * <td>XAPO requires in-place processing: the input stream buffer and output stream buffer must 
     *             be the same buffer.  When the XAPO_FLAG_INPLACE_REQUIRED is used the XAPO cannot perform 
     *             format conversions.</td>
     * </tr>
     * <tr>
     * <td>XAPO_FLAG_CHANNELS_MUST_MATCH</td>
     * <td>Channel count of the input and output streams must match.</td>
     * </tr>
     * <tr>
     * <td>XAPO_FLAG_FRAMERATE_MUST_MATCH</td>
     * <td>Framerate of input and output streams must match.</td>
     * </tr>
     * <tr>
     * <td>XAPO_FLAG_BITSPERSAMPLE_MUST_MATCH</td>
     * <td>Bit depth and container size of input and output streams must match.</td>
     * </tr>
     * <tr>
     * <td>XAPO_FLAG_BUFFERCOUNT_MUST_MATCH</td>
     * <td>Number of input and output buffers must match, applies to 
     *      			<a href="https://docs.microsoft.com/windows/win32/api/xapo/ns-xapo-xapo_lockforprocess_parameters">XAPO_LOCKFORPROCESS_BUFFER_PARAMETERS</a>. When the XAPO_FLAG_BUFFERCOUNT_MUST_MATCH flag is set
     *             <b>XAPO_REGISTRATION_PROPERTIES</b>.<b>MinInputBufferCount</b> must equal
     *             <b>XAPO_REGISTRATION_PROPERTIES</b>.<b>MinOutputBufferCount</b> and
     *             <b>XAPO_REGISTRATION_PROPERTIES</b>.<b>MaxInputBufferCount</b> must equal
     *             <b>XAPO_REGISTRATION_PROPERTIES</b>.<b>MaxOutputBufferCount</b>.
     * 				</td>
     * </tr>
     * <tr>
     * <td>XAPOBASE_DEFAULT_FLAG</td>
     * <td>XAPO_FLAG_CHANNELS_MUST_MATCH | XAPO_FLAG_FRAMERATE_MUST_MATCH | 
     *             XAPO_FLAG_BITSPERSAMPLE_MUST_MATCH | XAPO_FLAG_BUFFERCOUNT_MUST_MATCH | XAPO_FLAG_INPLACE_SUPPORTED
     *             </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 1040, "uint")
        set => NumPut("uint", value, this, 1040)
    }

    /**
     * Minimum number of input streams required for processing.
     * @type {Integer}
     */
    MinInputBufferCount {
        get => NumGet(this, 1044, "uint")
        set => NumPut("uint", value, this, 1044)
    }

    /**
     * Maximum number of input streams required for processing.
     * 
     * <div class="alert"><b>Note</b>  <i>MaxInputBufferCount</i> is currently limited to a value of 1.</div>
     * <div> </div>
     * @type {Integer}
     */
    MaxInputBufferCount {
        get => NumGet(this, 1048, "uint")
        set => NumPut("uint", value, this, 1048)
    }

    /**
     * Minimum number of output streams required for processing.
     * @type {Integer}
     */
    MinOutputBufferCount {
        get => NumGet(this, 1052, "uint")
        set => NumPut("uint", value, this, 1052)
    }

    /**
     * Maximum number of output streams required for processing. 
     * 
     * <div class="alert"><b>Note</b>  <i>MaxOutputBufferCount</i> is currently limited to a value of 1.</div>
     * <div> </div>
     * @type {Integer}
     */
    MaxOutputBufferCount {
        get => NumGet(this, 1056, "uint")
        set => NumPut("uint", value, this, 1056)
    }
}
