#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the containment level of a certificate request within a PKCS
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-innerrequestlevel
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class InnerRequestLevel extends Win32Enum {

    /**
     * Use to retrieve the most deeply nested request.
     * Native name: LevelInnermost
     * @type {Integer (Int32)}
     */
    static Innermost => 0

    /**
     * Use to retrieve the request at the next nesting level.
     * Native name: LevelNext
     * @type {Integer (Int32)}
     */
    static Next => 1
}
