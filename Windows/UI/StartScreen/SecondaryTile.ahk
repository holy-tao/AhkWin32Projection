#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISecondaryTile.ahk
#Include .\ISecondaryTile2.ahk
#Include .\ISecondaryTileStatics.ahk
#Include .\ISecondaryTileFactory2.ahk
#Include .\ISecondaryTileFactory.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\SecondaryTile.ahk
#Include .\VisualElementsRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Creates, enumerates, and provides information about a secondary tile.
  * 
  * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c) and [Pin secondary tiles from desktop apps](/windows/apps/design/shell/tiles-and-notifications/secondary-tiles-desktop-pinning).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile
 * @namespace Windows.UI.StartScreen
 * @version WindowsRuntime 1.4
 */
class SecondaryTile extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISecondaryTile

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISecondaryTile.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Checks whether a specific secondary tile exists for the calling app.
     * @param {HSTRING} tileId The unique ID string that was assigned to the tile when it was created.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.exists
     */
    static Exists(tileId) {
        if (!SecondaryTile.HasProp("__ISecondaryTileStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.StartScreen.SecondaryTile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISecondaryTileStatics.IID)
            SecondaryTile.__ISecondaryTileStatics := ISecondaryTileStatics(factoryPtr)
        }

        return SecondaryTile.__ISecondaryTileStatics.Exists(tileId)
    }

    /**
     * Retrieves a list of secondary tiles created for another app in the same package as the calling app.
     * @returns {IAsyncOperation<IVectorView<SecondaryTile>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.findallasync
     */
    static FindAllAsync() {
        if (!SecondaryTile.HasProp("__ISecondaryTileStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.StartScreen.SecondaryTile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISecondaryTileStatics.IID)
            SecondaryTile.__ISecondaryTileStatics := ISecondaryTileStatics(factoryPtr)
        }

        return SecondaryTile.__ISecondaryTileStatics.FindAllAsync()
    }

    /**
     * Retrieves a list of secondary tiles created for the calling app.
     * @param {HSTRING} applicationId 
     * @returns {IAsyncOperation<IVectorView<SecondaryTile>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.findallasync
     */
    static FindAllForApplicationAsync(applicationId) {
        if (!SecondaryTile.HasProp("__ISecondaryTileStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.StartScreen.SecondaryTile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISecondaryTileStatics.IID)
            SecondaryTile.__ISecondaryTileStatics := ISecondaryTileStatics(factoryPtr)
        }

        return SecondaryTile.__ISecondaryTileStatics.FindAllForApplicationAsync(applicationId)
    }

    /**
     * Retrieves a list of secondary tiles created for all of the apps in the package of the calling app.
     * 
     * When an app launches, it should always enumerate its secondary tiles through this method, in case there were any additions or deletions of which it was unaware. When a secondary tile is deleted through the Start screen app bar, Windows simply removes the tile. The app itself is responsible for releasing any resources that were used by the secondary tile. When secondary tiles are copied through the cloud, current tile or badge notifications on the secondary tile, scheduled notifications, push notification channels, and Uniform Resource Identifier (URI) used with periodic notifications are not copied with the secondary tile and must be reset up.
     * @remarks
     * This method returns a collection of tile IDs through an instance of the [IAsyncOperation](../windows.foundation/iasyncoperation_1.md) interface. When the asynchronous operation completes successfully, it returns the collection object through a **then** or **done** method.
     * @returns {IAsyncOperation<IVectorView<SecondaryTile>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.findallforpackageasync
     */
    static FindAllForPackageAsync() {
        if (!SecondaryTile.HasProp("__ISecondaryTileStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.StartScreen.SecondaryTile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISecondaryTileStatics.IID)
            SecondaryTile.__ISecondaryTileStatics := ISecondaryTileStatics(factoryPtr)
        }

        return SecondaryTile.__ISecondaryTileStatics.FindAllForPackageAsync()
    }

    /**
     * Creates a [SecondaryTile](secondarytile.md) object that includes all of the mandatory properties required to create a medium tile.
     * 
     * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
     * @param {HSTRING} tileId A string that will uniquely identify the tile within your app's package. Choose a unique ID that is descriptive and meaningful to your app. It is limited to 64 characters and must begin with a number or letter and be composed of the characters a-z, A-Z, 0-9, period (.), or underscore (_). If you provide the same ID as that of an existing secondary tile, the existing secondary tile will be overwritten. Can be set or retrieved through the [TileId](secondarytile_tileid.md) property.
     * @param {HSTRING} displayName A name to be displayed on the tile, in the tile's tooltip, and when showing small tiles, such as on the **Apps** or search results screens. This string is equivalent to the display name given in the manifest for the main tile. It is restricted to 256 characters, but in practice should be kept short to avoid truncation. This value can be set or retrieved through the [DisplayName](secondarytile_displayname.md) property. 
     * 
     * > The display name is shown only on the wide secondary tile on Windows Phone 8.1.
     * @param {HSTRING} arguments An app-defined string meaningful to the calling application. This argument string is passed back to the app when the app is activated from the secondary tile. It will be truncated after 2048 characters. Can be set or retrieved through the [Arguments](secondarytile_arguments.md) property. 
     * 
     * > [!NOTE]
     * > This parameter must be URL-encoded for Windows Phone Silverlight 8.1 apps. All other app types can use their own structure.
     * @param {Uri} square150x150Logo A reference to a medium logo image stored at a Uniform Resource Identifier (URI). Can be set or retrieved through the [SecondaryTileVisualElements.Square150x150Logo](secondarytilevisualelements_square150x150logo.md) property. This value can be expressed using one of these schemes: <termdeflist><termdef><name>ms-appx:///</name>A path within the deployed app package. This path is resolved for languages and DPI plateau supported by the app.</termdef><termdef><name>ms-appdata:///local/</name>A file found in the per-user app storage.</termdef></termdeflist>
     * @param {Integer} desiredSize The size of tile to pin. This value must be **Default** (which provides Windows 8 behavior), **Square150x150**, or **Wide310x150**. Any other [TileSize](tilesize.md) value causes an exception to be thrown during runtime. 
     * 
     * > The *desiredSize* parameter is ignored on Windows Phone 8.1. On the phone, all tiles— including secondary tiles— are pinned as medium tiles, after which they can be resized by the user.
     * @returns {SecondaryTile} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.#ctor
     */
    static CreateMinimalTile(tileId, displayName, arguments, square150x150Logo, desiredSize) {
        if (!SecondaryTile.HasProp("__ISecondaryTileFactory2")) {
            activatableClassId := HSTRING.Create("Windows.UI.StartScreen.SecondaryTile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISecondaryTileFactory2.IID)
            SecondaryTile.__ISecondaryTileFactory2 := ISecondaryTileFactory2(factoryPtr)
        }

        return SecondaryTile.__ISecondaryTileFactory2.CreateMinimalTile(tileId, displayName, arguments, square150x150Logo, desiredSize)
    }

    /**
     * > [!NOTE]
     * > This constructor may be altered or unavailable for releases after Windows 8.1. Instead, use [SecondaryTile.SecondaryTile(String, String, String, Uri, TileSize)](secondarytile_secondarytile_1137028492.md).
     * 
     * Creates a [SecondaryTile](secondarytile.md) object as a medium tile.
     * 
     * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
     * @param {HSTRING} tileId A string that will uniquely identify the tile within your app's package. Choose a unique ID that is descriptive and meaningful to your app. It is limited to 64 characters and must begin with a number or letter and be composed of the characters a-z, A-Z, 0-9, period (.), or underscore (_). If you provide the same ID as that of an existing secondary tile, the existing secondary tile will be overwritten. Can be set or retrieved through the [TileId](secondarytile_tileid.md) property.
     * @param {HSTRING} shortName A short name to display directly on the tile if the app chooses to do so. Anything over 40 characters will be truncated. The user has the option to change this value as part of the pinning process. Can be set or retrieved through the [ShortName](secondarytile_shortname.md) property. 
     * 
     * > [!NOTE]
     * > This value is used only in Windows 8 and is deprecated in favor of the *displayName* in later versions.
     * @param {HSTRING} displayName A name to be displayed on the tile, in the tile's tooltip, and when showing small tiles, such as on the **Apps** or search results screens. This string is equivalent to the display name given in the manifest for the main tile. It is restricted to 256 characters, but in practice should be kept short to avoid truncation. This value can be set or retrieved through the [DisplayName](secondarytile_displayname.md) property. 
     * 
     * > The display name is shown only on the wide secondary tile on Windows Phone 8.1.
     * @param {HSTRING} arguments An app-defined string meaningful to the calling application. This argument string is passed back to the app when the app is activated from the secondary tile. It will be truncated after 2048 characters. Can be set or retrieved through the [Arguments](secondarytile_arguments.md) property.
     * @param {Integer} tileOptions_ A value that specifies various options such as whether the name will be displayed on the secondary tile. Can be set or retrieved through the [TileOptions](secondarytile_tileoptions.md) property.
     * @param {Uri} logoReference A reference to a square logo image stored at a Uniform Resource Identifier (URI). Can be set or retrieved through the [Logo](secondarytile_logo.md) property. This value can be expressed using one of these schemes: <termdeflist><termdef><name>ms-appx:///</name>A path within the deployed app package. This path is resolved for languages and DPI plateau supported by the app.</termdef><termdef><name>ms-appdata:///local/</name>A file found in the per-user app storage.</termdef></termdeflist>
     * @returns {SecondaryTile} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.#ctor
     */
    static CreateTile(tileId, shortName, displayName, arguments, tileOptions_, logoReference) {
        if (!SecondaryTile.HasProp("__ISecondaryTileFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.StartScreen.SecondaryTile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISecondaryTileFactory.IID)
            SecondaryTile.__ISecondaryTileFactory := ISecondaryTileFactory(factoryPtr)
        }

        return SecondaryTile.__ISecondaryTileFactory.CreateTile(tileId, shortName, displayName, arguments, tileOptions_, logoReference)
    }

    /**
     * > [!NOTE]
     * > This constructor may be altered or unavailable for releases after Windows 8.1. Instead, use [SecondaryTile.SecondaryTile(String, String, String, Uri, TileSize)](secondarytile_secondarytile_1137028492.md) and supply other tile sizes and options through [SecondaryTile.VisualElements](secondarytile_visualelements.md) method.
     * 
     * Creates a [SecondaryTile](secondarytile.md) object as a wide tile.
     * 
     * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
     * 
     * > On Windows Phone 8.1, all tiles&mdash;including secondary tiles&mdash;are pinned as medium tiles, after which they can be resized by the user. This constructor provides that option of resizing to a wide tile.
     * @param {HSTRING} tileId A string that will uniquely identify the tile within your app's package. Choose a unique ID that is descriptive and meaningful to your app. It is limited to 64 characters and must begin with a number or letter and be composed of the characters a-z, A-Z, 0-9, period (.), or underscore (_). If you provide the same ID as that of an existing secondary tile, the existing secondary tile will be overwritten. Can be set or retrieved through the [TileId](secondarytile_tileid.md) property.
     * @param {HSTRING} shortName A short name to display directly on the tile if the app chooses to do so. Anything over 40 characters will be truncated. The user has the option to change this value as part of the pinning process. Can be set or retrieved through the [ShortName](secondarytile_shortname.md) property. 
     * 
     * > [!NOTE]
     * > This value is used only in Windows 8 and is deprecated in favor of the *displayName* in later versions.
     * @param {HSTRING} displayName A name to be displayed on the tile, in the tile's tooltip, and when showing small tiles, such as on the **Apps** or search results screens. This string is equivalent to the display name given in the manifest for the main tile. It is restricted to 256 characters, but in practice should be kept short to avoid truncation. This value can be set or retrieved through the [DisplayName](secondarytile_displayname.md) property. 
     * 
     * > The display name is shown only on the wide secondary tile on Windows Phone 8.1.
     * @param {HSTRING} arguments An app-defined string meaningful to the calling application. This argument string is passed back to the app when the app is activated from the secondary tile. It will be truncated after 2048 characters. Can be set or retrieved through the [Arguments](secondarytile_arguments.md) property.
     * @param {Integer} tileOptions_ A value that specifies various options such as whether the name will be displayed on the secondary tile. Can be set or retrieved through the [TileOptions](secondarytile_tileoptions.md) property.
     * @param {Uri} logoReference A reference to a medium logo image stored at a Uniform Resource Identifier (URI). Can be set or retrieved through the [Square150x150Logo](secondarytilevisualelements_square150x150logo.md) property. This value can be expressed using one of these schemes: <termdeflist><termdef><name>ms-appx:///</name>A path within the deployed app package. This path is resolved for languages and DPI plateau supported by the app.</termdef><termdef><name>ms-appdata:///local/</name>A file found in the per-user app storage.</termdef></termdeflist>
     * @param {Uri} wideLogoReference A reference to a wide logo image stored at a Uniform Resource Identifier (URI). Can be set or retrieved through the [WideLogo](secondarytile_widelogo.md) property. This value can be expressed using one of these schemes: <termdeflist><termdef><name>ms-appx:///</name>A path within the deployed app package. This path is resolved for languages and DPI plateau supported by the app.</termdef><termdef><name>ms-appdata:///local/</name>A file found in the per-user app storage.</termdef></termdeflist>
     * @returns {SecondaryTile} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.#ctor
     */
    static CreateWideTile(tileId, shortName, displayName, arguments, tileOptions_, logoReference, wideLogoReference) {
        if (!SecondaryTile.HasProp("__ISecondaryTileFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.StartScreen.SecondaryTile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISecondaryTileFactory.IID)
            SecondaryTile.__ISecondaryTileFactory := ISecondaryTileFactory(factoryPtr)
        }

        return SecondaryTile.__ISecondaryTileFactory.CreateWideTile(tileId, shortName, displayName, arguments, tileOptions_, logoReference, wideLogoReference)
    }

    /**
     * Creates a [SecondaryTile](secondarytile.md) object with a specific ID. This form of the constructor should be used to create a secondary tile object to perform a tile update or deletion.
     * 
     * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
     * @remarks
     * The unique ID that you use to create this tile can be used later update or delete it.
     * 
     * Other mandatory tile properties, such as the display name, must be set through calls to other methods of this class before the tile can be activated.
     * @param {HSTRING} tileId A string that will uniquely identify the tile within your app. Choose a unique ID that is descriptive and meaningful to your app. If you provide the same ID as that of an existing secondary tile, the existing secondary tile will be overwritten.
     * @returns {SecondaryTile} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.#ctor
     */
    static CreateWithId(tileId) {
        if (!SecondaryTile.HasProp("__ISecondaryTileFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.StartScreen.SecondaryTile")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISecondaryTileFactory.IID)
            SecondaryTile.__ISecondaryTileFactory := ISecondaryTileFactory(factoryPtr)
        }

        return SecondaryTile.__ISecondaryTileFactory.CreateWithId(tileId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a unique string to identify the tile within the package. This property is required when you create or delete a tile.
     * @remarks
     * If two secondary tiles have the same ID, the last one to be pinned will overwrite the existing tile.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.tileid
     * @type {HSTRING} 
     */
    TileId {
        get => this.get_TileId()
        set => this.put_TileId(value)
    }

    /**
     * Gets or sets an app-defined set of information that is passed from the secondary tile to the app on activation. This property is required when you create a tile.
     * @remarks
     * When an app is activated through this secondary tile (by click, touch, or keyboard), the tile sends this argument string to the app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.arguments
     * @type {HSTRING} 
     */
    Arguments {
        get => this.get_Arguments()
        set => this.put_Arguments(value)
    }

    /**
     * > [!NOTE]
     * > ShortName may be altered or unavailable for releases after Windows 8.1. Instead, use [SecondaryTile.DisplayName](secondarytile_displayname.md).
     * 
     * Gets or sets a short name to display directly on the tile. 
     * 
     * > [!NOTE]
     * > As of Windows 8.1, this property is ignored and the display name declared in the manifest is used in its place.
     * @remarks
     * This display name is shown on the tile if the [ShowName](tileoptions.md) attribute is set through either the tile constructor or the [tileOptions](secondarytile_tileoptions.md) property.
     * 
     * This display name is visible to searches.
     * 
     * The user has the option to change this value to a string of their own choosing as part of the pinning process.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.shortname
     * @type {HSTRING} 
     */
    ShortName {
        get => this.get_ShortName()
        set => this.put_ShortName(value)
    }

    /**
     * Gets or sets a name that is associated with and displayed on the tile. This name is displayed on the tile in Start, in the tile's tooltip, next to the small tile representation in the **Apps** list, and in some Control Panel applications. This property is required when you create a tile. It is the equivalent of the display name declared in the manifest for the app's main tile. 
     * 
     * > On Windows Phone 8.1, the display name is shown only on the wide secondary tile.
     * @remarks
     * This display name is visible to searches.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * > [!NOTE]
     * > Logo may be altered or unavailable for releases after Windows 8.1. Instead, use [SecondaryTileVisualElements.Square150x150Logo](secondarytilevisualelements_square150x150logo.md).
     * 
     * Gets or sets the logo image used in a medium tile. This property is required when you create either a square or a wide tile.
     * @remarks
     * A logo image that is saved locally (ms-appdata://localfolder/) by the app to use as a secondary tile default image should not be deleted by the app. This prevents loss of the image if the cache is cleared.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.logo
     * @type {Uri} 
     */
    Logo {
        get => this.get_Logo()
        set => this.put_Logo(value)
    }

    /**
     * > [!NOTE]
     * > SmallLogo may be altered or unavailable for releases after Windows 8.1. Instead, use [SecondaryTileVisualElements.Square30x30Logo](secondarytilevisualelements_square30x30logo.md).
     * 
     * Gets or sets the small logo image, used in search results, the All Programs list, and other locations in the UI.
     * 
     * > The small logo is not used with a Windows Phone 8.1 secondary tile.
     * @remarks
     * If this image is not provided, the small logo of this secondary tile's parent app is used.
     * 
     * A logo image that is saved locally (ms-appdata://localfolder/) by the app to use in a secondary tile should not be deleted by the app. This prevents loss of the image if the cache is cleared.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.smalllogo
     * @type {Uri} 
     */
    SmallLogo {
        get => this.get_SmallLogo()
        set => this.put_SmallLogo(value)
    }

    /**
     * > [!NOTE]
     * > WideLogo may be altered or unavailable for releases after Windows 8.1. Instead, use [SecondaryTileVisualElements.Wide310x150Logo](secondarytilevisualelements_wide310x150logo.md).
     * 
     * Gets or sets the logo image used in a wide secondary tile. This property is required when you create a wide secondary tile and gives the user the option of a wide tile when they resize the tile.
     * @remarks
     * A logo image that is saved locally (ms-appdata://localfolder/) by the app to use in a secondary tile should not be deleted by the app. This prevents loss of the image if the cache is cleared.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.widelogo
     * @type {Uri} 
     */
    WideLogo {
        get => this.get_WideLogo()
        set => this.put_WideLogo(value)
    }

    /**
     * Gets or sets the location of a badge logo image to represent the secondary tile on the lock screen. By supplying this image, you declare that the secondary tile is eligible to display a badge on the lock screen. If you also want the secondary tile to be eligible for the lock screen's detailed tile slot, you must also set the [LockScreenDisplayBadgeAndTileText](secondarytile_lockscreendisplaybadgeandtiletext.md) property to **True**.
     * 
     * > [!NOTE]
     * > Stating that your secondary tile is eligible for a lock screen presence does not guarantee that it will have one. Only the user can add an app to one of the seven lock screen slots. For more information, see the [Lock screen overview](/previous-versions/windows/apps/hh779720(v=win.10)).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.lockscreenbadgelogo
     * @type {Uri} 
     */
    LockScreenBadgeLogo {
        get => this.get_LockScreenBadgeLogo()
        set => this.put_LockScreenBadgeLogo(value)
    }

    /**
     * Gets or sets whether the secondary tile is eligible to display both a badge and a detailed tile on the lock screen. If you set this property to **True**, you must also provide a badge image through the [LockScreenBadgeLogo](secondarytile_lockscreenbadgelogo.md) property. If you do not want to use the detailed tile capability, provide a badge image through the [LockScreenBadgeLogo](secondarytile_lockscreenbadgelogo.md) property and set LockScreenDisplayBadgeAndTileText to **False**.
     * 
     * > [!NOTE]
     * > Stating that your secondary tile is eligible for a lock screen presence does not guarantee that it will have one. Only the user can add an app to one of the seven lock screen slots, as well as choosing which one of them can display detailed tile information. For more information, see the [Lock screen overview](/previous-versions/windows/apps/hh779720(v=win.10)).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.lockscreendisplaybadgeandtiletext
     * @type {Boolean} 
     */
    LockScreenDisplayBadgeAndTileText {
        get => this.get_LockScreenDisplayBadgeAndTileText()
        set => this.put_LockScreenDisplayBadgeAndTileText(value)
    }

    /**
     * > [!NOTE]
     * > TileOptions may be altered or unavailable for releases after Windows 8.1. Instead, use [SecondaryTile.VisualElements](secondarytile_visualelements.md).
     * 
     * Gets or sets options available to a secondary tile.
     * @remarks
     * The default value for this property is **None**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.tileoptions
     * @type {Integer} 
     */
    TileOptions {
        get => this.get_TileOptions()
        set => this.put_TileOptions(value)
    }

    /**
     * > [!NOTE]
     * > ForegroundText may be altered or unavailable for releases after Windows 8.1. Instead, use [SecondaryTileVisualElements.ForegroundText](secondarytilevisualelements_foregroundtext.md).
     * 
     * Gets or sets whether the tile should use dark or light text.
     * @remarks
     * > This property is ignored on Windows Phone 8.1.
     * 
     * If this property is not specified, it is inherited from the foreground text property of the parent app's tile.
     * 
     * Only two text colors are available— default dark and default light— and are set by Windows. Choose the text color that will look best with your choice of [background color](secondarytile_backgroundcolor.md) and the opacity of your logo image.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.foregroundtext
     * @type {Integer} 
     */
    ForegroundText {
        get => this.get_ForegroundText()
        set => this.put_ForegroundText(value)
    }

    /**
     * > [!NOTE]
     * > BackgroundColor may be altered or unavailable for releases after Windows 8.1. Instead, use [SecondaryTileVisualElements.BackgroundColor](secondarytilevisualelements_backgroundcolor.md).
     * 
     * Gets or sets the tile's background color.
     * @remarks
     * If this property is not set, its value is inherited from the background color of the parent app's tile.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.backgroundcolor
     * @type {Color} 
     */
    BackgroundColor {
        get => this.get_BackgroundColor()
        set => this.put_BackgroundColor(value)
    }

    /**
     * Gets or sets a phonetic version of the secondary tile name. Used with character-based languages for UI sorting purposes.
     * @remarks
     * In certain character-based languages such as Japanese, the sort order in the UI is based on a phonetic spelling of the characters that make up the app's display name. This phonetic spelling is a separate string from the display name. When a user pins a secondary tile, they can specify a display name for that tile in the pinning flyout but they cannot specify a phonetic spelling. Windows makes a guess as to the phonetic string, but it is not always right.
     * 
     * Apps, however, sometimes know the right phonetic string because the app lets a user define it. In Windows 8.1, an app can then use that information to set this property. Note that this string is tied to the default display name associated with the secondary tile. If the user changes the display name through the pinning flyout, then the system's guess for the phonetic spelling will be used instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.phoneticname
     * @type {HSTRING} 
     */
    PhoneticName {
        get => this.get_PhoneticName()
        set => this.put_PhoneticName(value)
    }

    /**
     * Gets an object through which you can get or set a secondary tile's background color, foreground text, tile images, and app name display options. As of Windows 8.1, the properties of this object replace these SecondaryTile properties: 
     * + [SecondaryTile.BackgroundColor](secondarytile_backgroundcolor.md)
     * + [SecondaryTile.ForegroundText](secondarytile_foregroundtext.md)
     * + [SecondaryTile.Logo](secondarytile_logo.md)
     * + [SecondaryTile.SmallLogo](secondarytile_smalllogo.md)
     * + [SecondaryTile.WideLogo](secondarytile_widelogo.md)
     * + [SecondaryTile.TileOptions](secondarytile_tileoptions.md) (except **CopyOnDeployment**)
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.visualelements
     * @type {SecondaryTileVisualElements} 
     */
    VisualElements {
        get => this.get_VisualElements()
    }

    /**
     * Gets or sets a value that determines whether the secondary tile will be reacquired through the cloud when the parent app is installed by the user, using their Microsoft account, on another computer. Note that as of Windows 8.1, roaming is the default behavior. This is the opposite of the default Windows 8 behavior, where roaming was opt-in.
     * 
     * > This property always returns **false** on Windows Phone 8.1.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.roamingenabled
     * @type {Boolean} 
     */
    RoamingEnabled {
        get => this.get_RoamingEnabled()
        set => this.put_RoamingEnabled(value)
    }

    /**
     * Fired when a call is made to [RequestCreateAsync](/uwp/api/windows.ui.startscreen.secondarytile.requestcreateasync).
     * 
     * 
     * 
     * > This event is not raised on Windows Phone 8.1.
     * @remarks
     * > This event is not raised for Windows Phone 8.x app.
     * @type {TypedEventHandler<SecondaryTile, VisualElementsRequestedEventArgs>}
    */
    OnVisualElementsRequested {
        get {
            if(!this.HasProp("__OnVisualElementsRequested")){
                this.__OnVisualElementsRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{02d9f968-fa76-5d77-934b-665e7c3be7cf}"),
                    SecondaryTile,
                    VisualElementsRequestedEventArgs
                )
                this.__OnVisualElementsRequestedToken := this.add_VisualElementsRequested(this.__OnVisualElementsRequested.iface)
            }
            return this.__OnVisualElementsRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a [SecondaryTile](secondarytile.md) object. The caller must then set any mandatory properties through the object before attempting to pin, update, or delete the tile.
     * 
     * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
     * @remarks
     * Mandatory tile properties, such as the display name, must be set through calls to other methods of this class before the tile can be activated.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.StartScreen.SecondaryTile")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnVisualElementsRequestedToken")) {
            this.remove_VisualElementsRequested(this.__OnVisualElementsRequestedToken)
            this.__OnVisualElementsRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TileId(value) {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.put_TileId(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TileId() {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.get_TileId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Arguments(value) {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.put_Arguments(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Arguments() {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.get_Arguments()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ShortName(value) {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.put_ShortName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ShortName() {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.get_ShortName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayName(value) {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.put_DisplayName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.get_DisplayName()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Logo(value) {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.put_Logo(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Logo() {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.get_Logo()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_SmallLogo(value) {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.put_SmallLogo(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_SmallLogo() {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.get_SmallLogo()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_WideLogo(value) {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.put_WideLogo(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_WideLogo() {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.get_WideLogo()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_LockScreenBadgeLogo(value) {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.put_LockScreenBadgeLogo(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_LockScreenBadgeLogo() {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.get_LockScreenBadgeLogo()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_LockScreenDisplayBadgeAndTileText(value) {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.put_LockScreenDisplayBadgeAndTileText(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_LockScreenDisplayBadgeAndTileText() {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.get_LockScreenDisplayBadgeAndTileText()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TileOptions(value) {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.put_TileOptions(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TileOptions() {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.get_TileOptions()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ForegroundText(value) {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.put_ForegroundText(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ForegroundText() {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.get_ForegroundText()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_BackgroundColor(value) {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.put_BackgroundColor(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_BackgroundColor() {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.get_BackgroundColor()
    }

    /**
     * Displays the **Pin to Start**  flyout above a specified location, through which the user can confirm that they want to create the secondary tile, which in turn creates the tile.
     * 
     * > On Windows Phone 8.1, the secondary tile is created through this call without showing the user a flyout, prompting them for confirmation, or allowing them to choose a tile size or title text. Note that when using the [RequestCreateAsync](secondarytile_requestcreateasync_1444672734.md) method to pin a secondary tile in Windows Phone 8.x app, the app is suspended and the user is taken to the Start screen. This same API call on a PC does not suspend the program. Therefore, be aware that any code called after [RequestCreateAsync](secondarytile_requestcreateasync_1444672734.md) is not guaranteed to be run before the app is suspended. To avoid this potential issue you should use the OnSuspended event of your app to run any code, such as updating the pinned tile, that should be run before the app suspends. To see an example of this pattern, download and run the [Tile update on suspend sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Windows%20Phone%208.1%20samples/%5BC%23%5D-Windows%20Phone%208.1%20samples/Updating%20a%20pinned%20secondary%20tile%20on%20Suspend/C%23).
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.requestcreateasync
     */
    RequestCreateAsync() {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.RequestCreateAsync()
    }

    /**
     * Displays the **Pin to Start**  flyout, through which the user can confirm that they want to create the secondary tile, which in turn creates the tile. Overloads of this method let you specify the on-screen location of the flyout.
     * 
     * > [!NOTE]
     * > It is a best practice to display the **Pin to Start**  flyout near the button that invoked the request to create the tile. Therefore, we recommend that you use the [RequestCreateAsync(Point)](secondarytile_requestcreateasync_318145127.md) form of this method overload.
     * 
     * > On Windows Phone 8.1, the secondary tile is created through this call without showing the user a flyout, prompting them for confirmation, or allowing them to choose a tile size or title text. Note that when using the RequestCreateAsync method to pin a secondary tile in Windows Phone 8.x app, the app is suspended and the user is taken to the Start screen. This same API call on a PC does not suspend the program. Therefore, be aware that any code called after RequestCreateAsync is not guaranteed to be run before the app is suspended. To avoid this potential issue you should use the OnSuspended event of your app to run any code, such as updating the pinned tile, that should be run before the app suspends. To see an example of this pattern, download and run the [Tile update on suspend sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Windows%20Phone%208.1%20samples/%5BC%23%5D-Windows%20Phone%208.1%20samples/Updating%20a%20pinned%20secondary%20tile%20on%20Suspend/C%23).
     * @remarks
     * After a secondary tile is created, you must provide the following properties before it is displayed: 
     * + [tileId](secondarytile_tileid.md)
     * + [displayName](secondarytile_displayname.md)
     * + [arguments](secondarytile_arguments.md)
     * + [SecondaryTileVisualElements.Square150x150Logo](secondarytilevisualelements_square150x150logo.md)
     * 
     * 
     * This method returns an asynchronous **Boolean** value through its [IAsyncOperation](../windows.foundation/iasyncoperation_1.md) object as shown here. A value of **true** indicates that the secondary tile was created and pinned to the Start screen.
     *   
     * ```csharp
     * async void showTileCreateRequest( SecondaryTile tile )  
     * {
     *     bool isPinned = await tile.requestCreateAsync();  
     * }
     * ```
     * @param {POINT} invocationPoint 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.requestcreateasync
     */
    RequestCreateAsyncWithPoint(invocationPoint) {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.RequestCreateAsyncWithPoint(invocationPoint)
    }

    /**
     * Displays the **Pin to Start**  flyout at the specified side of a specified area. This flyout is used by the user to confirm that they want to create the secondary tile, which in turn creates the tile.
     * 
     * > On Windows Phone 8.1, the secondary tile is created through this call without showing the user a flyout, prompting them for confirmation, or allowing them to choose a tile size or title text. Note that when using the [RequestCreateAsync](secondarytile_requestcreateasync_1444672734.md) method to pin a secondary tile in Windows Phone 8.x app, the app is suspended and the user is taken to the Start screen. This same API call on a PC does not suspend the program. Therefore, be aware that any code called after [RequestCreateAsync](secondarytile_requestcreateasync_1444672734.md) is not guaranteed to be run before the app is suspended. To avoid this potential issue you should use the OnSuspended event of your app to run any code, such as updating the pinned tile, that should be run before the app suspends. To see an example of this pattern, download and run the [Tile update on suspend sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Windows%20Phone%208.1%20samples/%5BC%23%5D-Windows%20Phone%208.1%20samples/Updating%20a%20pinned%20secondary%20tile%20on%20Suspend/C%23).
     * @param {RECT} selection The area to one side of which the flyout will be displayed.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.requestcreateforselectionasync
     */
    RequestCreateAsyncWithRect(selection) {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.RequestCreateAsyncWithRect(selection)
    }

    /**
     * Displays the **Pin to Start**  flyout above a specified area. This flyout is used by the user to confirm that they want to create the secondary tile, which in turn creates the tile.
     * 
     * > On Windows Phone 8.1, the secondary tile is created through this call without showing the user a flyout, prompting them for confirmation, or allowing them to choose a tile size or title text. Note that when using the [RequestCreateAsync](secondarytile_requestcreateasync_1444672734.md) method to pin a secondary tile in Windows Phone 8.x app, the app is suspended and the user is taken to the Start screen. This same API call on a PC does not suspend the program. Therefore, be aware that any code called after [RequestCreateAsync](secondarytile_requestcreateasync_1444672734.md) is not guaranteed to be run before the app is suspended. To avoid this potential issue you should use the OnSuspended event of your app to run any code, such as updating the pinned tile, that should be run before the app suspends. To see an example of this pattern, download and run the [Tile update on suspend sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Windows%20Phone%208.1%20samples/%5BC%23%5D-Windows%20Phone%208.1%20samples/Updating%20a%20pinned%20secondary%20tile%20on%20Suspend/C%23).
     * @remarks
     * After a secondary tile is created, you must provide the following properties before it is displayed: 
     * + [tileId](secondarytile_tileid.md)
     * + [displayName](secondarytile_displayname.md)
     * + [arguments](secondarytile_arguments.md)
     * + [SecondaryTileVisualElements.Square150x150Logo](secondarytilevisualelements_square150x150logo.md)
     * @param {RECT} selection The area that the flyout is displayed directly above.
     * @param {Integer} preferredPlacement 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.requestcreateforselectionasync
     */
    RequestCreateAsyncWithRectAndPlacement(selection, preferredPlacement) {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.RequestCreateAsyncWithRectAndPlacement(selection, preferredPlacement)
    }

    /**
     * Displays the **Unpin from Start** flyout at a specified point. This flyout lets the user confirm removal of the secondary tile.
     * @remarks
     * The only property that must be set on the tile before calling this method is [TileId](secondarytile_tileid.md). If [TileId](secondarytile_tileid.md) is not set, the call to this method raises an exception.
     * 
     * This method returns an asynchronous Boolean value through its [IAsyncOperation.GetResults](../windows.foundation/iasyncoperation_1.md) method as shown here.
     * 
     * ```csharp
     * void async showTileCreateRequest( SecondaryTile tile, Point pt)  
     * {
     *     bool isDeleted = await tile.requestCreateAsync( pt );  
     * }
     * ```
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.requestdeleteasync
     */
    RequestDeleteAsync() {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.RequestDeleteAsync()
    }

    /**
     * Displays the **Unpin from Start** flyout. This flyout lets the user confirm removal of the secondary tile.
     * @param {POINT} invocationPoint 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.requestdeleteasync
     */
    RequestDeleteAsyncWithPoint(invocationPoint) {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.RequestDeleteAsyncWithPoint(invocationPoint)
    }

    /**
     * Displays the **Unpin from Start**  flyout at the specified side of a specified area. This flyout lets the user confirm removal of the secondary tile.
     * @param {RECT} selection The area to the side of which the flyout will be displayed.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.requestdeleteforselectionasync
     */
    RequestDeleteAsyncWithRect(selection) {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.RequestDeleteAsyncWithRect(selection)
    }

    /**
     * Displays the **Unpin from Start**  flyout above a specified area. This flyout lets the user confirm removal of the secondary tile.
     * @remarks
     * The only property that must be set on the tile before calling this method is [tileId](secondarytile_tileid.md). If [tileId](secondarytile_tileid.md) is not set, the call to this method raises an exception.
     * @param {RECT} selection The area that the secondary tile is displayed directly above.
     * @param {Integer} preferredPlacement 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.requestdeleteforselectionasync
     */
    RequestDeleteAsyncWithRectAndPlacement(selection, preferredPlacement) {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.RequestDeleteAsyncWithRectAndPlacement(selection, preferredPlacement)
    }

    /**
     * Updates a secondary tile after that tile is pinned to the Start screen.
     * 
     * > On Windows Phone 8.1, your app is suspended and the user is taken to the Start screen when a secondary tile is pinned. Therefore, be aware that any code called after [RequestCreateAsync](secondarytile_requestcreateasync_1444672734.md) is not guaranteed to be run before the app is suspended. To avoid this potential issue you should use the OnSuspended event of your app to run any code, such as updating the pinned tile, that should be run before the app suspends. To see an example of this pattern, download and run the [Tile update on suspend sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Windows%20Phone%208.1%20samples/%5BC%23%5D-Windows%20Phone%208.1%20samples/Updating%20a%20pinned%20secondary%20tile%20on%20Suspend/C%23).
     * @remarks
     * This method updates the following properties of the secondary tile:
     * 
     * 
     * + [DisplayName](secondarytile_displayname.md)
     * + [SecondaryTile.Arguments](secondarytile_arguments.md)
     * + [SecondaryTile.LockScreenBadgeLogo](secondarytile_lockscreenbadgelogo.md)
     * + [SecondaryTile.LockScreenDisplayBadgeAndTileText](secondarytile_lockscreendisplaybadgeandtiletext.md)
     * + [SecondaryTile.RoamingEnabled](secondarytile_roamingenabled.md)
     * + [SecondaryTileVisualElements.BackgroundColor](secondarytilevisualelements_backgroundcolor.md)
     * + [SecondaryTileVisualElements.ForegroundText](secondarytilevisualelements_foregroundtext.md)
     * + [SecondaryTileVisualElements.ShowNameOnSquare150x150Logo](secondarytilevisualelements_shownameonsquare150x150logo.md)
     * + [SecondaryTileVisualElements.ShowNameOnSquare310x310Logo](secondarytilevisualelements_shownameonsquare310x310logo.md)
     * + [SecondaryTileVisualElements.ShowNameOnWide310x150Logo](secondarytilevisualelements_shownameonwide310x150logo.md)
     * + [SecondaryTileVisualElements.Square30x30Logo](secondarytilevisualelements_square30x30logo.md)
     * + [SecondaryTileVisualElements.Square70x70Logo](secondarytilevisualelements_square70x70logo.md)
     * + [SecondaryTileVisualElements.Square150x150Logo](secondarytilevisualelements_square150x150logo.md)
     * + [SecondaryTileVisualElements.Square310x310Logo](secondarytilevisualelements_square310x310logo.md)
     * + [SecondaryTileVisualElements.Wide310x150Logo](secondarytilevisualelements_wide310x150logo.md)
     * + [TileId](secondarytile_tileid.md)
     * 
     * 
     * On Windows 8 and Windows 8.1, this method doesn't update these properties:
     * 
     * 
     * + [DisplayName](secondarytile_displayname.md)
     * + [SecondaryTileVisualElements.Square30x30Logo](secondarytilevisualelements_square30x30logo.md)
     * + [TileId](secondarytile_tileid.md)
     * 
     * 
     * If the [TileId](secondarytile_tileid.md) property is not set before you call this method, the call will raise an exception.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile.updateasync
     */
    UpdateAsync() {
        if (!this.HasProp("__ISecondaryTile")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile := ISecondaryTile(outPtr)
        }

        return this.__ISecondaryTile.UpdateAsync()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PhoneticName(value) {
        if (!this.HasProp("__ISecondaryTile2")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile2 := ISecondaryTile2(outPtr)
        }

        return this.__ISecondaryTile2.put_PhoneticName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PhoneticName() {
        if (!this.HasProp("__ISecondaryTile2")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile2 := ISecondaryTile2(outPtr)
        }

        return this.__ISecondaryTile2.get_PhoneticName()
    }

    /**
     * 
     * @returns {SecondaryTileVisualElements} 
     */
    get_VisualElements() {
        if (!this.HasProp("__ISecondaryTile2")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile2 := ISecondaryTile2(outPtr)
        }

        return this.__ISecondaryTile2.get_VisualElements()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RoamingEnabled(value) {
        if (!this.HasProp("__ISecondaryTile2")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile2 := ISecondaryTile2(outPtr)
        }

        return this.__ISecondaryTile2.put_RoamingEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RoamingEnabled() {
        if (!this.HasProp("__ISecondaryTile2")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile2 := ISecondaryTile2(outPtr)
        }

        return this.__ISecondaryTile2.get_RoamingEnabled()
    }

    /**
     * 
     * @param {TypedEventHandler<SecondaryTile, VisualElementsRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VisualElementsRequested(handler) {
        if (!this.HasProp("__ISecondaryTile2")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile2 := ISecondaryTile2(outPtr)
        }

        return this.__ISecondaryTile2.add_VisualElementsRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VisualElementsRequested(token) {
        if (!this.HasProp("__ISecondaryTile2")) {
            if ((queryResult := this.QueryInterface(ISecondaryTile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryTile2 := ISecondaryTile2(outPtr)
        }

        return this.__ISecondaryTile2.remove_VisualElementsRequested(token)
    }

;@endregion Instance Methods
}
