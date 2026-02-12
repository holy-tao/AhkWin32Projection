#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the platforms that a specified type should be supported in, as used by Windows Runtime attributes and metadata.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.metadata.platform
 * @namespace Windows.Foundation.Metadata
 * @version WindowsRuntime 1.4
 */
class Platform extends Win32Enum{

    /**
     * For use by Windows metadata.
     * @type {Integer (Int32)}
     */
    static Windows => 0

    /**
     * For use by Windows Phone metadata.
     * @type {Integer (Int32)}
     */
    static WindowsPhone => 1
}
