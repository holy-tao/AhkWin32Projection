#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines flags that specify how to block data flow from an output pin.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-_am_pin_flow_control_block_flags
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class _AM_PIN_FLOW_CONTROL_BLOCK_FLAGS{

    /**
     * Block the data flow.
     * @type {Integer (Int32)}
     */
    static AM_PIN_FLOW_CONTROL_BLOCK => 1
}
