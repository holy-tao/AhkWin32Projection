#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the threading mode used while simultaneously creating the device, factory, and device context.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/ne-d2d1_1-d2d1_threading_mode
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_THREADING_MODE{

    /**
     * Resources may only be invoked serially.  Device context state is not protected from multi-threaded access.
     * @type {Integer (Int32)}
     */
    static D2D1_THREADING_MODE_SINGLE_THREADED => 0

    /**
     * Resources may be invoked from multiple threads. Resources use interlocked reference counting and their state is protected.
     * @type {Integer (Int32)}
     */
    static D2D1_THREADING_MODE_MULTI_THREADED => 1
}
