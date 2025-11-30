#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * This specifies options that apply to the device context for its lifetime.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/ne-d2d1_1-d2d1_device_context_options
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_DEVICE_CONTEXT_OPTIONS extends Win32BitflagEnum{

    /**
     * The device context is created with default options.
     * @type {Integer (Int32)}
     */
    static D2D1_DEVICE_CONTEXT_OPTIONS_NONE => 0

    /**
     * Distribute rendering work across multiple threads. Refer to <a href="https://docs.microsoft.com/windows/desktop/Direct2D/improving-direct2d-performance">Improving the performance of Direct2D apps</a> for additional notes on the use of this flag.
     * @type {Integer (Int32)}
     */
    static D2D1_DEVICE_CONTEXT_OPTIONS_ENABLE_MULTITHREADED_OPTIMIZATIONS => 1
}
