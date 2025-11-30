#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the target operating system platform.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/ne-oaidl-syskind
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class SYSKIND extends Win32Enum{

    /**
     * The target operating system for the type library is 16-bit Windows. By default, data members are packed.
     * @type {Integer (Int32)}
     */
    static SYS_WIN16 => 0

    /**
     * The target operating system for the type library is 32-bit Windows. By default, data members are naturally aligned (for example, 2-byte integers are aligned on even-byte boundaries; 4-byte integers are aligned on quad-word boundaries, and so on).
     * @type {Integer (Int32)}
     */
    static SYS_WIN32 => 1

    /**
     * The target operating system for the type library is Apple Macintosh. By default, all data members are aligned on even-byte boundaries.
     * @type {Integer (Int32)}
     */
    static SYS_MAC => 2

    /**
     * The target operating system for the type library is 64-bit Windows.
     * @type {Integer (Int32)}
     */
    static SYS_WIN64 => 3
}
