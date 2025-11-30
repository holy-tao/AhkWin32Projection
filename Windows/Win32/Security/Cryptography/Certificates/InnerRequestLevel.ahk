#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the containment level of a certificate request within a PKCS
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/ne-certenroll-innerrequestlevel
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class InnerRequestLevel extends Win32Enum{

    /**
     * Use to retrieve the most deeply nested request.
     * @type {Integer (Int32)}
     */
    static LevelInnermost => 0

    /**
     * Use to retrieve the request at the next nesting level.
     * @type {Integer (Int32)}
     */
    static LevelNext => 1
}
