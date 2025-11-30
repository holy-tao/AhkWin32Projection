#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_ADAPTER_EXCLUSION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CLUS_ADAPTER_EXCLUSION_TYPE_IPPREFIX => 0

    /**
     * @type {Integer (Int32)}
     */
    static CLUS_ADAPTER_EXCLUSION_TYPE_DESCRIPTION => 1

    /**
     * @type {Integer (Int32)}
     */
    static CLUS_ADAPTER_EXCLUSION_TYPE_FRIENDLYNAME => 2
}
