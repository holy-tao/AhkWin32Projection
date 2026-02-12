#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates a deprecation as **Deprecate** or **Remove**.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.metadata.deprecationtype
 * @namespace Windows.Foundation.Metadata
 * @version WindowsRuntime 1.4
 */
class DeprecationType extends Win32Enum{

    /**
     * Compilers and other tools should treat the entity as deprecated. This is the default.
     * @type {Integer (Int32)}
     */
    static Deprecate => 0

    /**
     * Compilers and other tools should treat the entity as removed.
     * @type {Integer (Int32)}
     */
    static Remove => 1
}
