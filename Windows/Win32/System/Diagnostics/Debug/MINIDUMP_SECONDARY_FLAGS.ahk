#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the secondary flags for the minidump.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ne-minidumpapiset-minidump_secondary_flags
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_SECONDARY_FLAGS{

    /**
     * The minidump information does not retrieve the processor power information contained in the <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_misc_info_2">MINIDUMP_MISC_INFO_2</a> structure.
     * @type {Integer (Int32)}
     */
    static MiniSecondaryWithoutPowerInfo => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MiniSecondaryValidFlags => 1
}
