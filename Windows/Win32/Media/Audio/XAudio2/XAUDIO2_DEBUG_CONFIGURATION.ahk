#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the new global debug configuration for XAudio2. Used with the SetDebugConfiguration function.
 * @remarks
 * Debugging messages can be completely turned off by initializing <b>XAUDIO2_DEBUG_CONFIGURATION</b> to all zeroes.
 * 
 * <div class="alert"><b>Note</b>  For this version of XAudio2, only the <b>XAUDIO2_LOG_ERRORS</b> value is supported on <b>TraceMask</b> or <b>BreakMask</b>. All other members and values are ignored.</div>
 * <div> </div>
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * @see https://learn.microsoft.com/windows/win32/api/xaudio2/ns-xaudio2-xaudio2_debug_configuration
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class XAUDIO2_DEBUG_CONFIGURATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Bitmask of enabled debug message types. Can be 0 or one or more of the following:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>XAUDIO2_LOG_ERRORS</td>
     * <td>Log error messages. </td>
     * </tr>
     * <tr>
     * <td>XAUDIO2_LOG_WARNINGS</td>
     * <td>Log warning messages. 
     * 		   <div class="alert"><b>Note</b>  Enabling XAUDIO2_LOG_WARNINGS also enables XAUDIO2_LOG_ERRORS.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td>XAUDIO2_LOG_INFO</td>
     * <td>Log informational messages. </td>
     * </tr>
     * <tr>
     * <td>XAUDIO2_LOG_DETAIL</td>
     * <td>Log detailed informational messages.  
     *          <div class="alert"><b>Note</b>  Enabling XAUDIO2_LOG_DETAIL also enables XAUDIO2_LOG_INFO.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td>XAUDIO2_LOG_API_CALLS</td>
     * <td>Log public API function entries and exits. </td>
     * </tr>
     * <tr>
     * <td>XAUDIO2_LOG_FUNC_CALLS</td>
     * <td>Log internal function entries and exits. 
     * 		   <div class="alert"><b>Note</b>  Enabling XAUDIO2_LOG_FUNC_CALLS also enables XAUDIO2_LOG_API_CALLS.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td>XAUDIO2_LOG_TIMING</td>
     * <td>Log delays detected and other timing data. </td>
     * </tr>
     * <tr>
     * <td>XAUDIO2_LOG_LOCKS</td>
     * <td>Log usage of critical sections and mutexes. </td>
     * </tr>
     * <tr>
     * <td>XAUDIO2_LOG_MEMORY</td>
     * <td>Log memory heap usage information. </td>
     * </tr>
     * <tr>
     * <td>XAUDIO2_LOG_STREAMING</td>
     * <td>Log audio streaming information. </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    TraceMask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Message types that will cause an immediate break. Can be 0 or one of the following:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>XAUDIO2_LOG_ERRORS</td>
     * <td>Break on error messages. </td>
     * </tr>
     * <tr>
     * <td>XAUDIO2_LOG_WARNINGS</td>
     * <td>Break on warning messages. 
     *                 <div class="alert"><b>Note</b>  Enabling XAUDIO2_LOG_WARNINGS also enables XAUDIO2_LOG_ERRORS.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    BreakMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Indicates whether to log the thread ID with each message.
     * @type {BOOL}
     */
    LogThreadID {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Indicates whether to log source files and line numbers.
     * @type {BOOL}
     */
    LogFileline {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Indicates whether to log function names.
     * @type {BOOL}
     */
    LogFunctionName {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Indicates whether to log message timestamps.
     * @type {BOOL}
     */
    LogTiming {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
