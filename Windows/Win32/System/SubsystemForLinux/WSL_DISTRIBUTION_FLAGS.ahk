#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WSL_DISTRIBUTION_FLAGS enumeration specifies the behavior of a distribution in the Windows Subsystem for Linux (WSL).
 * @see https://learn.microsoft.com/windows/win32/api/wslapi/ne-wslapi-wsl_distribution_flags
 * @namespace Windows.Win32.System.SubsystemForLinux
 * @version v4.0.30319
 */
class WSL_DISTRIBUTION_FLAGS{

    /**
     * No flags are being supplied.
     * @type {Integer (Int32)}
     */
    static WSL_DISTRIBUTION_FLAGS_NONE => 0

    /**
     * Allow the distribution to interoperate with Windows processes (for example, the user can invoke "cmd.exe" or "notepad.exe" from within a WSL session).
     * @type {Integer (Int32)}
     */
    static WSL_DISTRIBUTION_FLAGS_ENABLE_INTEROP => 1

    /**
     * Add the Windows %PATH% environment variable values to WSL sessions.
     * @type {Integer (Int32)}
     */
    static WSL_DISTRIBUTION_FLAGS_APPEND_NT_PATH => 2

    /**
     * Automatically mount Windows drives inside of WSL sessions (for example, "C:\" will be available under "/mnt/c").
     * @type {Integer (Int32)}
     */
    static WSL_DISTRIBUTION_FLAGS_ENABLE_DRIVE_MOUNTING => 4
}
