#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines how folders are deleted when one of the disk resource limits is exceeded.
 * @see https://learn.microsoft.com/windows/win32/api/pla/ne-pla-resourcepolicy
 * @namespace Windows.Win32.System.Performance
 */
export default struct ResourcePolicy {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Delete folders from largest to smallest.
     * @type {Integer (Int32)}
     */
    static plaDeleteLargest => 0

    /**
     * Delete folders from oldest to newest.
     * @type {Integer (Int32)}
     */
    static plaDeleteOldest => 1
}
