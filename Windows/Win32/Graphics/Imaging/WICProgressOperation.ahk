#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the progress operations to receive notifications for.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicprogressoperation
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICProgressOperation {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Receive copy pixel operation.
     * @type {Integer (Int32)}
     */
    static WICProgressOperationCopyPixels => 1

    /**
     * Receive write pixel operation.
     * @type {Integer (Int32)}
     */
    static WICProgressOperationWritePixels => 2

    /**
     * Receive all progress operations available.
     * @type {Integer (Int32)}
     */
    static WICProgressOperationAll => 65535
}
