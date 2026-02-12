#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISecondaryTileVisualElements.ahk
#Include .\ISecondaryTileVisualElements2.ahk
#Include .\ISecondaryTileVisualElements3.ahk
#Include .\ISecondaryTileVisualElements4.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains properties through which you can get or set a secondary tile's background color, foreground text, tile images, and app name display options. The properties in this class replace these SecondaryTile properties: 
  * + [SecondaryTile.BackgroundColor](secondarytile_backgroundcolor.md)
  * + [SecondaryTile.ForegroundText](secondarytile_foregroundtext.md)
  * + [SecondaryTile.Logo](secondarytile_logo.md)
  * + [SecondaryTile.SmallLogo](secondarytile_smalllogo.md)
  * + [SecondaryTile.WideLogo](secondarytile_widelogo.md)
  * + [SecondaryTile.TileOptions](secondarytile_tileoptions.md) (except **CopyOnDeployment**)
 * @remarks
 * This class object is obtained by calling the [SecondaryTile.VisualElements](secondarytile_visualelements.md) property.
 * 
 * A logo image that is saved locally (ms-appdata://localfolder/) by the app to use in a secondary tile should not be deleted by the app. This prevents loss of the image if the cache is cleared.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytilevisualelements
 * @namespace Windows.UI.StartScreen
 * @version WindowsRuntime 1.4
 */
class SecondaryTileVisualElements extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISecondaryTileVisualElements

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISecondaryTileVisualElements.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the square30x30 secondary tile image.
     * 
     * > The Square30x30 tile size is not supported on Windows Phone 8.1.
     * @remarks
     * If this image is not specified, the parent app's 30 x 30 image is used.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytilevisualelements.square30x30logo
     * @type {Uri} 
     */
    Square30x30Logo {
        get => this.get_Square30x30Logo()
        set => this.put_Square30x30Logo(value)
    }

    /**
     * Gets or sets the small secondary tile image.
     * 
     * > The Square70x70 tile size is not supported on Windows Phone 8.1. Instead, call [Square71x71Logo](secondarytilevisualelements_square71x71logo.md).
     * @remarks
     * If this image is not specified, the [Square150x150Logo](secondarytilevisualelements_square150x150logo.md) image is scaled down for use in its place.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytilevisualelements.square70x70logo
     * @type {Uri} 
     */
    Square70x70Logo {
        get => this.get_Square70x70Logo()
        set => this.put_Square70x70Logo(value)
    }

    /**
     * Gets or sets the medium secondary tile image.
     * @remarks
     * This image must be set before you call [SecondaryTile.RequestCreateAsync](secondarytile_requestcreateasync_1444672734.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytilevisualelements.square150x150logo
     * @type {Uri} 
     */
    Square150x150Logo {
        get => this.get_Square150x150Logo()
        set => this.put_Square150x150Logo(value)
    }

    /**
     * Gets or sets the wide secondary tile image.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytilevisualelements.wide310x150logo
     * @type {Uri} 
     */
    Wide310x150Logo {
        get => this.get_Wide310x150Logo()
        set => this.put_Wide310x150Logo(value)
    }

    /**
     * Gets or sets the large secondary tile image.
     * 
     * > The large tile size is not supported on Windows Phone 8.1.
     * @remarks
     * A [wide tile image](secondarytilevisualelements_wide310x150logo.md) must also be set for the large tile option to be presented to the user.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytilevisualelements.square310x310logo
     * @type {Uri} 
     */
    Square310x310Logo {
        get => this.get_Square310x310Logo()
        set => this.put_Square310x310Logo(value)
    }

    /**
     * Specifies whether the tile should use dark or light text.
     * 
     * > This value is ignored on Windows Phone 8.1. The foreground text color of a secondary tile on the phone is always light.
     * @remarks
     * If this property is not specified, it is inherited from the foreground text property of the parent app's tile.
     * 
     * Only two text colors are available— default dark and default light— and are set by Windows. Choose the text color that will look best with your choice of [background color](secondarytile_backgroundcolor.md) and the opacity of your logo image.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytilevisualelements.foregroundtext
     * @type {Integer} 
     */
    ForegroundText {
        get => this.get_ForegroundText()
        set => this.put_ForegroundText(value)
    }

    /**
     * Gets or sets the secondary tile's background color.
     * @remarks
     * If this property is not set, its value is inherited from the background color of the parent app's tile.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytilevisualelements.backgroundcolor
     * @type {Color} 
     */
    BackgroundColor {
        get => this.get_BackgroundColor()
        set => this.put_BackgroundColor(value)
    }

    /**
     * Specifies whether the display name should be shown on the medium secondary tile.
     * 
     * > The display name is never shown on a medium secondary tile on Windows Phone 8.1, so this value is ignored.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytilevisualelements.shownameonsquare150x150logo
     * @type {Boolean} 
     */
    ShowNameOnSquare150x150Logo {
        get => this.get_ShowNameOnSquare150x150Logo()
        set => this.put_ShowNameOnSquare150x150Logo(value)
    }

    /**
     * Specifies whether the display name should be shown on the wide secondary tile.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytilevisualelements.shownameonwide310x150logo
     * @type {Boolean} 
     */
    ShowNameOnWide310x150Logo {
        get => this.get_ShowNameOnWide310x150Logo()
        set => this.put_ShowNameOnWide310x150Logo(value)
    }

    /**
     * Specifies whether the display name should be shown on the large secondary tile.
     * 
     * > The large tile size is not supported on Windows Phone 8.1, so this value is ignored.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytilevisualelements.shownameonsquare310x310logo
     * @type {Boolean} 
     */
    ShowNameOnSquare310x310Logo {
        get => this.get_ShowNameOnSquare310x310Logo()
        set => this.put_ShowNameOnSquare310x310Logo(value)
    }

    /**
     * Gets or sets the small secondary tile image.
     * 
     * > The Square71x71 tile size is not supported on Windows. Instead, call [Square70x70Logo](secondarytilevisualelements_square70x70logo.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytilevisualelements.square71x71logo
     * @type {Uri} 
     */
    Square71x71Logo {
        get => this.get_Square71x71Logo()
        set => this.put_Square71x71Logo(value)
    }

    /**
     * Gets or sets the square44x44 secondary tile image.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytilevisualelements.square44x44logo
     * @type {Uri} 
     */
    Square44x44Logo {
        get => this.get_Square44x44Logo()
        set => this.put_Square44x44Logo(value)
    }

    /**
     * Gets an object representing a 3D model asset for use as an app launcher in the Windows Mixed Reality home environment.
     * @remarks
     * Just like other tile visual elements, a 3D model asset may be specified statically in the app's manifest for primary tiles or may be dynamically updated using [SecondaryTile.UpdateAsync](secondarytile_updateasync_943669007.md) for secondary tiles.
     * 
     * For more information, see [3D app launchers](/windows/mixed-reality/distribute/3d-app-launcher-design-guidance).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytilevisualelements.mixedrealitymodel
     * @type {TileMixedRealityModel} 
     */
    MixedRealityModel {
        get => this.get_MixedRealityModel()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Square30x30Logo(value) {
        if (!this.HasProp("__ISecondaryTileVisualElements")) {
            if ((queryResult := this.QueryInterface(ISecondaryTileVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTileVisualElements := ISecondaryTileVisualElements(outPtr)
        }

        return this.__ISecondaryTileVisualElements.put_Square30x30Logo(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Square30x30Logo() {
        if (!this.HasProp("__ISecondaryTileVisualElements")) {
            if ((queryResult := this.QueryInterface(ISecondaryTileVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTileVisualElements := ISecondaryTileVisualElements(outPtr)
        }

        return this.__ISecondaryTileVisualElements.get_Square30x30Logo()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Square70x70Logo(value) {
        if (!this.HasProp("__ISecondaryTileVisualElements")) {
            if ((queryResult := this.QueryInterface(ISecondaryTileVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTileVisualElements := ISecondaryTileVisualElements(outPtr)
        }

        return this.__ISecondaryTileVisualElements.put_Square70x70Logo(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Square70x70Logo() {
        if (!this.HasProp("__ISecondaryTileVisualElements")) {
            if ((queryResult := this.QueryInterface(ISecondaryTileVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTileVisualElements := ISecondaryTileVisualElements(outPtr)
        }

        return this.__ISecondaryTileVisualElements.get_Square70x70Logo()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Square150x150Logo(value) {
        if (!this.HasProp("__ISecondaryTileVisualElements")) {
            if ((queryResult := this.QueryInterface(ISecondaryTileVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTileVisualElements := ISecondaryTileVisualElements(outPtr)
        }

        return this.__ISecondaryTileVisualElements.put_Square150x150Logo(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Square150x150Logo() {
        if (!this.HasProp("__ISecondaryTileVisualElements")) {
            if ((queryResult := this.QueryInterface(ISecondaryTileVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTileVisualElements := ISecondaryTileVisualElements(outPtr)
        }

        return this.__ISecondaryTileVisualElements.get_Square150x150Logo()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Wide310x150Logo(value) {
        if (!this.HasProp("__ISecondaryTileVisualElements")) {
            if ((queryResult := this.QueryInterface(ISecondaryTileVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTileVisualElements := ISecondaryTileVisualElements(outPtr)
        }

        return this.__ISecondaryTileVisualElements.put_Wide310x150Logo(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Wide310x150Logo() {
        if (!this.HasProp("__ISecondaryTileVisualElements")) {
            if ((queryResult := this.QueryInterface(ISecondaryTileVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTileVisualElements := ISecondaryTileVisualElements(outPtr)
        }

        return this.__ISecondaryTileVisualElements.get_Wide310x150Logo()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Square310x310Logo(value) {
        if (!this.HasProp("__ISecondaryTileVisualElements")) {
            if ((queryResult := this.QueryInterface(ISecondaryTileVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTileVisualElements := ISecondaryTileVisualElements(outPtr)
        }

        return this.__ISecondaryTileVisualElements.put_Square310x310Logo(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Square310x310Logo() {
        if (!this.HasProp("__ISecondaryTileVisualElements")) {
            if ((queryResult := this.QueryInterface(ISecondaryTileVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTileVisualElements := ISecondaryTileVisualElements(outPtr)
        }

        return this.__ISecondaryTileVisualElements.get_Square310x310Logo()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ForegroundText(value) {
        if (!this.HasProp("__ISecondaryTileVisualElements")) {
            if ((queryResult := this.QueryInterface(ISecondaryTileVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTileVisualElements := ISecondaryTileVisualElements(outPtr)
        }

        return this.__ISecondaryTileVisualElements.put_ForegroundText(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ForegroundText() {
        if (!this.HasProp("__ISecondaryTileVisualElements")) {
            if ((queryResult := this.QueryInterface(ISecondaryTileVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTileVisualElements := ISecondaryTileVisualElements(outPtr)
        }

        return this.__ISecondaryTileVisualElements.get_ForegroundText()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_BackgroundColor(value) {
        if (!this.HasProp("__ISecondaryTileVisualElements")) {
            if ((queryResult := this.QueryInterface(ISecondaryTileVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTileVisualElements := ISecondaryTileVisualElements(outPtr)
        }

        return this.__ISecondaryTileVisualElements.put_BackgroundColor(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_BackgroundColor() {
        if (!this.HasProp("__ISecondaryTileVisualElements")) {
            if ((queryResult := this.QueryInterface(ISecondaryTileVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTileVisualElements := ISecondaryTileVisualElements(outPtr)
        }

        return this.__ISecondaryTileVisualElements.get_BackgroundColor()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShowNameOnSquare150x150Logo(value) {
        if (!this.HasProp("__ISecondaryTileVisualElements")) {
            if ((queryResult := this.QueryInterface(ISecondaryTileVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTileVisualElements := ISecondaryTileVisualElements(outPtr)
        }

        return this.__ISecondaryTileVisualElements.put_ShowNameOnSquare150x150Logo(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShowNameOnSquare150x150Logo() {
        if (!this.HasProp("__ISecondaryTileVisualElements")) {
            if ((queryResult := this.QueryInterface(ISecondaryTileVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTileVisualElements := ISecondaryTileVisualElements(outPtr)
        }

        return this.__ISecondaryTileVisualElements.get_ShowNameOnSquare150x150Logo()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShowNameOnWide310x150Logo(value) {
        if (!this.HasProp("__ISecondaryTileVisualElements")) {
            if ((queryResult := this.QueryInterface(ISecondaryTileVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTileVisualElements := ISecondaryTileVisualElements(outPtr)
        }

        return this.__ISecondaryTileVisualElements.put_ShowNameOnWide310x150Logo(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShowNameOnWide310x150Logo() {
        if (!this.HasProp("__ISecondaryTileVisualElements")) {
            if ((queryResult := this.QueryInterface(ISecondaryTileVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTileVisualElements := ISecondaryTileVisualElements(outPtr)
        }

        return this.__ISecondaryTileVisualElements.get_ShowNameOnWide310x150Logo()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShowNameOnSquare310x310Logo(value) {
        if (!this.HasProp("__ISecondaryTileVisualElements")) {
            if ((queryResult := this.QueryInterface(ISecondaryTileVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTileVisualElements := ISecondaryTileVisualElements(outPtr)
        }

        return this.__ISecondaryTileVisualElements.put_ShowNameOnSquare310x310Logo(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShowNameOnSquare310x310Logo() {
        if (!this.HasProp("__ISecondaryTileVisualElements")) {
            if ((queryResult := this.QueryInterface(ISecondaryTileVisualElements.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTileVisualElements := ISecondaryTileVisualElements(outPtr)
        }

        return this.__ISecondaryTileVisualElements.get_ShowNameOnSquare310x310Logo()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Square71x71Logo(value) {
        if (!this.HasProp("__ISecondaryTileVisualElements2")) {
            if ((queryResult := this.QueryInterface(ISecondaryTileVisualElements2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTileVisualElements2 := ISecondaryTileVisualElements2(outPtr)
        }

        return this.__ISecondaryTileVisualElements2.put_Square71x71Logo(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Square71x71Logo() {
        if (!this.HasProp("__ISecondaryTileVisualElements2")) {
            if ((queryResult := this.QueryInterface(ISecondaryTileVisualElements2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTileVisualElements2 := ISecondaryTileVisualElements2(outPtr)
        }

        return this.__ISecondaryTileVisualElements2.get_Square71x71Logo()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Square44x44Logo(value) {
        if (!this.HasProp("__ISecondaryTileVisualElements3")) {
            if ((queryResult := this.QueryInterface(ISecondaryTileVisualElements3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTileVisualElements3 := ISecondaryTileVisualElements3(outPtr)
        }

        return this.__ISecondaryTileVisualElements3.put_Square44x44Logo(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Square44x44Logo() {
        if (!this.HasProp("__ISecondaryTileVisualElements3")) {
            if ((queryResult := this.QueryInterface(ISecondaryTileVisualElements3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTileVisualElements3 := ISecondaryTileVisualElements3(outPtr)
        }

        return this.__ISecondaryTileVisualElements3.get_Square44x44Logo()
    }

    /**
     * 
     * @returns {TileMixedRealityModel} 
     */
    get_MixedRealityModel() {
        if (!this.HasProp("__ISecondaryTileVisualElements4")) {
            if ((queryResult := this.QueryInterface(ISecondaryTileVisualElements4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTileVisualElements4 := ISecondaryTileVisualElements4(outPtr)
        }

        return this.__ISecondaryTileVisualElements4.get_MixedRealityModel()
    }

;@endregion Instance Methods
}
