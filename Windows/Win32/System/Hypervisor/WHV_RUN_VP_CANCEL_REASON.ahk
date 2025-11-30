#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_RUN_VP_CANCEL_REASON extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WHvRunVpCancelReasonUser => 0
}
