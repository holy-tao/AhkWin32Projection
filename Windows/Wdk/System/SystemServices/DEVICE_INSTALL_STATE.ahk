#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class DEVICE_INSTALL_STATE extends Win32Enum {

    /**
     * Native name: InstallStateInstalled
     * @type {Integer (Int32)}
     */
    static Installed => 0

    /**
     * Native name: InstallStateNeedsReinstall
     * @type {Integer (Int32)}
     */
    static NeedsReinstall => 1

    /**
     * Native name: InstallStateFailedInstall
     * @type {Integer (Int32)}
     */
    static FailedInstall => 2

    /**
     * Native name: InstallStateFinishInstall
     * @type {Integer (Int32)}
     */
    static FinishInstall => 3
}
