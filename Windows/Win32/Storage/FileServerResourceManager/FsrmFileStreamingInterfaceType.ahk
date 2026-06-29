#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the possible streaming interface types.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmfilestreaminginterfacetype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct FsrmFileStreamingInterfaceType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The streaming interface type is unknown; do not use this value.
     * @type {Integer (Int32)}
     */
    static FsrmFileStreamingInterfaceType_Unknown => 0

    /**
     * Use an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> interface to stream the file.
     * @type {Integer (Int32)}
     */
    static FsrmFileStreamingInterfaceType_ILockBytes => 1

    /**
     * Use an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface to stream the file.
     * @type {Integer (Int32)}
     */
    static FsrmFileStreamingInterfaceType_IStream => 2
}
