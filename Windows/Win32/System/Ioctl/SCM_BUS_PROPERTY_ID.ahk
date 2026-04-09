#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_BUS_PROPERTY_ID extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static ScmBusProperty_RuntimeFwActivationInfo => 0

    /**
     * @type {Integer (Int32)}
     */
    static ScmBusProperty_DedicatedMemoryInfo => 1

    /**
     * @type {Integer (Int32)}
     */
    static ScmBusProperty_DedicatedMemoryState => 2

    /**
     * @type {Integer (Int32)}
     */
    static ScmBusProperty_Max => 3
}
