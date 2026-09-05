#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_BUS_PROPERTY_ID extends Win32Enum {

    /**
     * Native name: ScmBusProperty_RuntimeFwActivationInfo
     * @type {Integer (Int32)}
     */
    static RuntimeFwActivationInfo => 0

    /**
     * Native name: ScmBusProperty_DedicatedMemoryInfo
     * @type {Integer (Int32)}
     */
    static DedicatedMemoryInfo => 1

    /**
     * Native name: ScmBusProperty_DedicatedMemoryState
     * @type {Integer (Int32)}
     */
    static DedicatedMemoryState => 2

    /**
     * Native name: ScmBusProperty_Max
     * @type {Integer (Int32)}
     */
    static Max => 3
}
