#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IKEEXT_IP_VERSION_SPECIFIC_KEYMODULE_STATISTICS1.ahk
#Include .\IKEEXT_KEYMODULE_STATISTICS1.ahk
#Include .\IKEEXT_IP_VERSION_SPECIFIC_COMMON_STATISTICS1.ahk
#Include .\IKEEXT_COMMON_STATISTICS1.ahk

/**
 * Stores various IKE, AuthIP, and IKEv2 statistics.
 * @see https://docs.microsoft.com/windows/win32/api//iketypes/ns-iketypes-ikeext_statistics1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_STATISTICS1 extends Win32Struct
{
    static sizeof => 1664

    static packingSize => 8

    /**
     * Statistics specific to IKE.
     * 
     * See [IKEEXT_KEYMODULE_STATISTICS1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_keymodule_statistics1) for more information.
     * @type {IKEEXT_KEYMODULE_STATISTICS1}
     */
    ikeStatistics{
        get {
            if(!this.HasProp("__ikeStatistics"))
                this.__ikeStatistics := IKEEXT_KEYMODULE_STATISTICS1(0, this)
            return this.__ikeStatistics
        }
    }

    /**
     * Statistics specific to AuthIP.
     * 
     * See [IKEEXT_KEYMODULE_STATISTICS1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_keymodule_statistics1) for more information.
     * @type {IKEEXT_KEYMODULE_STATISTICS1}
     */
    authipStatistics{
        get {
            if(!this.HasProp("__authipStatistics"))
                this.__authipStatistics := IKEEXT_KEYMODULE_STATISTICS1(544, this)
            return this.__authipStatistics
        }
    }

    /**
     * Statistics specific to IKEv2.
     * 
     * See [IKEEXT_KEYMODULE_STATISTICS1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_keymodule_statistics1) for more information.
     * @type {IKEEXT_KEYMODULE_STATISTICS1}
     */
    ikeV2Statistics{
        get {
            if(!this.HasProp("__ikeV2Statistics"))
                this.__ikeV2Statistics := IKEEXT_KEYMODULE_STATISTICS1(1088, this)
            return this.__ikeV2Statistics
        }
    }

    /**
     * Statistics common to IKE, AuthIP, and IKEv2.
     * 
     * See [IKEEXT_COMMON_STATISTICS1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_common_statistics1) for more information.
     * @type {IKEEXT_COMMON_STATISTICS1}
     */
    commonStatistics{
        get {
            if(!this.HasProp("__commonStatistics"))
                this.__commonStatistics := IKEEXT_COMMON_STATISTICS1(1632, this)
            return this.__commonStatistics
        }
    }
}
