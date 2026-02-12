#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a detailed status of the result of the most recent call to [DisplayTaskPool.TryExecuteTask](displaytaskpool_tryexecutetask_474435703.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaypresentstatus
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayPresentStatus extends Win32Enum{

    /**
     * Specifies that the requested present was successfully queued to the graphics scheduler. If you registered *OnPresentFlipTo/OnPresentFlipAway* fences, then they're guaranteed to be signaled.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * Specifies that you should look at the [DisplayTaskResult.SourceStatus](displaytaskresult_sourcestatus.md) returned from [DisplayTaskPool.TryExecuteTask](displaytaskpool_tryexecutetask_474435703.md) to get more detailed error info, since the source prevented the present from being successfully queued.
     * @type {Integer (Int32)}
     */
    static SourceStatusPreventedPresent => 1

    /**
     * Specifies that the [DisplayScanout](displayscanout.md) is invalid; you need to recreate the **DisplayScanout** before trying again.
     * @type {Integer (Int32)}
     */
    static ScanoutInvalid => 2

    /**
     * Specifies that the [DisplaySource](displaysource.md) is now invalid; you should recreate the **DisplaySource** before trying again.
     * @type {Integer (Int32)}
     */
    static SourceInvalid => 3

    /**
     * Specifies that the [DisplaySource](displaysource.md) is invalid. This can happen if the underlying GPU adapter stopped or was removed from the kernel's perspective. You can try recreating the [DisplayDevice](displaydevice.md).
     * @type {Integer (Int32)}
     */
    static DeviceInvalid => 4

    /**
     * Specifies a failure that doesn't map to any concrete cause; this generally means that you should fail fast.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 5
}
