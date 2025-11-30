#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/ne-processthreadsapi-machine_attributes
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class MACHINE_ATTRIBUTES extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static UserEnabled => 1

    /**
     * @type {Integer (Int32)}
     */
    static KernelEnabled => 2

    /**
     * @type {Integer (Int32)}
     */
    static Wow64Container => 4
}
