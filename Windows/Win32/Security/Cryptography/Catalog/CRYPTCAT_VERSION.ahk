#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Version 1 file format.
 * @see https://learn.microsoft.com/windows/win32/api//content/mscat/nf-mscat-cryptcatopen
 * @namespace Windows.Win32.Security.Cryptography.Catalog
 * @version v4.0.30319
 */
class CRYPTCAT_VERSION extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_VERSION_1 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_VERSION_2 => 512
}
