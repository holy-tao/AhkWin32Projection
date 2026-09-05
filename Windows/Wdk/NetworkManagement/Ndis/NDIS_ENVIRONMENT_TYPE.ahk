#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_ENVIRONMENT_TYPE extends Win32Enum {

    /**
     * Native name: NdisEnvironmentWindows
     * @type {Integer (Int32)}
     */
    static Windows => 0

    /**
     * Native name: NdisEnvironmentWindowsNt
     * @type {Integer (Int32)}
     */
    static WindowsNt => 1
}
