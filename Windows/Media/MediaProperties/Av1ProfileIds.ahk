#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAv1ProfileIdsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides properties for getting AV1 profile IDs.
 * @remarks
 * You can set the value of [VideoEncodingProperties.ProfileId](videoencodingproperties_profileid.md) to one of the profile ids provided by this class.
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.av1profileids
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class Av1ProfileIds extends IInspectable {
;@region Static Properties
    /**
     * Gets the ID for the AV1 main profile with 4:2:0 chroma subsampling and bit depth 8.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.av1profileids.mainchromasubsampling420bitdepth8
     * @type {Integer} 
     */
    static MainChromaSubsampling420BitDepth8 {
        get => Av1ProfileIds.get_MainChromaSubsampling420BitDepth8()
    }

    /**
     * Gets the ID for the AV1 main profile with 4:2:0 chroma subsampling and bit depth 10.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.av1profileids.mainchromasubsampling420bitdepth10
     * @type {Integer} 
     */
    static MainChromaSubsampling420BitDepth10 {
        get => Av1ProfileIds.get_MainChromaSubsampling420BitDepth10()
    }

    /**
     * Gets the ID for the AV1 main profile with 4:0:0 chroma subsampling and bit depth 8.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.av1profileids.mainchromasubsampling400bitdepth8
     * @type {Integer} 
     */
    static MainChromaSubsampling400BitDepth8 {
        get => Av1ProfileIds.get_MainChromaSubsampling400BitDepth8()
    }

    /**
     * Gets the ID for the AV1 main profile with 4:0:0 chroma subsampling and bit depth 10.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.av1profileids.mainchromasubsampling400bitdepth10
     * @type {Integer} 
     */
    static MainChromaSubsampling400BitDepth10 {
        get => Av1ProfileIds.get_MainChromaSubsampling400BitDepth10()
    }

    /**
     * Gets the ID for the AV1 high profile with 4:4:4 chroma subsampling and bit depth 8.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.av1profileids.highchromasubsampling444bitdepth8
     * @type {Integer} 
     */
    static HighChromaSubsampling444BitDepth8 {
        get => Av1ProfileIds.get_HighChromaSubsampling444BitDepth8()
    }

    /**
     * Gets the ID for the AV1 high profile with 4:4:4 chroma subsampling and bit depth 10.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.av1profileids.highchromasubsampling444bitdepth10
     * @type {Integer} 
     */
    static HighChromaSubsampling444BitDepth10 {
        get => Av1ProfileIds.get_HighChromaSubsampling444BitDepth10()
    }

    /**
     * Gets the ID for the AV1 professional profile with 4:2:0 chroma subsampling and bit depth 12.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.av1profileids.professionalchromasubsampling420bitdepth12
     * @type {Integer} 
     */
    static ProfessionalChromaSubsampling420BitDepth12 {
        get => Av1ProfileIds.get_ProfessionalChromaSubsampling420BitDepth12()
    }

    /**
     * Gets the ID for the AV1 professional profile with 4:0:0 chroma subsampling and bit depth 12.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.av1profileids.professionalchromasubsampling400bitdepth12
     * @type {Integer} 
     */
    static ProfessionalChromaSubsampling400BitDepth12 {
        get => Av1ProfileIds.get_ProfessionalChromaSubsampling400BitDepth12()
    }

    /**
     * Gets the ID for the AV1 professional profile with 4:4:4 chroma subsampling and bit depth 12.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.av1profileids.professionalchromasubsampling444bitdepth12
     * @type {Integer} 
     */
    static ProfessionalChromaSubsampling444BitDepth12 {
        get => Av1ProfileIds.get_ProfessionalChromaSubsampling444BitDepth12()
    }

    /**
     * Gets the ID for the AV1 professional profile with 4:2:2 chroma subsampling and bit depth 8.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.av1profileids.professionalchromasubsampling422bitdepth8
     * @type {Integer} 
     */
    static ProfessionalChromaSubsampling422BitDepth8 {
        get => Av1ProfileIds.get_ProfessionalChromaSubsampling422BitDepth8()
    }

    /**
     * Gets the ID for the AV1 professional profile with 4:2:2 chroma subsampling and bit depth 10.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.av1profileids.professionalchromasubsampling422bitdepth10
     * @type {Integer} 
     */
    static ProfessionalChromaSubsampling422BitDepth10 {
        get => Av1ProfileIds.get_ProfessionalChromaSubsampling422BitDepth10()
    }

    /**
     * Gets the ID for the AV1 professional profile with 4:2:2 chroma subsampling and bit depth 12.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.av1profileids.professionalchromasubsampling422bitdepth12
     * @type {Integer} 
     */
    static ProfessionalChromaSubsampling422BitDepth12 {
        get => Av1ProfileIds.get_ProfessionalChromaSubsampling422BitDepth12()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_MainChromaSubsampling420BitDepth8() {
        if (!Av1ProfileIds.HasProp("__IAv1ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.Av1ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAv1ProfileIdsStatics.IID)
            Av1ProfileIds.__IAv1ProfileIdsStatics := IAv1ProfileIdsStatics(factoryPtr)
        }

        return Av1ProfileIds.__IAv1ProfileIdsStatics.get_MainChromaSubsampling420BitDepth8()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MainChromaSubsampling420BitDepth10() {
        if (!Av1ProfileIds.HasProp("__IAv1ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.Av1ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAv1ProfileIdsStatics.IID)
            Av1ProfileIds.__IAv1ProfileIdsStatics := IAv1ProfileIdsStatics(factoryPtr)
        }

        return Av1ProfileIds.__IAv1ProfileIdsStatics.get_MainChromaSubsampling420BitDepth10()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MainChromaSubsampling400BitDepth8() {
        if (!Av1ProfileIds.HasProp("__IAv1ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.Av1ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAv1ProfileIdsStatics.IID)
            Av1ProfileIds.__IAv1ProfileIdsStatics := IAv1ProfileIdsStatics(factoryPtr)
        }

        return Av1ProfileIds.__IAv1ProfileIdsStatics.get_MainChromaSubsampling400BitDepth8()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MainChromaSubsampling400BitDepth10() {
        if (!Av1ProfileIds.HasProp("__IAv1ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.Av1ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAv1ProfileIdsStatics.IID)
            Av1ProfileIds.__IAv1ProfileIdsStatics := IAv1ProfileIdsStatics(factoryPtr)
        }

        return Av1ProfileIds.__IAv1ProfileIdsStatics.get_MainChromaSubsampling400BitDepth10()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_HighChromaSubsampling444BitDepth8() {
        if (!Av1ProfileIds.HasProp("__IAv1ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.Av1ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAv1ProfileIdsStatics.IID)
            Av1ProfileIds.__IAv1ProfileIdsStatics := IAv1ProfileIdsStatics(factoryPtr)
        }

        return Av1ProfileIds.__IAv1ProfileIdsStatics.get_HighChromaSubsampling444BitDepth8()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_HighChromaSubsampling444BitDepth10() {
        if (!Av1ProfileIds.HasProp("__IAv1ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.Av1ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAv1ProfileIdsStatics.IID)
            Av1ProfileIds.__IAv1ProfileIdsStatics := IAv1ProfileIdsStatics(factoryPtr)
        }

        return Av1ProfileIds.__IAv1ProfileIdsStatics.get_HighChromaSubsampling444BitDepth10()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_ProfessionalChromaSubsampling420BitDepth12() {
        if (!Av1ProfileIds.HasProp("__IAv1ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.Av1ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAv1ProfileIdsStatics.IID)
            Av1ProfileIds.__IAv1ProfileIdsStatics := IAv1ProfileIdsStatics(factoryPtr)
        }

        return Av1ProfileIds.__IAv1ProfileIdsStatics.get_ProfessionalChromaSubsampling420BitDepth12()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_ProfessionalChromaSubsampling400BitDepth12() {
        if (!Av1ProfileIds.HasProp("__IAv1ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.Av1ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAv1ProfileIdsStatics.IID)
            Av1ProfileIds.__IAv1ProfileIdsStatics := IAv1ProfileIdsStatics(factoryPtr)
        }

        return Av1ProfileIds.__IAv1ProfileIdsStatics.get_ProfessionalChromaSubsampling400BitDepth12()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_ProfessionalChromaSubsampling444BitDepth12() {
        if (!Av1ProfileIds.HasProp("__IAv1ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.Av1ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAv1ProfileIdsStatics.IID)
            Av1ProfileIds.__IAv1ProfileIdsStatics := IAv1ProfileIdsStatics(factoryPtr)
        }

        return Av1ProfileIds.__IAv1ProfileIdsStatics.get_ProfessionalChromaSubsampling444BitDepth12()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_ProfessionalChromaSubsampling422BitDepth8() {
        if (!Av1ProfileIds.HasProp("__IAv1ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.Av1ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAv1ProfileIdsStatics.IID)
            Av1ProfileIds.__IAv1ProfileIdsStatics := IAv1ProfileIdsStatics(factoryPtr)
        }

        return Av1ProfileIds.__IAv1ProfileIdsStatics.get_ProfessionalChromaSubsampling422BitDepth8()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_ProfessionalChromaSubsampling422BitDepth10() {
        if (!Av1ProfileIds.HasProp("__IAv1ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.Av1ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAv1ProfileIdsStatics.IID)
            Av1ProfileIds.__IAv1ProfileIdsStatics := IAv1ProfileIdsStatics(factoryPtr)
        }

        return Av1ProfileIds.__IAv1ProfileIdsStatics.get_ProfessionalChromaSubsampling422BitDepth10()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_ProfessionalChromaSubsampling422BitDepth12() {
        if (!Av1ProfileIds.HasProp("__IAv1ProfileIdsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaProperties.Av1ProfileIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAv1ProfileIdsStatics.IID)
            Av1ProfileIds.__IAv1ProfileIdsStatics := IAv1ProfileIdsStatics(factoryPtr)
        }

        return Av1ProfileIds.__IAv1ProfileIdsStatics.get_ProfessionalChromaSubsampling422BitDepth12()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
