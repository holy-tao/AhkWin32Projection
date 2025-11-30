#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KernelMode => 0

    /**
     * @type {Integer (Int32)}
     */
    static UserMode => 1

    /**
     * @type {Integer (Int32)}
     */
    static MaximumMode => 2
}
