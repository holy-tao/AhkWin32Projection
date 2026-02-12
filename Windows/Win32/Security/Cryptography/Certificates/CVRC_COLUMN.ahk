#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Column information mask.
 * @see https://learn.microsoft.com/windows/win32/api//content/certview/nf-certview-icertview-enumcertviewcolumn
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class CVRC_COLUMN extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CVRC_COLUMN_SCHEMA => 0

    /**
     * @type {Integer (Int32)}
     */
    static CVRC_COLUMN_RESULT => 1

    /**
     * @type {Integer (Int32)}
     */
    static CVRC_COLUMN_VALUE => 2

    /**
     * @type {Integer (Int32)}
     */
    static CVRC_COLUMN_MASK => 4095
}
