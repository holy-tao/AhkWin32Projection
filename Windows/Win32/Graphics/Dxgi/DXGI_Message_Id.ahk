#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_Message_Id extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_CreationOrResizeBuffers_InvalidOutputWindow => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_CreationOrResizeBuffers_BufferWidthInferred => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_CreationOrResizeBuffers_BufferHeightInferred => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_CreationOrResizeBuffers_NoScanoutFlagChanged => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Creation_MaxBufferCountExceeded => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Creation_TooFewBuffers => 5

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Creation_NoOutputWindow => 6

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Destruction_OtherMethodsCalled => 7

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_GetDesc_pDescIsNULL => 8

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_GetBuffer_ppSurfaceIsNULL => 9

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_GetBuffer_NoAllocatedBuffers => 10

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_GetBuffer_iBufferMustBeZero => 11

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_GetBuffer_iBufferOOB => 12

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_GetContainingOutput_ppOutputIsNULL => 13

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_SyncIntervalOOB => 14

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_InvalidNonPreRotatedFlag => 15

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_NoAllocatedBuffers => 16

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_GetDXGIAdapterFailed => 17

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_ResizeBuffers_BufferCountOOB => 18

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_ResizeBuffers_UnreleasedReferences => 19

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidSwapChainFlag => 20

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidNonPreRotatedFlag => 21

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_ResizeTarget_RefreshRateDivideByZero => 22

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_SetFullscreenState_InvalidTarget => 23

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_GetFrameStatistics_pStatsIsNULL => 24

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_GetLastPresentCount_pLastPresentCountIsNULL => 25

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_SetFullscreenState_RemoteNotSupported => 26

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_TakeOwnership_FailedToAcquireFullscreenMutex => 27

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSoftwareAdapter_ppAdapterInterfaceIsNULL => 28

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_EnumAdapters_ppAdapterInterfaceIsNULL => 29

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_ppSwapChainIsNULL => 30

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_pDescIsNULL => 31

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_UnknownSwapEffect => 32

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidFlags => 33

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_NonPreRotatedFlagAndWindowed => 34

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_NullDeviceInterface => 35

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_GetWindowAssociation_phWndIsNULL => 36

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_MakeWindowAssociation_InvalidFlags => 37

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISurface_Map_InvalidSurface => 38

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISurface_Map_FlagsSetToZero => 39

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISurface_Map_DiscardAndReadFlagSet => 40

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISurface_Map_DiscardButNotWriteFlagSet => 41

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISurface_Map_NoCPUAccess => 42

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISurface_Map_ReadFlagSetButCPUAccessIsDynamic => 43

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISurface_Map_DiscardFlagSetButCPUAccessIsNotDynamic => 44

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_GetDisplayModeList_pNumModesIsNULL => 45

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_ModeHasInvalidWidthOrHeight => 46

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_GetCammaControlCapabilities_NoOwnerDevice => 47

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_TakeOwnership_pDeviceIsNULL => 48

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_NoOwnerDevice => 49

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_pDestinationIsNULL => 50

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_MapOfDestinationFailed => 51

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_GetFrameStatistics_NoOwnerDevice => 52

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_GetFrameStatistics_pStatsIsNULL => 53

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_SetGammaControl_NoOwnerDevice => 54

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_GetGammaControl_NoOwnerDevice => 55

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_GetGammaControl_NoGammaControls => 56

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_SetDisplaySurface_IDXGIResourceNotSupportedBypPrimary => 57

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_SetDisplaySurface_pPrimaryIsInvalid => 58

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_SetDisplaySurface_NoOwnerDevice => 59

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_TakeOwnership_RemoteDeviceNotSupported => 60

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_GetDisplayModeList_RemoteDeviceNotSupported => 61

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_RemoteDeviceNotSupported => 62

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIDevice_CreateSurface_InvalidParametersWithpSharedResource => 63

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIObject_GetPrivateData_puiDataSizeIsNULL => 64

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Creation_InvalidOutputWindow => 65

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Release_SwapChainIsFullscreen => 66

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_InvalidTargetSurfaceFormat => 67

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSoftwareAdapter_ModuleIsNULL => 68

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_IDXGIDeviceNotSupportedBypConcernedDevice => 69

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_pModeToMatchOrpClosestMatchIsNULL => 70

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_ModeHasRefreshRateDenominatorZero => 71

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_UnknownFormatIsInvalidForConfiguration => 72

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_InvalidDisplayModeScanlineOrdering => 73

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_InvalidDisplayModeScaling => 74

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_InvalidDisplayModeFormatAndDeviceCombination => 75

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_Creation_CalledFromDllMain => 76

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_SetFullscreenState_OutputNotOwnedBySwapChainDevice => 77

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Creation_InvalidWindowStyle => 78

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_GetFrameStatistics_UnsupportedStatistics => 79

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_GetContainingOutput_SwapchainAdapterDoesNotControlOutput => 80

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_SetOrGetGammaControl_pArrayIsNULL => 81

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_SetFullscreenState_FullscreenInvalidForChildWindows => 82

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_Release_CalledFromDllMain => 83

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_UnreleasedHDC => 84

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_ResizeBuffers_NonPreRotatedAndGDICompatibleFlags => 85

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_NonPreRotatedAndGDICompatibleFlags => 86

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISurface1_GetDC_pHdcIsNULL => 87

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISurface1_GetDC_SurfaceNotTexture2D => 88

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISurface1_GetDC_GDICompatibleFlagNotSet => 89

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISurface1_GetDC_UnreleasedHDC => 90

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISurface_Map_NoCPUAccess2 => 91

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISurface1_ReleaseDC_GetDCNotCalled => 92

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISurface1_ReleaseDC_InvalidRectangleDimensions => 93

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_TakeOwnership_RemoteOutputNotSupported => 94

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_RemoteOutputNotSupported => 95

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_GetDisplayModeList_RemoteOutputNotSupported => 96

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_pDeviceHasMismatchedDXGIFactory => 97

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_NonOptimalFSConfiguration => 98

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_FlipSequentialNotSupportedOnD3D10 => 99

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_BufferCountOOBForFlipSequential => 100

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidFormatForFlipSequential => 101

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_MultiSamplingNotSupportedForFlipSequential => 102

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_ResizeBuffers_BufferCountOOBForFlipSequential => 103

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidFormatForFlipSequential => 104

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_PartialPresentationBeforeStandardPresentation => 105

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_FullscreenPartialPresentIsInvalid => 106

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_InvalidPresentTestOrDoNotSequenceFlag => 107

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_ScrollInfoWithNoDirtyRectsSpecified => 108

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_EmptyScrollRect => 109

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_ScrollRectOutOfBackbufferBounds => 110

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_ScrollRectOutOfBackbufferBoundsWithOffset => 111

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_EmptyDirtyRect => 112

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_DirtyRectOutOfBackbufferBounds => 113

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_UnsupportedBufferUsageFlags => 114

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_DoNotSequenceFlagSetButPreviousBufferIsUndefined => 115

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_UnsupportedFlags => 116

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_FlipModelChainMustResizeOrCreateOnFSTransition => 117

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_pRestrictToOutputFromOtherIDXGIFactory => 118

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_RestrictOutputNotSupportedOnAdapter => 119

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_RestrictToOutputFlagSetButInvalidpRestrictToOutput => 120

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_RestrictToOutputFlagdWithFullscreen => 121

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_RestrictOutputFlagWithStaleSwapChain => 122

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_OtherFlagsCausingInvalidPresentTestFlag => 123

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_UnavailableInSession0 => 124

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_MakeWindowAssociation_UnavailableInSession0 => 125

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_GetWindowAssociation_UnavailableInSession0 => 126

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIAdapter_EnumOutputs_UnavailableInSession0 => 127

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_CreationOrSetFullscreenState_StereoDisabled => 128

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory2_UnregisterStatus_CookieNotFound => 129

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_ProtectedContentInWindowedModeWithoutFSOrOverlay => 130

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_ProtectedContentInWindowedModeWithoutFlipSequential => 131

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_ProtectedContentWithRDPDriver => 132

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_ProtectedContentInWindowedModeWithDWMOffOrInvalidDisplayAffinity => 133

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_WidthOrHeightIsZero => 134

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_OnlyFlipSequentialSupported => 135

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_UnsupportedOnAdapter => 136

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_UnsupportedOnWindows7 => 137

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_SetFullscreenState_FSTransitionWithCompositionSwapChain => 138

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_ResizeTarget_InvalidWithCompositionSwapChain => 139

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_ResizeBuffers_WidthOrHeightIsZero => 140

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_ScalingNoneIsFlipModelOnly => 141

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_ScalingUnrecognized => 142

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_DisplayOnlyFullscreenUnsupported => 143

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_DisplayOnlyUnsupported => 144

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_RestartIsFullscreenOnly => 145

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_ProtectedWindowlessPresentationRequiresDisplayOnly => 146

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_SetFullscreenState_DisplayOnlyUnsupported => 147

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain1_SetBackgroundColor_OutOfRange => 148

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_ResizeBuffers_DisplayOnlyFullscreenUnsupported => 149

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_ResizeBuffers_DisplayOnlyUnsupported => 150

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapchain_Present_ScrollUnsupported => 151

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain1_SetRotation_UnsupportedOS => 152

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain1_GetRotation_UnsupportedOS => 153

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapchain_Present_FullscreenRotation => 154

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_PartialPresentationWithMSAABuffers => 155

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain1_SetRotation_FlipSequentialRequired => 156

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain1_SetRotation_InvalidRotation => 157

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain1_GetRotation_FlipSequentialRequired => 158

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_GetHwnd_WrongType => 159

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_GetCompositionSurface_WrongType => 160

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_GetCoreWindow_WrongType => 161

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_GetFullscreenDesc_NonHwnd => 162

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_SetFullscreenState_CoreWindow => 163

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_UnsupportedOnWindows7 => 164

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_pWindowIsNULL => 165

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_FSUnsupportedForModernApps => 166

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_MakeWindowAssociation_ModernApp => 167

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_ResizeTarget_ModernApp => 168

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_ResizeTarget_pNewTargetParametersIsNULL => 169

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_SetDisplaySurface_ModernApp => 170

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_TakeOwnership_ModernApp => 171

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_pWindowIsInvalid => 172

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory2_CreateSwapChainForCompositionSurface_InvalidHandle => 173

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISurface1_GetDC_ModernApp => 174

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_ScalingNoneRequiresWindows8OrNewer => 175

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_TemporaryMonoAndPreferRight => 176

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_TemporaryMonoOrPreferRightWithDoNotSequence => 177

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_TemporaryMonoOrPreferRightWithoutStereo => 178

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_TemporaryMonoUnsupported => 179

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_ArraySizeMismatch => 180

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_PartialPresentationWithSwapEffectDiscard => 181

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_AlphaUnrecognized => 182

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_AlphaIsWindowlessOnly => 183

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_AlphaIsFlipModelOnly => 184

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_RestrictToOutputAdapterMismatch => 185

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_DisplayOnlyOnLegacy => 186

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_ResizeBuffers_DisplayOnlyOnLegacy => 187

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIResource1_CreateSubresourceSurface_InvalidIndex => 188

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_InvalidScaling => 189

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChainForCoreWindow_InvalidSwapEffect => 190

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIResource1_CreateSharedHandle_UnsupportedOS => 191

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory2_RegisterOcclusionStatusWindow_UnsupportedOS => 192

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory2_RegisterOcclusionStatusEvent_UnsupportedOS => 193

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput1_DuplicateOutput_UnsupportedOS => 194

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIDisplayControl_IsStereoEnabled_UnsupportedOS => 195

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_InvalidAlphaMode => 196

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_GetSharedResourceAdapterLuid_InvalidResource => 197

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_GetSharedResourceAdapterLuid_InvalidLUID => 198

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_GetSharedResourceAdapterLuid_UnsupportedOS => 199

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_2DOnly => 200

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_StagingOnly => 201

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_NeedCPUAccessWrite => 202

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_NoShared => 203

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_OnlyMipLevels1 => 204

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_MappedOrOfferedResource => 205

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_SetFullscreenState_FSUnsupportedForModernApps => 206

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_FailedToGoFSButNonPreRotated => 207

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChainOrRegisterOcclusionStatus_BlitModelUsedWhileRegisteredForOcclusionStatusEvents => 208

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_BlitModelUsedWhileRegisteredForOcclusionStatusEvents => 209

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_WaitableSwapChainsAreFlipModelOnly => 210

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_WaitableSwapChainsAreNotFullscreen => 211

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_SetFullscreenState_Waitable => 212

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveWaitableFlag => 213

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_GetFrameLatencyWaitableObject_OnlyWaitable => 214

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_GetMaximumFrameLatency_OnlyWaitable => 215

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_GetMaximumFrameLatency_pMaxLatencyIsNULL => 216

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_SetMaximumFrameLatency_OnlyWaitable => 217

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_SetMaximumFrameLatency_MaxLatencyIsOutOfBounds => 218

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_ForegroundIsCoreWindowOnly => 219

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_ForegroundUnsupportedOnAdapter => 220

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_InvalidScaling => 221

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_InvalidAlphaMode => 222

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveForegroundFlag => 223

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_SetMatrixTransform_MatrixPointerCannotBeNull => 224

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_SetMatrixTransform_RequiresCompositionSwapChain => 225

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_SetMatrixTransform_MatrixMustBeFinite => 226

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_SetMatrixTransform_MatrixMustBeTranslateAndOrScale => 227

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_GetMatrixTransform_MatrixPointerCannotBeNull => 228

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_GetMatrixTransform_RequiresCompositionSwapChain => 229

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_DXGIGetDebugInterface1_NULL_ppDebug => 230

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_DXGIGetDebugInterface1_InvalidFlags => 231

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_Decode => 232

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_ResizeBuffers_Decode => 233

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_SetSourceSize_FlipModel => 234

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_SetSourceSize_Decode => 235

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_SetSourceSize_WidthHeight => 236

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_GetSourceSize_NullPointers => 237

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_GetSourceSize_Decode => 238

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIDecodeSwapChain_SetColorSpace_InvalidFlags => 239

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIDecodeSwapChain_SetSourceRect_InvalidRect => 240

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIDecodeSwapChain_SetTargetRect_InvalidRect => 241

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIDecodeSwapChain_SetDestSize_InvalidSize => 242

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIDecodeSwapChain_GetSourceRect_InvalidPointer => 243

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIDecodeSwapChain_GetTargetRect_InvalidPointer => 244

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIDecodeSwapChain_GetDestSize_InvalidPointer => 245

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_PresentBuffer_YUV => 246

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_SetSourceSize_YUV => 247

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_GetSourceSize_YUV => 248

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_SetMatrixTransform_YUV => 249

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_GetMatrixTransform_YUV => 250

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_PartialPresentation_YUV => 251

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveFlag_YUV => 252

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_ResizeBuffers_Alignment_YUV => 253

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_ShaderInputUnsupported_YUV => 254

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput3_CheckOverlaySupport_NullPointers => 255

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput3_CheckOverlaySupport_IDXGIDeviceNotSupportedBypConcernedDevice => 256

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIAdapter_EnumOutputs2_InvalidEnumOutputs2Flag => 257

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_CreationOrSetFullscreenState_FSUnsupportedForFlipDiscard => 258

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput4_CheckOverlayColorSpaceSupport_NullPointers => 259

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput4_CheckOverlayColorSpaceSupport_IDXGIDeviceNotSupportedBypConcernedDevice => 260

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain3_CheckColorSpaceSupport_NullPointers => 261

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain3_SetColorSpace1_InvalidColorSpace => 262

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidHwProtect => 263

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_HwProtectUnsupported => 264

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidHwProtect => 265

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_ResizeBuffers_HwProtectUnsupported => 266

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_ResizeBuffers1_D3D12Only => 267

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_ResizeBuffers1_FlipModel => 268

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_ResizeBuffers1_NodeMaskAndQueueRequired => 269

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_CreateSwapChain_InvalidHwProtectGdiFlag => 270

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidHwProtectGdiFlag => 271

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_10BitFormatNotSupported => 272

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_FlipSwapEffectRequired => 273

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidDevice => 274

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_TakeOwnership_Unsupported => 275

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidQueue => 276

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain3_ResizeBuffers1_InvalidQueue => 277

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChainForHwnd_InvalidScaling => 278

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain3_SetHDRMetaData_InvalidSize => 279

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain3_SetHDRMetaData_InvalidPointer => 280

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain3_SetHDRMetaData_InvalidType => 281

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_FullscreenAllowTearingIsInvalid => 282

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_AllowTearingRequiresPresentIntervalZero => 283

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_AllowTearingRequiresCreationFlag => 284

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveAllowTearingFlag => 285

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_AllowTearingFlagIsFlipModelOnly => 286

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CheckFeatureSupport_InvalidFeature => 287

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CheckFeatureSupport_InvalidSize => 288

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput6_CheckHardwareCompositionSupport_NullPointer => 289

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_SetFullscreenState_PerMonitorDpiShimApplied => 290

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_DuplicateOutput_PerMonitorDpiShimApplied => 291

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIOutput_DuplicateOutput1_PerMonitorDpiRequired => 292

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory7_UnregisterAdaptersChangedEvent_CookieNotFound => 293

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_LegacyBltModelSwapEffect => 294

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain4_SetHDRMetaData_MetadataUnchanged => 295

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGISwapChain_Present_11On12_Released_Resource => 296

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_CreateSwapChain_MultipleSwapchainRefToSurface_DeferredDtr => 297

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_IDXGIFactory_MakeWindowAssociation_NoOpBehavior => 298

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_NotForegroundWindow => 1000

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_DISCARD_BufferCount => 1001

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGISwapChain_SetFullscreenState_NotAvailable => 1002

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGISwapChain_ResizeBuffers_NotAvailable => 1003

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGISwapChain_ResizeTarget_NotAvailable => 1004

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidLayerIndex => 1005

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGISwapChain_Present_MultipleLayerIndex => 1006

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidLayerFlag => 1007

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidRotation => 1008

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidBlend => 1009

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidResource => 1010

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidMultiPlaneOverlayResource => 1011

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidIndexForPrimary => 1012

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidIndexForOverlay => 1013

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidSubResourceIndex => 1014

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidSourceRect => 1015

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidDestinationRect => 1016

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGISwapChain_Present_MultipleResource => 1017

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGISwapChain_Present_NotSharedResource => 1018

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidFlag => 1019

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidInterval => 1020

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_MSAA_NotSupported => 1021

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_ScalingAspectRatioStretch_Supported_ModernApp => 1022

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGISwapChain_GetFrameStatistics_NotAvailable_ModernApp => 1023

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGISwapChain_Present_ReplaceInterval0With1 => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_FailedRegisterWithCompositor => 1025

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_NotForegroundWindow_AtRendering => 1026

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_FLIP_SEQUENTIAL_BufferCount => 1027

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_FLIP_Modern_CoreWindow_Only => 1028

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGISwapChain_Present1_RequiresOverlays => 1029

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGISwapChain_SetBackgroundColor_FlipSequentialRequired => 1030

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_MSG_Phone_IDXGISwapChain_GetBackgroundColor_FlipSequentialRequired => 1031
}
