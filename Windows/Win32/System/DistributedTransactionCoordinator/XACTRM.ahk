#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
class XACTRM extends Win32Enum {

    /**
     * Native name: XACTRM_OPTIMISTICLASTWINS
     * @type {Integer (Int32)}
     */
    static OPTIMISTICLASTWINS => 1

    /**
     * Native name: XACTRM_NOREADONLYPREPARES
     * @type {Integer (Int32)}
     */
    static NOREADONLYPREPARES => 2
}
