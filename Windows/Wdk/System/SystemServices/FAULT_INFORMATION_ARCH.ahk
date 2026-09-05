#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class FAULT_INFORMATION_ARCH extends Win32Enum {

    /**
     * Native name: FaultInformationInvalid
     * @type {Integer (Int32)}
     */
    static Invalid => 0

    /**
     * Native name: FaultInformationArm64
     * @type {Integer (Int32)}
     */
    static Arm64 => 1

    /**
     * Native name: FaultInformationX64
     * @type {Integer (Int32)}
     */
    static InformationX64 => 2
}
