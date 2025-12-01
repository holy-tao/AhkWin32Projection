#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IKEEXT_IP_VERSION_SPECIFIC_KEYMODULE_STATISTICS0.ahk
#Include .\IKEEXT_KEYMODULE_STATISTICS0.ahk
#Include .\IKEEXT_IP_VERSION_SPECIFIC_COMMON_STATISTICS0.ahk
#Include .\IKEEXT_COMMON_STATISTICS0.ahk

/**
 * Stores various IKE/AuthIP statistics.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_statistics0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_STATISTICS0 extends Win32Struct
{
    static sizeof => 1120

    static packingSize => 8

    /**
     * Statistics specific to IKE.
     * 
     * See [IKEEXT_KEYMODULE_STATISTICS0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_keymodule_statistics0) for more information.
     * @type {IKEEXT_KEYMODULE_STATISTICS0}
     */
    ikeStatistics{
        get {
            if(!this.HasProp("__ikeStatistics"))
                this.__ikeStatistics := IKEEXT_KEYMODULE_STATISTICS0(0, this)
            return this.__ikeStatistics
        }
    }

    /**
     * Statistics specific to AuthIP.
     * 
     * See [IKEEXT_KEYMODULE_STATISTICS0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_keymodule_statistics0) for more information.
     * @type {IKEEXT_KEYMODULE_STATISTICS0}
     */
    authipStatistics{
        get {
            if(!this.HasProp("__authipStatistics"))
                this.__authipStatistics := IKEEXT_KEYMODULE_STATISTICS0(544, this)
            return this.__authipStatistics
        }
    }

    /**
     * Statistics common to IKE and AuthIP.
     * 
     * See [IKEEXT_COMMON_STATISTICS0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_common_statistics0) for more information.
     * @type {IKEEXT_COMMON_STATISTICS0}
     */
    commonStatistics{
        get {
            if(!this.HasProp("__commonStatistics"))
                this.__commonStatistics := IKEEXT_COMMON_STATISTICS0(1088, this)
            return this.__commonStatistics
        }
    }
}
