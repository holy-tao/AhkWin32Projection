#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the size of the bitmap to use to represent the WinSAT score.
 * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/ne-winsatcominterfacei-winsat_bitmap_size
 * @namespace Windows.Win32.System.AssessmentTool
 */
export default struct WINSAT_BITMAP_SIZE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Use a 32 x 24 bitmap (size is in pixels).
     * @type {Integer (Int32)}
     */
    static WINSAT_BITMAP_SIZE_SMALL => 0

    /**
     * Use an 80 x 80 bitmap (size is in pixels).
     * @type {Integer (Int32)}
     */
    static WINSAT_BITMAP_SIZE_NORMAL => 1
}
