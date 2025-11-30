#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_ESCAPETYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_DRIVERPRIVATE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_VIDMM => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_TDRDBGCTRL => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_VIDSCH => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_DEVICE => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_DMM => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_DEBUG_SNAPSHOT => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_DRT_TEST => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_DIAGNOSTICS => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_OUTPUTDUPL_SNAPSHOT => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_OUTPUTDUPL_DIAGNOSTICS => 11

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_BDD_PNP => 12

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_BDD_FALLBACK => 13

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_ACTIVATE_SPECIFIC_DIAG => 14

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_MODES_PRUNED_OUT => 15

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_WHQL_INFO => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_BRIGHTNESS => 17

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_EDID_CACHE => 18

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_MIRACAST_DISPLAY_REQUEST => 20

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_HISTORY_BUFFER_STATUS => 21

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_MIRACAST_ADAPTER_DIAG_INFO => 23

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_FORCE_BDDFALLBACK_HEADLESS => 24

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_REQUEST_MACHINE_CRASH => 25

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_SOFTGPU_ENABLE_DISABLE_HMD => 27

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_PROCESS_VERIFIER_OPTION => 28

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_ADAPTER_VERIFIER_OPTION => 29

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_IDD_REQUEST => 30

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_DOD_SET_DIRTYRECT_MODE => 31

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_LOG_CODEPOINT_PACKET => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_LOG_USERMODE_DAIG_PACKET => 33

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_GET_EXTERNAL_DIAGNOSTICS => 34

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_GET_DISPLAY_CONFIGURATIONS => 36

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_QUERY_IOMMU_STATUS => 37

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_CCD_DATABASE => 38

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_QUERY_DMA_REMAPPING_STATUS => 39

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_WIN32K_START => 1024

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_WIN32K_HIP_DEVICE_INFO => 1024

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_WIN32K_QUERY_CD_ROTATION_BLOCK => 1025

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_WIN32K_DPI_INFO => 1026

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_WIN32K_PRESENTER_VIEW_INFO => 1027

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_WIN32K_SYSTEM_DPI => 1028

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_WIN32K_BDD_FALLBACK => 1029

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_WIN32K_DDA_TEST_CTL => 1030

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_WIN32K_USER_DETECTED_BLACK_SCREEN => 1031

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_WIN32K_DISPBROKER_TEST => 1035

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_WIN32K_COLOR_PROFILE_INFO => 1036

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_WIN32K_SET_DIMMED_STATE => 1037

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_WIN32K_SPECIALIZED_DISPLAY_TEST => 1038
}
