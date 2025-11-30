#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class FAULT_INFORMATION_ARCH extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FaultInformationInvalid => 0

    /**
     * @type {Integer (Int32)}
     */
    static FaultInformationArm64 => 1

    /**
     * @type {Integer (Int32)}
     */
    static FaultInformationX64 => 2
}
