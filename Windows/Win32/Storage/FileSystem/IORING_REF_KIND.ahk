#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of an IORING_HANDLE_REF structure.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/ioringapi/ne-ioringapi-ioring_ref_kind
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IORING_REF_KIND extends Win32Enum{

    /**
     * The referenced buffer is raw.
     * @type {Integer (Int32)}
     */
    static IORING_REF_RAW => 0

    /**
     * The referenced buffer has been registered with an I/O ring with a call to [BuildIoRingRegisterFileHandles](nf-ioringapi-buildioringregisterfilehandles.md)
     * @type {Integer (Int32)}
     */
    static IORING_REF_REGISTERED => 1
}
