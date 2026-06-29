#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines flags that specify how to block data flow from an output pin.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-_am_pin_flow_control_block_flags
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct _AM_PIN_FLOW_CONTROL_BLOCK_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Block the data flow.
     * @type {Integer (Int32)}
     */
    static AM_PIN_FLOW_CONTROL_BLOCK => 1
}
