#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_CPS_VALUE extends Win32Enum {

    /**
     * Native name: NVME_CPS_NOT_REPORTED
     * @type {Integer (Int32)}
     */
    static NOT_REPORTED => 0

    /**
     * Native name: NVME_CPS_CONTROLLER_SCOPE
     * @type {Integer (Int32)}
     */
    static CONTROLLER_SCOPE => 1

    /**
     * Native name: NVME_CPS_DOMAIN_SCOPE
     * @type {Integer (Int32)}
     */
    static DOMAIN_SCOPE => 2

    /**
     * Native name: NVME_CPS_SUBSYSTEM_SCOPE
     * @type {Integer (Int32)}
     */
    static SUBSYSTEM_SCOPE => 3
}
