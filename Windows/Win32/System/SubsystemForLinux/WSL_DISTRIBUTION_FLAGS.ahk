#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WSL_DISTRIBUTION_FLAGS enumeration specifies the behavior of a distribution in the Windows Subsystem for Linux (WSL).
 * @see https://learn.microsoft.com/windows/win32/api/wslapi/ne-wslapi-wsl_distribution_flags
 * @namespace Windows.Win32.System.SubsystemForLinux
 */
class WSL_DISTRIBUTION_FLAGS extends Win32BitflagEnum {

    /**
     * No flags are being supplied.
     * Native name: WSL_DISTRIBUTION_FLAGS_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Allow the distribution to interoperate with Windows processes (for example, the user can invoke "cmd.exe" or "notepad.exe" from within a WSL session).
     * Native name: WSL_DISTRIBUTION_FLAGS_ENABLE_INTEROP
     * @type {Integer (Int32)}
     */
    static ENABLE_INTEROP => 1

    /**
     * Add the Windows %PATH% environment variable values to WSL sessions.
     * Native name: WSL_DISTRIBUTION_FLAGS_APPEND_NT_PATH
     * @type {Integer (Int32)}
     */
    static APPEND_NT_PATH => 2

    /**
     * Automatically mount Windows drives inside of WSL sessions (for example, "C:\" will be available under "/mnt/c").
     * Native name: WSL_DISTRIBUTION_FLAGS_ENABLE_DRIVE_MOUNTING
     * @type {Integer (Int32)}
     */
    static ENABLE_DRIVE_MOUNTING => 4
}
