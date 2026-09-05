#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi
 */
class DXGI_Message_Id extends Win32Enum {

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_CreationOrResizeBuffers_InvalidOutputWindow
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_CreationOrResizeBuffers_InvalidOutputWindow => 0

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_CreationOrResizeBuffers_BufferWidthInferred
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_CreationOrResizeBuffers_BufferWidthInferred => 1

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_CreationOrResizeBuffers_BufferHeightInferred
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_CreationOrResizeBuffers_BufferHeightInferred => 2

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_CreationOrResizeBuffers_NoScanoutFlagChanged
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_CreationOrResizeBuffers_NoScanoutFlagChanged => 3

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Creation_MaxBufferCountExceeded
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Creation_MaxBufferCountExceeded => 4

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Creation_TooFewBuffers
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Creation_TooFewBuffers => 5

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Creation_NoOutputWindow
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Creation_NoOutputWindow => 6

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Destruction_OtherMethodsCalled
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Destruction_OtherMethodsCalled => 7

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_GetDesc_pDescIsNULL
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_GetDesc_pDescIsNULL => 8

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_GetBuffer_ppSurfaceIsNULL
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_GetBuffer_ppSurfaceIsNULL => 9

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_GetBuffer_NoAllocatedBuffers
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_GetBuffer_NoAllocatedBuffers => 10

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_GetBuffer_iBufferMustBeZero
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_GetBuffer_iBufferMustBeZero => 11

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_GetBuffer_iBufferOOB
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_GetBuffer_iBufferOOB => 12

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_GetContainingOutput_ppOutputIsNULL
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_GetContainingOutput_ppOutputIsNULL => 13

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_SyncIntervalOOB
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_SyncIntervalOOB => 14

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_InvalidNonPreRotatedFlag
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_InvalidNonPreRotatedFlag => 15

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_NoAllocatedBuffers
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_NoAllocatedBuffers => 16

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_GetDXGIAdapterFailed
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_GetDXGIAdapterFailed => 17

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_ResizeBuffers_BufferCountOOB
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_ResizeBuffers_BufferCountOOB => 18

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_ResizeBuffers_UnreleasedReferences
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_ResizeBuffers_UnreleasedReferences => 19

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidSwapChainFlag
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_ResizeBuffers_InvalidSwapChainFlag => 20

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidNonPreRotatedFlag
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_ResizeBuffers_InvalidNonPreRotatedFlag => 21

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_ResizeTarget_RefreshRateDivideByZero
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_ResizeTarget_RefreshRateDivideByZero => 22

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_SetFullscreenState_InvalidTarget
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_SetFullscreenState_InvalidTarget => 23

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_GetFrameStatistics_pStatsIsNULL
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_GetFrameStatistics_pStatsIsNULL => 24

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_GetLastPresentCount_pLastPresentCountIsNULL
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_GetLastPresentCount_pLastPresentCountIsNULL => 25

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_SetFullscreenState_RemoteNotSupported
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_SetFullscreenState_RemoteNotSupported => 26

    /**
     * Native name: DXGI_MSG_IDXGIOutput_TakeOwnership_FailedToAcquireFullscreenMutex
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_TakeOwnership_FailedToAcquireFullscreenMutex => 27

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSoftwareAdapter_ppAdapterInterfaceIsNULL
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSoftwareAdapter_ppAdapterInterfaceIsNULL => 28

    /**
     * Native name: DXGI_MSG_IDXGIFactory_EnumAdapters_ppAdapterInterfaceIsNULL
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_EnumAdapters_ppAdapterInterfaceIsNULL => 29

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_ppSwapChainIsNULL
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_ppSwapChainIsNULL => 30

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_pDescIsNULL
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_pDescIsNULL => 31

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_UnknownSwapEffect
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_UnknownSwapEffect => 32

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidFlags
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_InvalidFlags => 33

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_NonPreRotatedFlagAndWindowed
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_NonPreRotatedFlagAndWindowed => 34

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_NullDeviceInterface
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_NullDeviceInterface => 35

    /**
     * Native name: DXGI_MSG_IDXGIFactory_GetWindowAssociation_phWndIsNULL
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_GetWindowAssociation_phWndIsNULL => 36

    /**
     * Native name: DXGI_MSG_IDXGIFactory_MakeWindowAssociation_InvalidFlags
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_MakeWindowAssociation_InvalidFlags => 37

    /**
     * Native name: DXGI_MSG_IDXGISurface_Map_InvalidSurface
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISurface_Map_InvalidSurface => 38

    /**
     * Native name: DXGI_MSG_IDXGISurface_Map_FlagsSetToZero
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISurface_Map_FlagsSetToZero => 39

    /**
     * Native name: DXGI_MSG_IDXGISurface_Map_DiscardAndReadFlagSet
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISurface_Map_DiscardAndReadFlagSet => 40

    /**
     * Native name: DXGI_MSG_IDXGISurface_Map_DiscardButNotWriteFlagSet
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISurface_Map_DiscardButNotWriteFlagSet => 41

    /**
     * Native name: DXGI_MSG_IDXGISurface_Map_NoCPUAccess
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISurface_Map_NoCPUAccess => 42

    /**
     * Native name: DXGI_MSG_IDXGISurface_Map_ReadFlagSetButCPUAccessIsDynamic
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISurface_Map_ReadFlagSetButCPUAccessIsDynamic => 43

    /**
     * Native name: DXGI_MSG_IDXGISurface_Map_DiscardFlagSetButCPUAccessIsNotDynamic
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISurface_Map_DiscardFlagSetButCPUAccessIsNotDynamic => 44

    /**
     * Native name: DXGI_MSG_IDXGIOutput_GetDisplayModeList_pNumModesIsNULL
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_GetDisplayModeList_pNumModesIsNULL => 45

    /**
     * Native name: DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_ModeHasInvalidWidthOrHeight
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_FindClosestMatchingMode_ModeHasInvalidWidthOrHeight => 46

    /**
     * Native name: DXGI_MSG_IDXGIOutput_GetCammaControlCapabilities_NoOwnerDevice
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_GetCammaControlCapabilities_NoOwnerDevice => 47

    /**
     * Native name: DXGI_MSG_IDXGIOutput_TakeOwnership_pDeviceIsNULL
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_TakeOwnership_pDeviceIsNULL => 48

    /**
     * Native name: DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_NoOwnerDevice
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_GetDisplaySurfaceData_NoOwnerDevice => 49

    /**
     * Native name: DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_pDestinationIsNULL
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_GetDisplaySurfaceData_pDestinationIsNULL => 50

    /**
     * Native name: DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_MapOfDestinationFailed
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_GetDisplaySurfaceData_MapOfDestinationFailed => 51

    /**
     * Native name: DXGI_MSG_IDXGIOutput_GetFrameStatistics_NoOwnerDevice
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_GetFrameStatistics_NoOwnerDevice => 52

    /**
     * Native name: DXGI_MSG_IDXGIOutput_GetFrameStatistics_pStatsIsNULL
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_GetFrameStatistics_pStatsIsNULL => 53

    /**
     * Native name: DXGI_MSG_IDXGIOutput_SetGammaControl_NoOwnerDevice
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_SetGammaControl_NoOwnerDevice => 54

    /**
     * Native name: DXGI_MSG_IDXGIOutput_GetGammaControl_NoOwnerDevice
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_GetGammaControl_NoOwnerDevice => 55

    /**
     * Native name: DXGI_MSG_IDXGIOutput_GetGammaControl_NoGammaControls
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_GetGammaControl_NoGammaControls => 56

    /**
     * Native name: DXGI_MSG_IDXGIOutput_SetDisplaySurface_IDXGIResourceNotSupportedBypPrimary
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_SetDisplaySurface_IDXGIResourceNotSupportedBypPrimary => 57

    /**
     * Native name: DXGI_MSG_IDXGIOutput_SetDisplaySurface_pPrimaryIsInvalid
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_SetDisplaySurface_pPrimaryIsInvalid => 58

    /**
     * Native name: DXGI_MSG_IDXGIOutput_SetDisplaySurface_NoOwnerDevice
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_SetDisplaySurface_NoOwnerDevice => 59

    /**
     * Native name: DXGI_MSG_IDXGIOutput_TakeOwnership_RemoteDeviceNotSupported
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_TakeOwnership_RemoteDeviceNotSupported => 60

    /**
     * Native name: DXGI_MSG_IDXGIOutput_GetDisplayModeList_RemoteDeviceNotSupported
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_GetDisplayModeList_RemoteDeviceNotSupported => 61

    /**
     * Native name: DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_RemoteDeviceNotSupported
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_FindClosestMatchingMode_RemoteDeviceNotSupported => 62

    /**
     * Native name: DXGI_MSG_IDXGIDevice_CreateSurface_InvalidParametersWithpSharedResource
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIDevice_CreateSurface_InvalidParametersWithpSharedResource => 63

    /**
     * Native name: DXGI_MSG_IDXGIObject_GetPrivateData_puiDataSizeIsNULL
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIObject_GetPrivateData_puiDataSizeIsNULL => 64

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Creation_InvalidOutputWindow
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Creation_InvalidOutputWindow => 65

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Release_SwapChainIsFullscreen
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Release_SwapChainIsFullscreen => 66

    /**
     * Native name: DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_InvalidTargetSurfaceFormat
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_GetDisplaySurfaceData_InvalidTargetSurfaceFormat => 67

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSoftwareAdapter_ModuleIsNULL
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSoftwareAdapter_ModuleIsNULL => 68

    /**
     * Native name: DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_IDXGIDeviceNotSupportedBypConcernedDevice
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_FindClosestMatchingMode_IDXGIDeviceNotSupportedBypConcernedDevice => 69

    /**
     * Native name: DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_pModeToMatchOrpClosestMatchIsNULL
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_FindClosestMatchingMode_pModeToMatchOrpClosestMatchIsNULL => 70

    /**
     * Native name: DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_ModeHasRefreshRateDenominatorZero
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_FindClosestMatchingMode_ModeHasRefreshRateDenominatorZero => 71

    /**
     * Native name: DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_UnknownFormatIsInvalidForConfiguration
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_FindClosestMatchingMode_UnknownFormatIsInvalidForConfiguration => 72

    /**
     * Native name: DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_InvalidDisplayModeScanlineOrdering
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_FindClosestMatchingMode_InvalidDisplayModeScanlineOrdering => 73

    /**
     * Native name: DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_InvalidDisplayModeScaling
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_FindClosestMatchingMode_InvalidDisplayModeScaling => 74

    /**
     * Native name: DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_InvalidDisplayModeFormatAndDeviceCombination
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_FindClosestMatchingMode_InvalidDisplayModeFormatAndDeviceCombination => 75

    /**
     * Native name: DXGI_MSG_IDXGIFactory_Creation_CalledFromDllMain
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_Creation_CalledFromDllMain => 76

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_SetFullscreenState_OutputNotOwnedBySwapChainDevice
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_SetFullscreenState_OutputNotOwnedBySwapChainDevice => 77

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Creation_InvalidWindowStyle
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Creation_InvalidWindowStyle => 78

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_GetFrameStatistics_UnsupportedStatistics
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_GetFrameStatistics_UnsupportedStatistics => 79

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_GetContainingOutput_SwapchainAdapterDoesNotControlOutput
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_GetContainingOutput_SwapchainAdapterDoesNotControlOutput => 80

    /**
     * Native name: DXGI_MSG_IDXGIOutput_SetOrGetGammaControl_pArrayIsNULL
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_SetOrGetGammaControl_pArrayIsNULL => 81

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_SetFullscreenState_FullscreenInvalidForChildWindows
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_SetFullscreenState_FullscreenInvalidForChildWindows => 82

    /**
     * Native name: DXGI_MSG_IDXGIFactory_Release_CalledFromDllMain
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_Release_CalledFromDllMain => 83

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_UnreleasedHDC
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_UnreleasedHDC => 84

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_ResizeBuffers_NonPreRotatedAndGDICompatibleFlags
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_ResizeBuffers_NonPreRotatedAndGDICompatibleFlags => 85

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_NonPreRotatedAndGDICompatibleFlags
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_NonPreRotatedAndGDICompatibleFlags => 86

    /**
     * Native name: DXGI_MSG_IDXGISurface1_GetDC_pHdcIsNULL
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISurface1_GetDC_pHdcIsNULL => 87

    /**
     * Native name: DXGI_MSG_IDXGISurface1_GetDC_SurfaceNotTexture2D
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISurface1_GetDC_SurfaceNotTexture2D => 88

    /**
     * Native name: DXGI_MSG_IDXGISurface1_GetDC_GDICompatibleFlagNotSet
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISurface1_GetDC_GDICompatibleFlagNotSet => 89

    /**
     * Native name: DXGI_MSG_IDXGISurface1_GetDC_UnreleasedHDC
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISurface1_GetDC_UnreleasedHDC => 90

    /**
     * Native name: DXGI_MSG_IDXGISurface_Map_NoCPUAccess2
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISurface_Map_NoCPUAccess2 => 91

    /**
     * Native name: DXGI_MSG_IDXGISurface1_ReleaseDC_GetDCNotCalled
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISurface1_ReleaseDC_GetDCNotCalled => 92

    /**
     * Native name: DXGI_MSG_IDXGISurface1_ReleaseDC_InvalidRectangleDimensions
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISurface1_ReleaseDC_InvalidRectangleDimensions => 93

    /**
     * Native name: DXGI_MSG_IDXGIOutput_TakeOwnership_RemoteOutputNotSupported
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_TakeOwnership_RemoteOutputNotSupported => 94

    /**
     * Native name: DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_RemoteOutputNotSupported
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_FindClosestMatchingMode_RemoteOutputNotSupported => 95

    /**
     * Native name: DXGI_MSG_IDXGIOutput_GetDisplayModeList_RemoteOutputNotSupported
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_GetDisplayModeList_RemoteOutputNotSupported => 96

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_pDeviceHasMismatchedDXGIFactory
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_pDeviceHasMismatchedDXGIFactory => 97

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_NonOptimalFSConfiguration
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_NonOptimalFSConfiguration => 98

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_FlipSequentialNotSupportedOnD3D10
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_FlipSequentialNotSupportedOnD3D10 => 99

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_BufferCountOOBForFlipSequential
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_BufferCountOOBForFlipSequential => 100

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidFormatForFlipSequential
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_InvalidFormatForFlipSequential => 101

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_MultiSamplingNotSupportedForFlipSequential
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_MultiSamplingNotSupportedForFlipSequential => 102

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_ResizeBuffers_BufferCountOOBForFlipSequential
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_ResizeBuffers_BufferCountOOBForFlipSequential => 103

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidFormatForFlipSequential
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_ResizeBuffers_InvalidFormatForFlipSequential => 104

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_PartialPresentationBeforeStandardPresentation
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_PartialPresentationBeforeStandardPresentation => 105

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_FullscreenPartialPresentIsInvalid
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_FullscreenPartialPresentIsInvalid => 106

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_InvalidPresentTestOrDoNotSequenceFlag
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_InvalidPresentTestOrDoNotSequenceFlag => 107

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_ScrollInfoWithNoDirtyRectsSpecified
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_ScrollInfoWithNoDirtyRectsSpecified => 108

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_EmptyScrollRect
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_EmptyScrollRect => 109

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_ScrollRectOutOfBackbufferBounds
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_ScrollRectOutOfBackbufferBounds => 110

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_ScrollRectOutOfBackbufferBoundsWithOffset
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_ScrollRectOutOfBackbufferBoundsWithOffset => 111

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_EmptyDirtyRect
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_EmptyDirtyRect => 112

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_DirtyRectOutOfBackbufferBounds
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_DirtyRectOutOfBackbufferBounds => 113

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_UnsupportedBufferUsageFlags
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_UnsupportedBufferUsageFlags => 114

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_DoNotSequenceFlagSetButPreviousBufferIsUndefined
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_DoNotSequenceFlagSetButPreviousBufferIsUndefined => 115

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_UnsupportedFlags
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_UnsupportedFlags => 116

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_FlipModelChainMustResizeOrCreateOnFSTransition
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_FlipModelChainMustResizeOrCreateOnFSTransition => 117

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_pRestrictToOutputFromOtherIDXGIFactory
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_pRestrictToOutputFromOtherIDXGIFactory => 118

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_RestrictOutputNotSupportedOnAdapter
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_RestrictOutputNotSupportedOnAdapter => 119

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_RestrictToOutputFlagSetButInvalidpRestrictToOutput
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_RestrictToOutputFlagSetButInvalidpRestrictToOutput => 120

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_RestrictToOutputFlagdWithFullscreen
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_RestrictToOutputFlagdWithFullscreen => 121

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_RestrictOutputFlagWithStaleSwapChain
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_RestrictOutputFlagWithStaleSwapChain => 122

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_OtherFlagsCausingInvalidPresentTestFlag
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_OtherFlagsCausingInvalidPresentTestFlag => 123

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_UnavailableInSession0
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_UnavailableInSession0 => 124

    /**
     * Native name: DXGI_MSG_IDXGIFactory_MakeWindowAssociation_UnavailableInSession0
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_MakeWindowAssociation_UnavailableInSession0 => 125

    /**
     * Native name: DXGI_MSG_IDXGIFactory_GetWindowAssociation_UnavailableInSession0
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_GetWindowAssociation_UnavailableInSession0 => 126

    /**
     * Native name: DXGI_MSG_IDXGIAdapter_EnumOutputs_UnavailableInSession0
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIAdapter_EnumOutputs_UnavailableInSession0 => 127

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_CreationOrSetFullscreenState_StereoDisabled
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_CreationOrSetFullscreenState_StereoDisabled => 128

    /**
     * Native name: DXGI_MSG_IDXGIFactory2_UnregisterStatus_CookieNotFound
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory2_UnregisterStatus_CookieNotFound => 129

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_ProtectedContentInWindowedModeWithoutFSOrOverlay
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_ProtectedContentInWindowedModeWithoutFSOrOverlay => 130

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_ProtectedContentInWindowedModeWithoutFlipSequential
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_ProtectedContentInWindowedModeWithoutFlipSequential => 131

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_ProtectedContentWithRDPDriver
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_ProtectedContentWithRDPDriver => 132

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_ProtectedContentInWindowedModeWithDWMOffOrInvalidDisplayAffinity
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_ProtectedContentInWindowedModeWithDWMOffOrInvalidDisplayAffinity => 133

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_WidthOrHeightIsZero
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChainForComposition_WidthOrHeightIsZero => 134

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_OnlyFlipSequentialSupported
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChainForComposition_OnlyFlipSequentialSupported => 135

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_UnsupportedOnAdapter
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChainForComposition_UnsupportedOnAdapter => 136

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_UnsupportedOnWindows7
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChainForComposition_UnsupportedOnWindows7 => 137

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_SetFullscreenState_FSTransitionWithCompositionSwapChain
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_SetFullscreenState_FSTransitionWithCompositionSwapChain => 138

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_ResizeTarget_InvalidWithCompositionSwapChain
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_ResizeTarget_InvalidWithCompositionSwapChain => 139

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_ResizeBuffers_WidthOrHeightIsZero
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_ResizeBuffers_WidthOrHeightIsZero => 140

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_ScalingNoneIsFlipModelOnly
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_ScalingNoneIsFlipModelOnly => 141

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_ScalingUnrecognized
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_ScalingUnrecognized => 142

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_DisplayOnlyFullscreenUnsupported
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_DisplayOnlyFullscreenUnsupported => 143

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_DisplayOnlyUnsupported
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_DisplayOnlyUnsupported => 144

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_RestartIsFullscreenOnly
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_RestartIsFullscreenOnly => 145

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_ProtectedWindowlessPresentationRequiresDisplayOnly
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_ProtectedWindowlessPresentationRequiresDisplayOnly => 146

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_SetFullscreenState_DisplayOnlyUnsupported
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_SetFullscreenState_DisplayOnlyUnsupported => 147

    /**
     * Native name: DXGI_MSG_IDXGISwapChain1_SetBackgroundColor_OutOfRange
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain1_SetBackgroundColor_OutOfRange => 148

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_ResizeBuffers_DisplayOnlyFullscreenUnsupported
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_ResizeBuffers_DisplayOnlyFullscreenUnsupported => 149

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_ResizeBuffers_DisplayOnlyUnsupported
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_ResizeBuffers_DisplayOnlyUnsupported => 150

    /**
     * Native name: DXGI_MSG_IDXGISwapchain_Present_ScrollUnsupported
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapchain_Present_ScrollUnsupported => 151

    /**
     * Native name: DXGI_MSG_IDXGISwapChain1_SetRotation_UnsupportedOS
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain1_SetRotation_UnsupportedOS => 152

    /**
     * Native name: DXGI_MSG_IDXGISwapChain1_GetRotation_UnsupportedOS
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain1_GetRotation_UnsupportedOS => 153

    /**
     * Native name: DXGI_MSG_IDXGISwapchain_Present_FullscreenRotation
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapchain_Present_FullscreenRotation => 154

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_PartialPresentationWithMSAABuffers
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_PartialPresentationWithMSAABuffers => 155

    /**
     * Native name: DXGI_MSG_IDXGISwapChain1_SetRotation_FlipSequentialRequired
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain1_SetRotation_FlipSequentialRequired => 156

    /**
     * Native name: DXGI_MSG_IDXGISwapChain1_SetRotation_InvalidRotation
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain1_SetRotation_InvalidRotation => 157

    /**
     * Native name: DXGI_MSG_IDXGISwapChain1_GetRotation_FlipSequentialRequired
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain1_GetRotation_FlipSequentialRequired => 158

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_GetHwnd_WrongType
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_GetHwnd_WrongType => 159

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_GetCompositionSurface_WrongType
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_GetCompositionSurface_WrongType => 160

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_GetCoreWindow_WrongType
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_GetCoreWindow_WrongType => 161

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_GetFullscreenDesc_NonHwnd
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_GetFullscreenDesc_NonHwnd => 162

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_SetFullscreenState_CoreWindow
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_SetFullscreenState_CoreWindow => 163

    /**
     * Native name: DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_UnsupportedOnWindows7
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_UnsupportedOnWindows7 => 164

    /**
     * Native name: DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_pWindowIsNULL
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_pWindowIsNULL => 165

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_FSUnsupportedForModernApps
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_FSUnsupportedForModernApps => 166

    /**
     * Native name: DXGI_MSG_IDXGIFactory_MakeWindowAssociation_ModernApp
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_MakeWindowAssociation_ModernApp => 167

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_ResizeTarget_ModernApp
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_ResizeTarget_ModernApp => 168

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_ResizeTarget_pNewTargetParametersIsNULL
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_ResizeTarget_pNewTargetParametersIsNULL => 169

    /**
     * Native name: DXGI_MSG_IDXGIOutput_SetDisplaySurface_ModernApp
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_SetDisplaySurface_ModernApp => 170

    /**
     * Native name: DXGI_MSG_IDXGIOutput_TakeOwnership_ModernApp
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_TakeOwnership_ModernApp => 171

    /**
     * Native name: DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_pWindowIsInvalid
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_pWindowIsInvalid => 172

    /**
     * Native name: DXGI_MSG_IDXGIFactory2_CreateSwapChainForCompositionSurface_InvalidHandle
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory2_CreateSwapChainForCompositionSurface_InvalidHandle => 173

    /**
     * Native name: DXGI_MSG_IDXGISurface1_GetDC_ModernApp
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISurface1_GetDC_ModernApp => 174

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_ScalingNoneRequiresWindows8OrNewer
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_ScalingNoneRequiresWindows8OrNewer => 175

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_TemporaryMonoAndPreferRight
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_TemporaryMonoAndPreferRight => 176

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_TemporaryMonoOrPreferRightWithDoNotSequence
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_TemporaryMonoOrPreferRightWithDoNotSequence => 177

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_TemporaryMonoOrPreferRightWithoutStereo
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_TemporaryMonoOrPreferRightWithoutStereo => 178

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_TemporaryMonoUnsupported
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_TemporaryMonoUnsupported => 179

    /**
     * Native name: DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_ArraySizeMismatch
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_GetDisplaySurfaceData_ArraySizeMismatch => 180

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_PartialPresentationWithSwapEffectDiscard
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_PartialPresentationWithSwapEffectDiscard => 181

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_AlphaUnrecognized
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_AlphaUnrecognized => 182

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_AlphaIsWindowlessOnly
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_AlphaIsWindowlessOnly => 183

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_AlphaIsFlipModelOnly
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_AlphaIsFlipModelOnly => 184

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_RestrictToOutputAdapterMismatch
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_RestrictToOutputAdapterMismatch => 185

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_DisplayOnlyOnLegacy
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_DisplayOnlyOnLegacy => 186

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_ResizeBuffers_DisplayOnlyOnLegacy
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_ResizeBuffers_DisplayOnlyOnLegacy => 187

    /**
     * Native name: DXGI_MSG_IDXGIResource1_CreateSubresourceSurface_InvalidIndex
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIResource1_CreateSubresourceSurface_InvalidIndex => 188

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_InvalidScaling
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChainForComposition_InvalidScaling => 189

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChainForCoreWindow_InvalidSwapEffect
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChainForCoreWindow_InvalidSwapEffect => 190

    /**
     * Native name: DXGI_MSG_IDXGIResource1_CreateSharedHandle_UnsupportedOS
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIResource1_CreateSharedHandle_UnsupportedOS => 191

    /**
     * Native name: DXGI_MSG_IDXGIFactory2_RegisterOcclusionStatusWindow_UnsupportedOS
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory2_RegisterOcclusionStatusWindow_UnsupportedOS => 192

    /**
     * Native name: DXGI_MSG_IDXGIFactory2_RegisterOcclusionStatusEvent_UnsupportedOS
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory2_RegisterOcclusionStatusEvent_UnsupportedOS => 193

    /**
     * Native name: DXGI_MSG_IDXGIOutput1_DuplicateOutput_UnsupportedOS
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput1_DuplicateOutput_UnsupportedOS => 194

    /**
     * Native name: DXGI_MSG_IDXGIDisplayControl_IsStereoEnabled_UnsupportedOS
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIDisplayControl_IsStereoEnabled_UnsupportedOS => 195

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_InvalidAlphaMode
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChainForComposition_InvalidAlphaMode => 196

    /**
     * Native name: DXGI_MSG_IDXGIFactory_GetSharedResourceAdapterLuid_InvalidResource
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_GetSharedResourceAdapterLuid_InvalidResource => 197

    /**
     * Native name: DXGI_MSG_IDXGIFactory_GetSharedResourceAdapterLuid_InvalidLUID
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_GetSharedResourceAdapterLuid_InvalidLUID => 198

    /**
     * Native name: DXGI_MSG_IDXGIFactory_GetSharedResourceAdapterLuid_UnsupportedOS
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_GetSharedResourceAdapterLuid_UnsupportedOS => 199

    /**
     * Native name: DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_2DOnly
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput1_GetDisplaySurfaceData1_2DOnly => 200

    /**
     * Native name: DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_StagingOnly
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput1_GetDisplaySurfaceData1_StagingOnly => 201

    /**
     * Native name: DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_NeedCPUAccessWrite
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput1_GetDisplaySurfaceData1_NeedCPUAccessWrite => 202

    /**
     * Native name: DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_NoShared
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput1_GetDisplaySurfaceData1_NoShared => 203

    /**
     * Native name: DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_OnlyMipLevels1
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput1_GetDisplaySurfaceData1_OnlyMipLevels1 => 204

    /**
     * Native name: DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_MappedOrOfferedResource
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput1_GetDisplaySurfaceData1_MappedOrOfferedResource => 205

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_SetFullscreenState_FSUnsupportedForModernApps
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_SetFullscreenState_FSUnsupportedForModernApps => 206

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_FailedToGoFSButNonPreRotated
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_FailedToGoFSButNonPreRotated => 207

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChainOrRegisterOcclusionStatus_BlitModelUsedWhileRegisteredForOcclusionStatusEvents
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChainOrRegisterOcclusionStatus_BlitModelUsedWhileRegisteredForOcclusionStatusEvents => 208

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_BlitModelUsedWhileRegisteredForOcclusionStatusEvents
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_BlitModelUsedWhileRegisteredForOcclusionStatusEvents => 209

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_WaitableSwapChainsAreFlipModelOnly
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_WaitableSwapChainsAreFlipModelOnly => 210

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_WaitableSwapChainsAreNotFullscreen
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_WaitableSwapChainsAreNotFullscreen => 211

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_SetFullscreenState_Waitable
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_SetFullscreenState_Waitable => 212

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveWaitableFlag
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveWaitableFlag => 213

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_GetFrameLatencyWaitableObject_OnlyWaitable
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_GetFrameLatencyWaitableObject_OnlyWaitable => 214

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_GetMaximumFrameLatency_OnlyWaitable
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_GetMaximumFrameLatency_OnlyWaitable => 215

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_GetMaximumFrameLatency_pMaxLatencyIsNULL
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_GetMaximumFrameLatency_pMaxLatencyIsNULL => 216

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_SetMaximumFrameLatency_OnlyWaitable
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_SetMaximumFrameLatency_OnlyWaitable => 217

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_SetMaximumFrameLatency_MaxLatencyIsOutOfBounds
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_SetMaximumFrameLatency_MaxLatencyIsOutOfBounds => 218

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_ForegroundIsCoreWindowOnly
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_ForegroundIsCoreWindowOnly => 219

    /**
     * Native name: DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_ForegroundUnsupportedOnAdapter
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_ForegroundUnsupportedOnAdapter => 220

    /**
     * Native name: DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_InvalidScaling
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_InvalidScaling => 221

    /**
     * Native name: DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_InvalidAlphaMode
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_InvalidAlphaMode => 222

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveForegroundFlag
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveForegroundFlag => 223

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_SetMatrixTransform_MatrixPointerCannotBeNull
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_SetMatrixTransform_MatrixPointerCannotBeNull => 224

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_SetMatrixTransform_RequiresCompositionSwapChain
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_SetMatrixTransform_RequiresCompositionSwapChain => 225

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_SetMatrixTransform_MatrixMustBeFinite
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_SetMatrixTransform_MatrixMustBeFinite => 226

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_SetMatrixTransform_MatrixMustBeTranslateAndOrScale
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_SetMatrixTransform_MatrixMustBeTranslateAndOrScale => 227

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_GetMatrixTransform_MatrixPointerCannotBeNull
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_GetMatrixTransform_MatrixPointerCannotBeNull => 228

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_GetMatrixTransform_RequiresCompositionSwapChain
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_GetMatrixTransform_RequiresCompositionSwapChain => 229

    /**
     * Native name: DXGI_MSG_DXGIGetDebugInterface1_NULL_ppDebug
     * @type {Integer (Int32)}
     */
    static MSG_DXGIGetDebugInterface1_NULL_ppDebug => 230

    /**
     * Native name: DXGI_MSG_DXGIGetDebugInterface1_InvalidFlags
     * @type {Integer (Int32)}
     */
    static MSG_DXGIGetDebugInterface1_InvalidFlags => 231

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_Decode
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_Decode => 232

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_ResizeBuffers_Decode
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_ResizeBuffers_Decode => 233

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_SetSourceSize_FlipModel
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_SetSourceSize_FlipModel => 234

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_SetSourceSize_Decode
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_SetSourceSize_Decode => 235

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_SetSourceSize_WidthHeight
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_SetSourceSize_WidthHeight => 236

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_GetSourceSize_NullPointers
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_GetSourceSize_NullPointers => 237

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_GetSourceSize_Decode
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_GetSourceSize_Decode => 238

    /**
     * Native name: DXGI_MSG_IDXGIDecodeSwapChain_SetColorSpace_InvalidFlags
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIDecodeSwapChain_SetColorSpace_InvalidFlags => 239

    /**
     * Native name: DXGI_MSG_IDXGIDecodeSwapChain_SetSourceRect_InvalidRect
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIDecodeSwapChain_SetSourceRect_InvalidRect => 240

    /**
     * Native name: DXGI_MSG_IDXGIDecodeSwapChain_SetTargetRect_InvalidRect
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIDecodeSwapChain_SetTargetRect_InvalidRect => 241

    /**
     * Native name: DXGI_MSG_IDXGIDecodeSwapChain_SetDestSize_InvalidSize
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIDecodeSwapChain_SetDestSize_InvalidSize => 242

    /**
     * Native name: DXGI_MSG_IDXGIDecodeSwapChain_GetSourceRect_InvalidPointer
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIDecodeSwapChain_GetSourceRect_InvalidPointer => 243

    /**
     * Native name: DXGI_MSG_IDXGIDecodeSwapChain_GetTargetRect_InvalidPointer
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIDecodeSwapChain_GetTargetRect_InvalidPointer => 244

    /**
     * Native name: DXGI_MSG_IDXGIDecodeSwapChain_GetDestSize_InvalidPointer
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIDecodeSwapChain_GetDestSize_InvalidPointer => 245

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_PresentBuffer_YUV
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_PresentBuffer_YUV => 246

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_SetSourceSize_YUV
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_SetSourceSize_YUV => 247

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_GetSourceSize_YUV
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_GetSourceSize_YUV => 248

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_SetMatrixTransform_YUV
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_SetMatrixTransform_YUV => 249

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_GetMatrixTransform_YUV
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_GetMatrixTransform_YUV => 250

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_PartialPresentation_YUV
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_PartialPresentation_YUV => 251

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveFlag_YUV
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveFlag_YUV => 252

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_ResizeBuffers_Alignment_YUV
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_ResizeBuffers_Alignment_YUV => 253

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_ShaderInputUnsupported_YUV
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_ShaderInputUnsupported_YUV => 254

    /**
     * Native name: DXGI_MSG_IDXGIOutput3_CheckOverlaySupport_NullPointers
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput3_CheckOverlaySupport_NullPointers => 255

    /**
     * Native name: DXGI_MSG_IDXGIOutput3_CheckOverlaySupport_IDXGIDeviceNotSupportedBypConcernedDevice
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput3_CheckOverlaySupport_IDXGIDeviceNotSupportedBypConcernedDevice => 256

    /**
     * Native name: DXGI_MSG_IDXGIAdapter_EnumOutputs2_InvalidEnumOutputs2Flag
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIAdapter_EnumOutputs2_InvalidEnumOutputs2Flag => 257

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_CreationOrSetFullscreenState_FSUnsupportedForFlipDiscard
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_CreationOrSetFullscreenState_FSUnsupportedForFlipDiscard => 258

    /**
     * Native name: DXGI_MSG_IDXGIOutput4_CheckOverlayColorSpaceSupport_NullPointers
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput4_CheckOverlayColorSpaceSupport_NullPointers => 259

    /**
     * Native name: DXGI_MSG_IDXGIOutput4_CheckOverlayColorSpaceSupport_IDXGIDeviceNotSupportedBypConcernedDevice
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput4_CheckOverlayColorSpaceSupport_IDXGIDeviceNotSupportedBypConcernedDevice => 260

    /**
     * Native name: DXGI_MSG_IDXGISwapChain3_CheckColorSpaceSupport_NullPointers
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain3_CheckColorSpaceSupport_NullPointers => 261

    /**
     * Native name: DXGI_MSG_IDXGISwapChain3_SetColorSpace1_InvalidColorSpace
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain3_SetColorSpace1_InvalidColorSpace => 262

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidHwProtect
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_InvalidHwProtect => 263

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_HwProtectUnsupported
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_HwProtectUnsupported => 264

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidHwProtect
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_ResizeBuffers_InvalidHwProtect => 265

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_ResizeBuffers_HwProtectUnsupported
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_ResizeBuffers_HwProtectUnsupported => 266

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_ResizeBuffers1_D3D12Only
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_ResizeBuffers1_D3D12Only => 267

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_ResizeBuffers1_FlipModel
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_ResizeBuffers1_FlipModel => 268

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_ResizeBuffers1_NodeMaskAndQueueRequired
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_ResizeBuffers1_NodeMaskAndQueueRequired => 269

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_CreateSwapChain_InvalidHwProtectGdiFlag
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_CreateSwapChain_InvalidHwProtectGdiFlag => 270

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidHwProtectGdiFlag
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_ResizeBuffers_InvalidHwProtectGdiFlag => 271

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_10BitFormatNotSupported
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_10BitFormatNotSupported => 272

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_FlipSwapEffectRequired
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_FlipSwapEffectRequired => 273

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidDevice
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_InvalidDevice => 274

    /**
     * Native name: DXGI_MSG_IDXGIOutput_TakeOwnership_Unsupported
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_TakeOwnership_Unsupported => 275

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidQueue
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_InvalidQueue => 276

    /**
     * Native name: DXGI_MSG_IDXGISwapChain3_ResizeBuffers1_InvalidQueue
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain3_ResizeBuffers1_InvalidQueue => 277

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChainForHwnd_InvalidScaling
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChainForHwnd_InvalidScaling => 278

    /**
     * Native name: DXGI_MSG_IDXGISwapChain3_SetHDRMetaData_InvalidSize
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain3_SetHDRMetaData_InvalidSize => 279

    /**
     * Native name: DXGI_MSG_IDXGISwapChain3_SetHDRMetaData_InvalidPointer
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain3_SetHDRMetaData_InvalidPointer => 280

    /**
     * Native name: DXGI_MSG_IDXGISwapChain3_SetHDRMetaData_InvalidType
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain3_SetHDRMetaData_InvalidType => 281

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_FullscreenAllowTearingIsInvalid
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_FullscreenAllowTearingIsInvalid => 282

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_AllowTearingRequiresPresentIntervalZero
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_AllowTearingRequiresPresentIntervalZero => 283

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_AllowTearingRequiresCreationFlag
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_AllowTearingRequiresCreationFlag => 284

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveAllowTearingFlag
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveAllowTearingFlag => 285

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_AllowTearingFlagIsFlipModelOnly
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_AllowTearingFlagIsFlipModelOnly => 286

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CheckFeatureSupport_InvalidFeature
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CheckFeatureSupport_InvalidFeature => 287

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CheckFeatureSupport_InvalidSize
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CheckFeatureSupport_InvalidSize => 288

    /**
     * Native name: DXGI_MSG_IDXGIOutput6_CheckHardwareCompositionSupport_NullPointer
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput6_CheckHardwareCompositionSupport_NullPointer => 289

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_SetFullscreenState_PerMonitorDpiShimApplied
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_SetFullscreenState_PerMonitorDpiShimApplied => 290

    /**
     * Native name: DXGI_MSG_IDXGIOutput_DuplicateOutput_PerMonitorDpiShimApplied
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_DuplicateOutput_PerMonitorDpiShimApplied => 291

    /**
     * Native name: DXGI_MSG_IDXGIOutput_DuplicateOutput1_PerMonitorDpiRequired
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIOutput_DuplicateOutput1_PerMonitorDpiRequired => 292

    /**
     * Native name: DXGI_MSG_IDXGIFactory7_UnregisterAdaptersChangedEvent_CookieNotFound
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory7_UnregisterAdaptersChangedEvent_CookieNotFound => 293

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_LegacyBltModelSwapEffect
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_LegacyBltModelSwapEffect => 294

    /**
     * Native name: DXGI_MSG_IDXGISwapChain4_SetHDRMetaData_MetadataUnchanged
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain4_SetHDRMetaData_MetadataUnchanged => 295

    /**
     * Native name: DXGI_MSG_IDXGISwapChain_Present_11On12_Released_Resource
     * @type {Integer (Int32)}
     */
    static MSG_IDXGISwapChain_Present_11On12_Released_Resource => 296

    /**
     * Native name: DXGI_MSG_IDXGIFactory_CreateSwapChain_MultipleSwapchainRefToSurface_DeferredDtr
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_CreateSwapChain_MultipleSwapchainRefToSurface_DeferredDtr => 297

    /**
     * Native name: DXGI_MSG_IDXGIFactory_MakeWindowAssociation_NoOpBehavior
     * @type {Integer (Int32)}
     */
    static MSG_IDXGIFactory_MakeWindowAssociation_NoOpBehavior => 298

    /**
     * Native name: DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_NotForegroundWindow
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGIFactory_CreateSwapChain_NotForegroundWindow => 1000

    /**
     * Native name: DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_DISCARD_BufferCount
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGIFactory_CreateSwapChain_DISCARD_BufferCount => 1001

    /**
     * Native name: DXGI_MSG_Phone_IDXGISwapChain_SetFullscreenState_NotAvailable
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGISwapChain_SetFullscreenState_NotAvailable => 1002

    /**
     * Native name: DXGI_MSG_Phone_IDXGISwapChain_ResizeBuffers_NotAvailable
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGISwapChain_ResizeBuffers_NotAvailable => 1003

    /**
     * Native name: DXGI_MSG_Phone_IDXGISwapChain_ResizeTarget_NotAvailable
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGISwapChain_ResizeTarget_NotAvailable => 1004

    /**
     * Native name: DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidLayerIndex
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGISwapChain_Present_InvalidLayerIndex => 1005

    /**
     * Native name: DXGI_MSG_Phone_IDXGISwapChain_Present_MultipleLayerIndex
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGISwapChain_Present_MultipleLayerIndex => 1006

    /**
     * Native name: DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidLayerFlag
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGISwapChain_Present_InvalidLayerFlag => 1007

    /**
     * Native name: DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidRotation
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGISwapChain_Present_InvalidRotation => 1008

    /**
     * Native name: DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidBlend
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGISwapChain_Present_InvalidBlend => 1009

    /**
     * Native name: DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidResource
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGISwapChain_Present_InvalidResource => 1010

    /**
     * Native name: DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidMultiPlaneOverlayResource
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGISwapChain_Present_InvalidMultiPlaneOverlayResource => 1011

    /**
     * Native name: DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidIndexForPrimary
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGISwapChain_Present_InvalidIndexForPrimary => 1012

    /**
     * Native name: DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidIndexForOverlay
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGISwapChain_Present_InvalidIndexForOverlay => 1013

    /**
     * Native name: DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidSubResourceIndex
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGISwapChain_Present_InvalidSubResourceIndex => 1014

    /**
     * Native name: DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidSourceRect
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGISwapChain_Present_InvalidSourceRect => 1015

    /**
     * Native name: DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidDestinationRect
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGISwapChain_Present_InvalidDestinationRect => 1016

    /**
     * Native name: DXGI_MSG_Phone_IDXGISwapChain_Present_MultipleResource
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGISwapChain_Present_MultipleResource => 1017

    /**
     * Native name: DXGI_MSG_Phone_IDXGISwapChain_Present_NotSharedResource
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGISwapChain_Present_NotSharedResource => 1018

    /**
     * Native name: DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidFlag
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGISwapChain_Present_InvalidFlag => 1019

    /**
     * Native name: DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidInterval
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGISwapChain_Present_InvalidInterval => 1020

    /**
     * Native name: DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_MSAA_NotSupported
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGIFactory_CreateSwapChain_MSAA_NotSupported => 1021

    /**
     * Native name: DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_ScalingAspectRatioStretch_Supported_ModernApp
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGIFactory_CreateSwapChain_ScalingAspectRatioStretch_Supported_ModernApp => 1022

    /**
     * Native name: DXGI_MSG_Phone_IDXGISwapChain_GetFrameStatistics_NotAvailable_ModernApp
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGISwapChain_GetFrameStatistics_NotAvailable_ModernApp => 1023

    /**
     * Native name: DXGI_MSG_Phone_IDXGISwapChain_Present_ReplaceInterval0With1
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGISwapChain_Present_ReplaceInterval0With1 => 1024

    /**
     * Native name: DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_FailedRegisterWithCompositor
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGIFactory_CreateSwapChain_FailedRegisterWithCompositor => 1025

    /**
     * Native name: DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_NotForegroundWindow_AtRendering
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGIFactory_CreateSwapChain_NotForegroundWindow_AtRendering => 1026

    /**
     * Native name: DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_FLIP_SEQUENTIAL_BufferCount
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGIFactory_CreateSwapChain_FLIP_SEQUENTIAL_BufferCount => 1027

    /**
     * Native name: DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_FLIP_Modern_CoreWindow_Only
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGIFactory_CreateSwapChain_FLIP_Modern_CoreWindow_Only => 1028

    /**
     * Native name: DXGI_MSG_Phone_IDXGISwapChain_Present1_RequiresOverlays
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGISwapChain_Present1_RequiresOverlays => 1029

    /**
     * Native name: DXGI_MSG_Phone_IDXGISwapChain_SetBackgroundColor_FlipSequentialRequired
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGISwapChain_SetBackgroundColor_FlipSequentialRequired => 1030

    /**
     * Native name: DXGI_MSG_Phone_IDXGISwapChain_GetBackgroundColor_FlipSequentialRequired
     * @type {Integer (Int32)}
     */
    static MSG_Phone_IDXGISwapChain_GetBackgroundColor_FlipSequentialRequired => 1031
}
