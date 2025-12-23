#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates whether the sizing mode is content or integral sizing.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/ne-ocidl-dvextentmode
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class DVEXTENTMODE extends Win32Enum{

    /**
     * Indicates that the container will ask the object how big it wants to be to exactly fit its content, for example, in snap-to-size operations.
     * @type {Integer (Int32)}
     */
    static DVEXTENT_CONTENT => 0

    /**
     * Indicates that the container will provide a proposed size to the object for its use in resizing.
     * @type {Integer (Int32)}
     */
    static DVEXTENT_INTEGRAL => 1
}
