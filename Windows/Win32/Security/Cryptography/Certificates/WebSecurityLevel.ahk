#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether a web-enabled method or property is safe for scripting.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/ne-certenroll-websecuritylevel
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class WebSecurityLevel extends Win32Enum{

    /**
     * The method is not safe for scripting.
     * @type {Integer (Int32)}
     */
    static LevelUnsafe => 0

    /**
     * The method is safe for scripting.
     * @type {Integer (Int32)}
     */
    static LevelSafe => 1
}
