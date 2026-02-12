#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The <i>lpBuffer</i> parameter contains an NTMS_FILESYSTEM_INFO structure. This flag is used for media that contain file systems.
 * @see https://learn.microsoft.com/windows/win32/api//content/ntmsapi/nf-ntmsapi-updatentmsomidinfo
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NTMS_OMID_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static NTMS_OMID_TYPE_FILESYSTEM_INFO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NTMS_OMID_TYPE_RAW_LABEL => 1
}
