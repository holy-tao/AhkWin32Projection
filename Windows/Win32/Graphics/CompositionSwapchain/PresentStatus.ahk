#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/presentation/ne-presentation-presentstatus
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 * @version v4.0.30319
 */
class PresentStatus extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PresentStatus_Queued => 0

    /**
     * @type {Integer (Int32)}
     */
    static PresentStatus_Skipped => 1

    /**
     * @type {Integer (Int32)}
     */
    static PresentStatus_Canceled => 2
}
