#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/ioringapi/ne-ioringapi-ioring_ref_kind
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IORING_REF_KIND extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IORING_REF_RAW => 0

    /**
     * @type {Integer (Int32)}
     */
    static IORING_REF_REGISTERED => 1
}
