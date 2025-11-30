#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class APPLICATIONTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static LOCAL_APPLICATIONTYPE => 0

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTERRESOURCE_APPLICATIONTYPE => 1
}
