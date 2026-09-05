#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of an IORING_HANDLE_REF structure.
 * @see https://learn.microsoft.com/windows/win32/api/ioringapi/ne-ioringapi-ioring_ref_kind
 * @namespace Windows.Win32.Storage.FileSystem
 */
class IORING_REF_KIND extends Win32Enum {

    /**
     * The referenced buffer is raw.
     * Native name: IORING_REF_RAW
     * @type {Integer (Int32)}
     */
    static RAW => 0

    /**
     * The referenced buffer has been registered with an I/O ring with a call to [BuildIoRingRegisterFileHandles](nf-ioringapi-buildioringregisterfilehandles.md)
     * Native name: IORING_REF_REGISTERED
     * @type {Integer (Int32)}
     */
    static REGISTERED => 1
}
