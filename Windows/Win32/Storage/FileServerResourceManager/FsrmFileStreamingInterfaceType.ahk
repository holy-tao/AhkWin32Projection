#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the possible streaming interface types.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmfilestreaminginterfacetype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class FsrmFileStreamingInterfaceType extends Win32Enum {

    /**
     * The streaming interface type is unknown; do not use this value.
     * Native name: FsrmFileStreamingInterfaceType_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Use an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> interface to stream the file.
     * Native name: FsrmFileStreamingInterfaceType_ILockBytes
     * @type {Integer (Int32)}
     */
    static ILockBytes => 1

    /**
     * Use an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface to stream the file.
     * Native name: FsrmFileStreamingInterfaceType_IStream
     * @type {Integer (Int32)}
     */
    static IStream => 2
}
