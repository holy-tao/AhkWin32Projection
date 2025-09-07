#Requires AutoHotkey v2.0.0 64-bit

/**
 * The PHONECAPS_BUFFER enum is used by methods that set or get phone capabilities described by a buffer.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-phonecaps_buffer
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class PHONECAPS_BUFFER{

    /**
     * Device-specific phone capabilities.
     * @type {Integer (Int32)}
     */
    static PCB_DEVSPECIFICBUFFER => 0
}
