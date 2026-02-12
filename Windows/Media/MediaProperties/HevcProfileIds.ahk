#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHevcProfileIdsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides properties for getting HEVC profile IDs.
 * @remarks
 * You can set the value of [VideoEncodingProperties.ProfileId](videoencodingproperties_profileid.md) to one of the profile ids provided by this class.
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.hevcprofileids
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class HevcProfileIds extends IInspectable {
;@region Static Properties
    /**
     * Gets the ID for the HEVC main profile with 4:2:0 chroma subsampling and bit depth 8.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.hevcprofileids.mainchromasubsampling420bitdepth8
     * @type {Integer} 
     */
    static MainChromaSubsampling420BitDepth8 {
        get => HevcProfileIds.get_MainChromaSubsampling420BitDepth8()
    }

    /**
     * Gets the ID for the HEVC main profile with 4:2:0 chroma subsampling and bit depth 10.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.hevcprofileids.mainchromasubsampling420bitdepth10
     * @type {Integer} 
     */
    static MainChromaSubsampling420BitDepth10 {
        get => HevcProfileIds.get_MainChromaSubsampling420BitDepth10()
    }

    /**
     * Gets the ID for the HEVC main profile with 4:2:0 chroma subsampling and bit depth 12.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.hevcprofileids.mainchromasubsampling420bitdepth12
     * @type {Integer} 
     */
    static MainChromaSubsampling420BitDepth12 {
        get => HevcProfileIds.get_MainChromaSubsampling420BitDepth12()
    }

    /**
     * Gets the ID for the HEVC main profile with 4:2:2 chroma subsampling and bit depth 10.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.hevcprofileids.mainchromasubsampling422bitdepth10
     * @type {Integer} 
     */
    static MainChromaSubsampling422BitDepth10 {
        get => HevcProfileIds.get_MainChromaSubsampling422BitDepth10()
    }

    /**
     * Gets the ID for the HEVC main profile with 4:2:2 chroma subsampling and bit depth 12.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.hevcprofileids.mainchromasubsampling422bitdepth12
     * @type {Integer} 
     */
    static MainChromaSubsampling422BitDepth12 {
        get => HevcProfileIds.get_MainChromaSubsampling422BitDepth12()
    }

    /**
     * Gets the ID for the HEVC main profile with 4:4:4 chroma subsampling and bit depth 8.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.hevcprofileids.mainchromasubsampling444bitdepth8
     * @type {Integer} 
     */
    static MainChromaSubsampling444BitDepth8 {
        get => HevcProfileIds.get_MainChromaSubsampling444BitDepth8()
    }

    /**
     * Gets the ID for the HEVC main profile with 4:4:4 chroma subsampling and bit depth 10.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.hevcprofileids.mainchromasubsampling444bitdepth10
     * @type {Integer} 
     */
    static MainChromaSubsampling444BitDepth10 {
        get => HevcProfileIds.get_MainChromaSubsampling444BitDepth10()
    }

    /**
     * Gets the ID for the HEVC main profile with 4:4:4 chroma subsampling and bit depth 12.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.hevcprofileids.mainchromasubsampling444bitdepth12
     * @type {Integer} 
     */
    static MainChromaSubsampling444BitDepth12 {
        get => HevcProfileIds.get_MainChromaSubsampling444BitDepth12()
    }

    /**
     * Gets the ID for the HEVC monochrome profile with bit depth 12.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.hevcprofileids.monochromebitdepth12
     * @type {Integer} 
     */
    static MonochromeBitDepth12 {
        get => HevcProfileIds.get_MonochromeBitDepth12()
    }

    /**
     * Gets the ID for the HEVC monochrome profile with bit depth 16.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.hevcprofileids.monochromebitdepth16
     * @type {Integer} 
     */
    static MonochromeBitDepth16 {
        get => HevcProfileIds.get_MonochromeBitDepth16()
    }

    /**
     * Gets the ID for the HEVC main intra profile with 4:2:0 chroma subsampling and bit depth 8.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.hevcprofileids.mainintrachromasubsampling420bitdepth8
     * @type {Integer} 
     */
    static MainIntraChromaSubsampling420BitDepth8 {
        get => HevcProfileIds.get_MainIntraChromaSubsampling420BitDepth8()
    }

    /**
     * Gets the ID for the HEVC main intra profile with 4:2:0 chroma subsampling and bit depth 10.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.hevcprofileids.mainintrachromasubsampling420bitdepth10
     * @type {Integer} 
     */
    static MainIntraChromaSubsampling420BitDepth10 {
        get => HevcProfileIds.get_MainIntraChromaSubsampling420BitDepth10()
    }

    /**
     * Gets the ID for the HEVC main intra profile with 4:2:0 chroma subsampling and bit depth 12.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.hevcprofileids.mainintrachromasubsampling420bitdepth12
     * @type {Integer} 
     */
    static MainIntraChromaSubsampling420BitDepth12 {
        get => HevcProfileIds.get_MainIntraChromaSubsampling420BitDepth12()
    }

    /**
     * Gets the ID for the HEVC main intra profile with 4:2:2 chroma subsampling and bit depth 10.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.hevcprofileids.mainintrachromasubsampling422bitdepth10
     * @type {Integer} 
     */
    static MainIntraChromaSubsampling422BitDepth10 {
        get => HevcProfileIds.get_MainIntraChromaSubsampling422BitDepth10()
    }

    /**
     * Gets the ID for the HEVC main intra profile with 4:2:2 chroma subsampling and bit depth 12.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.hevcprofileids.mainintrachromasubsampling422bitdepth12
     * @type {Integer} 
     */
    static MainIntraChromaSubsampling422BitDepth12 {
        get => HevcProfileIds.get_MainIntraChromaSubsampling422BitDepth12()
    }

    /**
     * Gets the ID for the HEVC main intra profile with 4:4:4 chroma subsampling and bit depth 8.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.hevcprofileids.mainintrachromasubsampling444bitdepth8
     * @type {Integer} 
     */
    static MainIntraChromaSubsampling444BitDepth8 {
        get => HevcProfileIds.get_MainIntraChromaSubsampling444BitDepth8()
    }

    /**
     * Gets the ID for the HEVC main intra profile with 4:4:4 chroma subsampling and bit depth 10.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.hevcprofileids.mainintrachromasubsampling444bitdepth10
     * @type {Integer} 
     */
    static MainIntraChromaSubsampling444BitDepth10 {
        get => HevcProfileIds.get_MainIntraChromaSubsampling444BitDepth10()
    }

    /**
     * Gets the ID for the HEVC main intra profile with 4:4:4 chroma subsampling and bit depth 12.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.hevcprofileids.mainintrachromasubsampling444bitdepth12
     * @type {Integer} 
     */
    static MainIntraChromaSubsampling444BitDepth12 {
        get => HevcProfileIds.get_MainIntraChromaSubsampling444BitDepth12()
    }

    /**
     * Gets the ID for the HEVC main intra profile with 4:4:4 chroma subsampling and bit depth 16.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.hevcprofileids.mainintrachromasubsampling444bitdepth16
     * @type {Integer} 
     */
    static MainIntraChromaSubsampling444BitDepth16 {
        get => HevcProfileIds.get_MainIntraChromaSubsampling444BitDepth16()
    }

    /**
     * Gets the ID for the HEVC main still profile with 4:2:0 chroma subsampling and bit depth 8.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.hevcprofileids.mainstillchromasubsampling420bitdepth8
     * @type {Integer} 
     */
    static MainStillChromaSubsampling420BitDepth8 {
        get => HevcProfileIds.get_MainStillChromaSubsampling420BitDepth8()
    }

    /**
     * Gets the ID for the HEVC main still profile with 4:4:4 chroma subsampling and bit depth 8.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.hevcprofileids.mainstillchromasubsampling444bitdepth8
     * @type {Integer} 
     */
    static MainStillChromaSubsampling444BitDepth8 {
        get => HevcProfileIds.get_MainStillChromaSubsampling444BitDepth8()
    }

    /**
     * Gets the ID for the HEVC main still profile with 4:4:4 chroma subsampling and bit depth 16.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.hevcprofileids.mainstillchromasubsampling444bitdepth16
     * @type {Integer} 
     */
    static MainStillChromaSubsampling444BitDepth16 {
        get => HevcProfileIds.get_MainStillChromaSubsampling444BitDepth16()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_MainChromaSubsampling420BitDepth8() {
        if (!HevcProfileIds.HasProp("__IHevcProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.HevcProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHevcProfileIdsStatics.IID)
            HevcProfileIds.__IHevcProfileIdsStatics := IHevcProfileIdsStatics(factoryPtr)
        }

        return HevcProfileIds.__IHevcProfileIdsStatics.get_MainChromaSubsampling420BitDepth8()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MainChromaSubsampling420BitDepth10() {
        if (!HevcProfileIds.HasProp("__IHevcProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.HevcProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHevcProfileIdsStatics.IID)
            HevcProfileIds.__IHevcProfileIdsStatics := IHevcProfileIdsStatics(factoryPtr)
        }

        return HevcProfileIds.__IHevcProfileIdsStatics.get_MainChromaSubsampling420BitDepth10()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MainChromaSubsampling420BitDepth12() {
        if (!HevcProfileIds.HasProp("__IHevcProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.HevcProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHevcProfileIdsStatics.IID)
            HevcProfileIds.__IHevcProfileIdsStatics := IHevcProfileIdsStatics(factoryPtr)
        }

        return HevcProfileIds.__IHevcProfileIdsStatics.get_MainChromaSubsampling420BitDepth12()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MainChromaSubsampling422BitDepth10() {
        if (!HevcProfileIds.HasProp("__IHevcProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.HevcProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHevcProfileIdsStatics.IID)
            HevcProfileIds.__IHevcProfileIdsStatics := IHevcProfileIdsStatics(factoryPtr)
        }

        return HevcProfileIds.__IHevcProfileIdsStatics.get_MainChromaSubsampling422BitDepth10()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MainChromaSubsampling422BitDepth12() {
        if (!HevcProfileIds.HasProp("__IHevcProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.HevcProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHevcProfileIdsStatics.IID)
            HevcProfileIds.__IHevcProfileIdsStatics := IHevcProfileIdsStatics(factoryPtr)
        }

        return HevcProfileIds.__IHevcProfileIdsStatics.get_MainChromaSubsampling422BitDepth12()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MainChromaSubsampling444BitDepth8() {
        if (!HevcProfileIds.HasProp("__IHevcProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.HevcProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHevcProfileIdsStatics.IID)
            HevcProfileIds.__IHevcProfileIdsStatics := IHevcProfileIdsStatics(factoryPtr)
        }

        return HevcProfileIds.__IHevcProfileIdsStatics.get_MainChromaSubsampling444BitDepth8()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MainChromaSubsampling444BitDepth10() {
        if (!HevcProfileIds.HasProp("__IHevcProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.HevcProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHevcProfileIdsStatics.IID)
            HevcProfileIds.__IHevcProfileIdsStatics := IHevcProfileIdsStatics(factoryPtr)
        }

        return HevcProfileIds.__IHevcProfileIdsStatics.get_MainChromaSubsampling444BitDepth10()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MainChromaSubsampling444BitDepth12() {
        if (!HevcProfileIds.HasProp("__IHevcProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.HevcProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHevcProfileIdsStatics.IID)
            HevcProfileIds.__IHevcProfileIdsStatics := IHevcProfileIdsStatics(factoryPtr)
        }

        return HevcProfileIds.__IHevcProfileIdsStatics.get_MainChromaSubsampling444BitDepth12()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MonochromeBitDepth12() {
        if (!HevcProfileIds.HasProp("__IHevcProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.HevcProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHevcProfileIdsStatics.IID)
            HevcProfileIds.__IHevcProfileIdsStatics := IHevcProfileIdsStatics(factoryPtr)
        }

        return HevcProfileIds.__IHevcProfileIdsStatics.get_MonochromeBitDepth12()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MonochromeBitDepth16() {
        if (!HevcProfileIds.HasProp("__IHevcProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.HevcProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHevcProfileIdsStatics.IID)
            HevcProfileIds.__IHevcProfileIdsStatics := IHevcProfileIdsStatics(factoryPtr)
        }

        return HevcProfileIds.__IHevcProfileIdsStatics.get_MonochromeBitDepth16()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MainIntraChromaSubsampling420BitDepth8() {
        if (!HevcProfileIds.HasProp("__IHevcProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.HevcProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHevcProfileIdsStatics.IID)
            HevcProfileIds.__IHevcProfileIdsStatics := IHevcProfileIdsStatics(factoryPtr)
        }

        return HevcProfileIds.__IHevcProfileIdsStatics.get_MainIntraChromaSubsampling420BitDepth8()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MainIntraChromaSubsampling420BitDepth10() {
        if (!HevcProfileIds.HasProp("__IHevcProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.HevcProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHevcProfileIdsStatics.IID)
            HevcProfileIds.__IHevcProfileIdsStatics := IHevcProfileIdsStatics(factoryPtr)
        }

        return HevcProfileIds.__IHevcProfileIdsStatics.get_MainIntraChromaSubsampling420BitDepth10()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MainIntraChromaSubsampling420BitDepth12() {
        if (!HevcProfileIds.HasProp("__IHevcProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.HevcProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHevcProfileIdsStatics.IID)
            HevcProfileIds.__IHevcProfileIdsStatics := IHevcProfileIdsStatics(factoryPtr)
        }

        return HevcProfileIds.__IHevcProfileIdsStatics.get_MainIntraChromaSubsampling420BitDepth12()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MainIntraChromaSubsampling422BitDepth10() {
        if (!HevcProfileIds.HasProp("__IHevcProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.HevcProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHevcProfileIdsStatics.IID)
            HevcProfileIds.__IHevcProfileIdsStatics := IHevcProfileIdsStatics(factoryPtr)
        }

        return HevcProfileIds.__IHevcProfileIdsStatics.get_MainIntraChromaSubsampling422BitDepth10()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MainIntraChromaSubsampling422BitDepth12() {
        if (!HevcProfileIds.HasProp("__IHevcProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.HevcProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHevcProfileIdsStatics.IID)
            HevcProfileIds.__IHevcProfileIdsStatics := IHevcProfileIdsStatics(factoryPtr)
        }

        return HevcProfileIds.__IHevcProfileIdsStatics.get_MainIntraChromaSubsampling422BitDepth12()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MainIntraChromaSubsampling444BitDepth8() {
        if (!HevcProfileIds.HasProp("__IHevcProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.HevcProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHevcProfileIdsStatics.IID)
            HevcProfileIds.__IHevcProfileIdsStatics := IHevcProfileIdsStatics(factoryPtr)
        }

        return HevcProfileIds.__IHevcProfileIdsStatics.get_MainIntraChromaSubsampling444BitDepth8()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MainIntraChromaSubsampling444BitDepth10() {
        if (!HevcProfileIds.HasProp("__IHevcProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.HevcProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHevcProfileIdsStatics.IID)
            HevcProfileIds.__IHevcProfileIdsStatics := IHevcProfileIdsStatics(factoryPtr)
        }

        return HevcProfileIds.__IHevcProfileIdsStatics.get_MainIntraChromaSubsampling444BitDepth10()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MainIntraChromaSubsampling444BitDepth12() {
        if (!HevcProfileIds.HasProp("__IHevcProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.HevcProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHevcProfileIdsStatics.IID)
            HevcProfileIds.__IHevcProfileIdsStatics := IHevcProfileIdsStatics(factoryPtr)
        }

        return HevcProfileIds.__IHevcProfileIdsStatics.get_MainIntraChromaSubsampling444BitDepth12()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MainIntraChromaSubsampling444BitDepth16() {
        if (!HevcProfileIds.HasProp("__IHevcProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.HevcProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHevcProfileIdsStatics.IID)
            HevcProfileIds.__IHevcProfileIdsStatics := IHevcProfileIdsStatics(factoryPtr)
        }

        return HevcProfileIds.__IHevcProfileIdsStatics.get_MainIntraChromaSubsampling444BitDepth16()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MainStillChromaSubsampling420BitDepth8() {
        if (!HevcProfileIds.HasProp("__IHevcProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.HevcProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHevcProfileIdsStatics.IID)
            HevcProfileIds.__IHevcProfileIdsStatics := IHevcProfileIdsStatics(factoryPtr)
        }

        return HevcProfileIds.__IHevcProfileIdsStatics.get_MainStillChromaSubsampling420BitDepth8()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MainStillChromaSubsampling444BitDepth8() {
        if (!HevcProfileIds.HasProp("__IHevcProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.HevcProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHevcProfileIdsStatics.IID)
            HevcProfileIds.__IHevcProfileIdsStatics := IHevcProfileIdsStatics(factoryPtr)
        }

        return HevcProfileIds.__IHevcProfileIdsStatics.get_MainStillChromaSubsampling444BitDepth8()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MainStillChromaSubsampling444BitDepth16() {
        if (!HevcProfileIds.HasProp("__IHevcProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.HevcProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHevcProfileIdsStatics.IID)
            HevcProfileIds.__IHevcProfileIdsStatics := IHevcProfileIdsStatics(factoryPtr)
        }

        return HevcProfileIds.__IHevcProfileIdsStatics.get_MainStillChromaSubsampling444BitDepth16()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
