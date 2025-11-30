#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_ENVIRONMENT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NdisEnvironmentWindows => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisEnvironmentWindowsNt => 1
}
