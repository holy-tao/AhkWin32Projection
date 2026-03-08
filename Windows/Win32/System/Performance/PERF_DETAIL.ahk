#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Documentation varies per use. Refer to each: <see href="https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_browse_dlg_config_a">PDH_BROWSE_DLG_CONFIG</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_browse_dlg_config_w">PDH_BROWSE_DLG_CONFIG</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_browse_dlg_config_a">PDH_BROWSE_DLG_CONFIG_A</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_browse_dlg_config_w">PDH_BROWSE_DLG_CONFIG_A</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_browse_dlg_config_ha">PDH_BROWSE_DLG_CONFIG_H</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_browse_dlg_config_hw">PDH_BROWSE_DLG_CONFIG_H</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_browse_dlg_config_ha">PDH_BROWSE_DLG_CONFIG_HA</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_browse_dlg_config_hw">PDH_BROWSE_DLG_CONFIG_HA</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_browse_dlg_config_ha">PDH_BROWSE_DLG_CONFIG_HW</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_browse_dlg_config_hw">PDH_BROWSE_DLG_CONFIG_HW</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_browse_dlg_config_a">PDH_BROWSE_DLG_CONFIG_W</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_browse_dlg_config_w">PDH_BROWSE_DLG_CONFIG_W</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectitemsa">PdhEnumObjectItems</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectitemsw">PdhEnumObjectItems</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectitemsa">PdhEnumObjectItemsA</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectitemsw">PdhEnumObjectItemsA</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectitemsha">PdhEnumObjectItemsH</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectitemshw">PdhEnumObjectItemsH</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectitemsha">PdhEnumObjectItemsHA</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectitemshw">PdhEnumObjectItemsHA</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectitemsha">PdhEnumObjectItemsHW</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectitemshw">PdhEnumObjectItemsHW</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectitemsa">PdhEnumObjectItemsW</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectitemsw">PdhEnumObjectItemsW</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectsa">PdhEnumObjects</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectsw">PdhEnumObjects</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectsa">PdhEnumObjectsA</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectsw">PdhEnumObjectsA</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectsha">PdhEnumObjectsH</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectshw">PdhEnumObjectsH</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectsha">PdhEnumObjectsHA</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectshw">PdhEnumObjectsHA</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectsha">PdhEnumObjectsHW</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectshw">PdhEnumObjectsHW</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectsa">PdhEnumObjectsW</see>, <see href="https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectsw">PdhEnumObjectsW</see>, <see href="https://learn.microsoft.com/windows/win32/api/winperf/ns-winperf-perf_counter_definition">PERF_COUNTER_DEFINITION</see>, <see href="https://learn.microsoft.com/windows/win32/api/winperf/ns-winperf-perf_object_type">PERF_OBJECT_TYPE</see>.
 * @see 
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PERF_DETAIL extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_DETAIL_NOVICE => 100

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_DETAIL_ADVANCED => 200

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_DETAIL_EXPERT => 300

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_DETAIL_WIZARD => 400
}
