#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the memory layout of pixel data in a JPEG image scan.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicjpegscantype
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICJpegScanType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The pixel data is stored in an interleaved memory layout.
     * @type {Integer (Int32)}
     */
    static WICJpegScanTypeInterleaved => 0

    /**
     * The pixel data is stored in a planar memory layout.
     * @type {Integer (Int32)}
     */
    static WICJpegScanTypePlanarComponents => 1

    /**
     * The pixel data is stored in a progressive layout.
     * @type {Integer (Int32)}
     */
    static WICJpegScanTypeProgressive => 2
}
