#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the possible streaming interface types.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmfilestreaminginterfacetype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmFileStreamingInterfaceType extends Win32Enum{

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
