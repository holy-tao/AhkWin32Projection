#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class SUBSYSTEM_INFORMATION_TYPE extends Win32Enum {

    /**
     * Native name: SubsystemInformationTypeWin32
     * @type {Integer (Int32)}
     */
    static Win32 => 0

    /**
     * Native name: SubsystemInformationTypeWSL
     * @type {Integer (Int32)}
     */
    static TypeWSL => 1

    /**
     * @type {Integer (Int32)}
     */
    static MaxSubsystemInformationType => 2
}
