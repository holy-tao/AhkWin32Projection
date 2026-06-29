#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the threading mode used while simultaneously creating the device, factory, and device context.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/ne-d2d1_1-d2d1_threading_mode
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_THREADING_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
