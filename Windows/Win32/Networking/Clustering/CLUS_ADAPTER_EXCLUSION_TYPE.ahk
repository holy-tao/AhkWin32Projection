#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUS_ADAPTER_EXCLUSION_TYPE extends Win32Enum {

    /**
     * Native name: CLUS_ADAPTER_EXCLUSION_TYPE_IPPREFIX
     * @type {Integer (Int32)}
     */
    static IPPREFIX => 0

    /**
     * Native name: CLUS_ADAPTER_EXCLUSION_TYPE_DESCRIPTION
     * @type {Integer (Int32)}
     */
    static DESCRIPTION => 1

    /**
     * Native name: CLUS_ADAPTER_EXCLUSION_TYPE_FRIENDLYNAME
     * @type {Integer (Int32)}
     */
    static FRIENDLYNAME => 2
}
