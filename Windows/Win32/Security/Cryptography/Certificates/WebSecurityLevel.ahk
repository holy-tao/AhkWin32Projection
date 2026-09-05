#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether a web-enabled method or property is safe for scripting.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-websecuritylevel
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class WebSecurityLevel extends Win32Enum {

    /**
     * The method is not safe for scripting.
     * Native name: LevelUnsafe
     * @type {Integer (Int32)}
     */
    static Unsafe => 0

    /**
     * The method is safe for scripting.
     * Native name: LevelSafe
     * @type {Integer (Int32)}
     */
    static Safe => 1
}
