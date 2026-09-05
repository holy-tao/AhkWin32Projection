#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_ESCAPETYPE extends Win32Enum {

    /**
     * Native name: D3DKMT_ESCAPE_DRIVERPRIVATE
     * @type {Integer (Int32)}
     */
    static ESCAPE_DRIVERPRIVATE => 0

    /**
     * Native name: D3DKMT_ESCAPE_VIDMM
     * @type {Integer (Int32)}
     */
    static ESCAPE_VIDMM => 1

    /**
     * Native name: D3DKMT_ESCAPE_TDRDBGCTRL
     * @type {Integer (Int32)}
     */
    static ESCAPE_TDRDBGCTRL => 2

    /**
     * Native name: D3DKMT_ESCAPE_VIDSCH
     * @type {Integer (Int32)}
     */
    static ESCAPE_VIDSCH => 3

    /**
     * Native name: D3DKMT_ESCAPE_DEVICE
     * @type {Integer (Int32)}
     */
    static ESCAPE_DEVICE => 4

    /**
     * Native name: D3DKMT_ESCAPE_DMM
     * @type {Integer (Int32)}
     */
    static ESCAPE_DMM => 5

    /**
     * Native name: D3DKMT_ESCAPE_DEBUG_SNAPSHOT
     * @type {Integer (Int32)}
     */
    static ESCAPE_DEBUG_SNAPSHOT => 6

    /**
     * Native name: D3DKMT_ESCAPE_DRT_TEST
     * @type {Integer (Int32)}
     */
    static ESCAPE_DRT_TEST => 8

    /**
     * Native name: D3DKMT_ESCAPE_DIAGNOSTICS
     * @type {Integer (Int32)}
     */
    static ESCAPE_DIAGNOSTICS => 9

    /**
     * Native name: D3DKMT_ESCAPE_OUTPUTDUPL_SNAPSHOT
     * @type {Integer (Int32)}
     */
    static ESCAPE_OUTPUTDUPL_SNAPSHOT => 10

    /**
     * Native name: D3DKMT_ESCAPE_OUTPUTDUPL_DIAGNOSTICS
     * @type {Integer (Int32)}
     */
    static ESCAPE_OUTPUTDUPL_DIAGNOSTICS => 11

    /**
     * Native name: D3DKMT_ESCAPE_BDD_PNP
     * @type {Integer (Int32)}
     */
    static ESCAPE_BDD_PNP => 12

    /**
     * Native name: D3DKMT_ESCAPE_BDD_FALLBACK
     * @type {Integer (Int32)}
     */
    static ESCAPE_BDD_FALLBACK => 13

    /**
     * Native name: D3DKMT_ESCAPE_ACTIVATE_SPECIFIC_DIAG
     * @type {Integer (Int32)}
     */
    static ESCAPE_ACTIVATE_SPECIFIC_DIAG => 14

    /**
     * Native name: D3DKMT_ESCAPE_MODES_PRUNED_OUT
     * @type {Integer (Int32)}
     */
    static ESCAPE_MODES_PRUNED_OUT => 15

    /**
     * Native name: D3DKMT_ESCAPE_WHQL_INFO
     * @type {Integer (Int32)}
     */
    static ESCAPE_WHQL_INFO => 16

    /**
     * Native name: D3DKMT_ESCAPE_BRIGHTNESS
     * @type {Integer (Int32)}
     */
    static ESCAPE_BRIGHTNESS => 17

    /**
     * Native name: D3DKMT_ESCAPE_EDID_CACHE
     * @type {Integer (Int32)}
     */
    static ESCAPE_EDID_CACHE => 18

    /**
     * Native name: D3DKMT_ESCAPE_MIRACAST_DISPLAY_REQUEST
     * @type {Integer (Int32)}
     */
    static ESCAPE_MIRACAST_DISPLAY_REQUEST => 20

    /**
     * Native name: D3DKMT_ESCAPE_HISTORY_BUFFER_STATUS
     * @type {Integer (Int32)}
     */
    static ESCAPE_HISTORY_BUFFER_STATUS => 21

    /**
     * Native name: D3DKMT_ESCAPE_MIRACAST_ADAPTER_DIAG_INFO
     * @type {Integer (Int32)}
     */
    static ESCAPE_MIRACAST_ADAPTER_DIAG_INFO => 23

    /**
     * Native name: D3DKMT_ESCAPE_FORCE_BDDFALLBACK_HEADLESS
     * @type {Integer (Int32)}
     */
    static ESCAPE_FORCE_BDDFALLBACK_HEADLESS => 24

    /**
     * Native name: D3DKMT_ESCAPE_REQUEST_MACHINE_CRASH
     * @type {Integer (Int32)}
     */
    static ESCAPE_REQUEST_MACHINE_CRASH => 25

    /**
     * Native name: D3DKMT_ESCAPE_SOFTGPU_ENABLE_DISABLE_HMD
     * @type {Integer (Int32)}
     */
    static ESCAPE_SOFTGPU_ENABLE_DISABLE_HMD => 27

    /**
     * Native name: D3DKMT_ESCAPE_PROCESS_VERIFIER_OPTION
     * @type {Integer (Int32)}
     */
    static ESCAPE_PROCESS_VERIFIER_OPTION => 28

    /**
     * Native name: D3DKMT_ESCAPE_ADAPTER_VERIFIER_OPTION
     * @type {Integer (Int32)}
     */
    static ESCAPE_ADAPTER_VERIFIER_OPTION => 29

    /**
     * Native name: D3DKMT_ESCAPE_IDD_REQUEST
     * @type {Integer (Int32)}
     */
    static ESCAPE_IDD_REQUEST => 30

    /**
     * Native name: D3DKMT_ESCAPE_DOD_SET_DIRTYRECT_MODE
     * @type {Integer (Int32)}
     */
    static ESCAPE_DOD_SET_DIRTYRECT_MODE => 31

    /**
     * Native name: D3DKMT_ESCAPE_LOG_CODEPOINT_PACKET
     * @type {Integer (Int32)}
     */
    static ESCAPE_LOG_CODEPOINT_PACKET => 32

    /**
     * Native name: D3DKMT_ESCAPE_LOG_USERMODE_DAIG_PACKET
     * @type {Integer (Int32)}
     */
    static ESCAPE_LOG_USERMODE_DAIG_PACKET => 33

    /**
     * Native name: D3DKMT_ESCAPE_GET_EXTERNAL_DIAGNOSTICS
     * @type {Integer (Int32)}
     */
    static ESCAPE_GET_EXTERNAL_DIAGNOSTICS => 34

    /**
     * Native name: D3DKMT_ESCAPE_GET_DISPLAY_CONFIGURATIONS
     * @type {Integer (Int32)}
     */
    static ESCAPE_GET_DISPLAY_CONFIGURATIONS => 36

    /**
     * Native name: D3DKMT_ESCAPE_QUERY_IOMMU_STATUS
     * @type {Integer (Int32)}
     */
    static ESCAPE_QUERY_IOMMU_STATUS => 37

    /**
     * Native name: D3DKMT_ESCAPE_CCD_DATABASE
     * @type {Integer (Int32)}
     */
    static ESCAPE_CCD_DATABASE => 38

    /**
     * Native name: D3DKMT_ESCAPE_QUERY_DMA_REMAPPING_STATUS
     * @type {Integer (Int32)}
     */
    static ESCAPE_QUERY_DMA_REMAPPING_STATUS => 39

    /**
     * Native name: D3DKMT_ESCAPE_WIN32K_START
     * @type {Integer (Int32)}
     */
    static ESCAPE_WIN32K_START => 1024

    /**
     * Native name: D3DKMT_ESCAPE_WIN32K_HIP_DEVICE_INFO
     * @type {Integer (Int32)}
     */
    static ESCAPE_WIN32K_HIP_DEVICE_INFO => 1024

    /**
     * Native name: D3DKMT_ESCAPE_WIN32K_QUERY_CD_ROTATION_BLOCK
     * @type {Integer (Int32)}
     */
    static ESCAPE_WIN32K_QUERY_CD_ROTATION_BLOCK => 1025

    /**
     * Native name: D3DKMT_ESCAPE_WIN32K_DPI_INFO
     * @type {Integer (Int32)}
     */
    static ESCAPE_WIN32K_DPI_INFO => 1026

    /**
     * Native name: D3DKMT_ESCAPE_WIN32K_PRESENTER_VIEW_INFO
     * @type {Integer (Int32)}
     */
    static ESCAPE_WIN32K_PRESENTER_VIEW_INFO => 1027

    /**
     * Native name: D3DKMT_ESCAPE_WIN32K_SYSTEM_DPI
     * @type {Integer (Int32)}
     */
    static ESCAPE_WIN32K_SYSTEM_DPI => 1028

    /**
     * Native name: D3DKMT_ESCAPE_WIN32K_BDD_FALLBACK
     * @type {Integer (Int32)}
     */
    static ESCAPE_WIN32K_BDD_FALLBACK => 1029

    /**
     * Native name: D3DKMT_ESCAPE_WIN32K_DDA_TEST_CTL
     * @type {Integer (Int32)}
     */
    static ESCAPE_WIN32K_DDA_TEST_CTL => 1030

    /**
     * Native name: D3DKMT_ESCAPE_WIN32K_USER_DETECTED_BLACK_SCREEN
     * @type {Integer (Int32)}
     */
    static ESCAPE_WIN32K_USER_DETECTED_BLACK_SCREEN => 1031

    /**
     * Native name: D3DKMT_ESCAPE_WIN32K_DISPBROKER_TEST
     * @type {Integer (Int32)}
     */
    static ESCAPE_WIN32K_DISPBROKER_TEST => 1035

    /**
     * Native name: D3DKMT_ESCAPE_WIN32K_COLOR_PROFILE_INFO
     * @type {Integer (Int32)}
     */
    static ESCAPE_WIN32K_COLOR_PROFILE_INFO => 1036

    /**
     * Native name: D3DKMT_ESCAPE_WIN32K_SET_DIMMED_STATE
     * @type {Integer (Int32)}
     */
    static ESCAPE_WIN32K_SET_DIMMED_STATE => 1037

    /**
     * Native name: D3DKMT_ESCAPE_WIN32K_SPECIALIZED_DISPLAY_TEST
     * @type {Integer (Int32)}
     */
    static ESCAPE_WIN32K_SPECIALIZED_DISPLAY_TEST => 1038
}
