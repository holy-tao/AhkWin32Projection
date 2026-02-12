#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVoiceCommandContentTile.ahk
#Include ..\..\..\Guid.ahk

/**
 * An asset, containing image, text, and link data, provided by the background app service for display on the **Cortana** canvas.
 * @remarks
 * [MaxSupportedVoiceCommandContentTiles](voicecommandresponse_maxsupportedvoicecommandcontenttiles.md) specifies the maximum number of tiles the background app service can display on the **Cortana** canvas.
 * 
 * The maximum number of tiles that can be displayed depends on the feedback screen being shown. One item when the [VoiceCommandResponse](voicecommandresponse.md) is created for [ReportProgressAsync](voicecommandserviceconnection_reportprogressasync_197749011.md) or [RequestConfirmationAsync](voicecommandserviceconnection_requestconfirmationasync_1656186355.md), and more than one item when the [VoiceCommandResponse](voicecommandresponse.md) is created for [RequestDisambiguationAsync](voicecommandserviceconnection_requestdisambiguationasync_117243970.md).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandcontenttile
 * @namespace Windows.ApplicationModel.VoiceCommands
 * @version WindowsRuntime 1.4
 */
class VoiceCommandContentTile extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVoiceCommandContentTile

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVoiceCommandContentTile.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the title used on the content tile.
     * 
     * Specify the tile layout template with the [ContentTileType](voicecommandcontenttile_contenttiletype.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandcontenttile.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets or sets the first line of text used on the content tile.
     * 
     * Specify the tile layout template with the [ContentTileType](voicecommandcontenttile_contenttiletype.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandcontenttile.textline1
     * @type {HSTRING} 
     */
    TextLine1 {
        get => this.get_TextLine1()
        set => this.put_TextLine1(value)
    }

    /**
     * Gets or sets the second line of text used on the content tile.
     * 
     * Specify the tile layout template with the [ContentTileType](voicecommandcontenttile_contenttiletype.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandcontenttile.textline2
     * @type {HSTRING} 
     */
    TextLine2 {
        get => this.get_TextLine2()
        set => this.put_TextLine2(value)
    }

    /**
     * Gets or sets the third line of text used on the content tile.
     * 
     * Specify the tile layout template with the [ContentTileType](voicecommandcontenttile_contenttiletype.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandcontenttile.textline3
     * @type {HSTRING} 
     */
    TextLine3 {
        get => this.get_TextLine3()
        set => this.put_TextLine3(value)
    }

    /**
     * Gets or sets the image used on the content tile.
     * 
     * Specify the tile layout template with the [ContentTileType](voicecommandcontenttile_contenttiletype.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandcontenttile.image
     * @type {IStorageFile} 
     */
    Image {
        get => this.get_Image()
        set => this.put_Image(value)
    }

    /**
     * Gets or sets supplementary information the background app service can associate with the content tile. This information is not used by **Cortana**.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandcontenttile.appcontext
     * @type {IInspectable} 
     */
    AppContext {
        get => this.get_AppContext()
        set => this.put_AppContext(value)
    }

    /**
     * Gets or sets a string as a launch parameter that can be associated with the response by the background app service.
     * 
     * [AppLaunchArgument](voicecommandresponse_applaunchargument.md) is used to specify the state or context of the foreground app when launched through a deep link in **Cortana**.
     * @remarks
     * To enable deep linking to an app, declare the `windows.personalAssistantLaunch` extension in the Package.appxmanifest file of the app project.
     * 
     * An app is launched to the foreground through Uniform Resource Identifier (URI) activation using a [Protocol](../windows.applicationmodel.activation/activationkind.md) contract. The app must override the [OnActivated](../windows.ui.xaml/application_onactivated_603737819.md) event and check for an [ActivationKind](../windows.applicationmodel.activation/activationkind.md) of [Protocol](../windows.applicationmodel.activation/activationkind.md). See [Handle URI activation](/windows/uwp/launch-resume/handle-uri-activation) for more info.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandcontenttile.applaunchargument
     * @type {HSTRING} 
     */
    AppLaunchArgument {
        get => this.get_AppLaunchArgument()
        set => this.put_AppLaunchArgument(value)
    }

    /**
     * Gets or sets the layout template used for the content tiles on the **Cortana** canvas.
     * 
     * > [!NOTE]
     * > All content tiles on a **Cortana** feedback screen must use the same template.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandcontenttile.contenttiletype
     * @type {Integer} 
     */
    ContentTileType {
        get => this.get_ContentTileType()
        set => this.put_ContentTileType(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of the [VoiceCommandContentTile](voicecommandcontenttile.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.VoiceCommands.VoiceCommandContentTile")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IVoiceCommandContentTile")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandContentTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandContentTile := IVoiceCommandContentTile(outPtr)
        }

        return this.__IVoiceCommandContentTile.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__IVoiceCommandContentTile")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandContentTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandContentTile := IVoiceCommandContentTile(outPtr)
        }

        return this.__IVoiceCommandContentTile.put_Title(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TextLine1() {
        if (!this.HasProp("__IVoiceCommandContentTile")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandContentTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandContentTile := IVoiceCommandContentTile(outPtr)
        }

        return this.__IVoiceCommandContentTile.get_TextLine1()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TextLine1(value) {
        if (!this.HasProp("__IVoiceCommandContentTile")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandContentTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandContentTile := IVoiceCommandContentTile(outPtr)
        }

        return this.__IVoiceCommandContentTile.put_TextLine1(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TextLine2() {
        if (!this.HasProp("__IVoiceCommandContentTile")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandContentTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandContentTile := IVoiceCommandContentTile(outPtr)
        }

        return this.__IVoiceCommandContentTile.get_TextLine2()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TextLine2(value) {
        if (!this.HasProp("__IVoiceCommandContentTile")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandContentTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandContentTile := IVoiceCommandContentTile(outPtr)
        }

        return this.__IVoiceCommandContentTile.put_TextLine2(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TextLine3() {
        if (!this.HasProp("__IVoiceCommandContentTile")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandContentTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandContentTile := IVoiceCommandContentTile(outPtr)
        }

        return this.__IVoiceCommandContentTile.get_TextLine3()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TextLine3(value) {
        if (!this.HasProp("__IVoiceCommandContentTile")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandContentTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandContentTile := IVoiceCommandContentTile(outPtr)
        }

        return this.__IVoiceCommandContentTile.put_TextLine3(value)
    }

    /**
     * 
     * @returns {IStorageFile} 
     */
    get_Image() {
        if (!this.HasProp("__IVoiceCommandContentTile")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandContentTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandContentTile := IVoiceCommandContentTile(outPtr)
        }

        return this.__IVoiceCommandContentTile.get_Image()
    }

    /**
     * 
     * @param {IStorageFile} value 
     * @returns {HRESULT} 
     */
    put_Image(value) {
        if (!this.HasProp("__IVoiceCommandContentTile")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandContentTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandContentTile := IVoiceCommandContentTile(outPtr)
        }

        return this.__IVoiceCommandContentTile.put_Image(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_AppContext() {
        if (!this.HasProp("__IVoiceCommandContentTile")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandContentTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandContentTile := IVoiceCommandContentTile(outPtr)
        }

        return this.__IVoiceCommandContentTile.get_AppContext()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_AppContext(value) {
        if (!this.HasProp("__IVoiceCommandContentTile")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandContentTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandContentTile := IVoiceCommandContentTile(outPtr)
        }

        return this.__IVoiceCommandContentTile.put_AppContext(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppLaunchArgument() {
        if (!this.HasProp("__IVoiceCommandContentTile")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandContentTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandContentTile := IVoiceCommandContentTile(outPtr)
        }

        return this.__IVoiceCommandContentTile.get_AppLaunchArgument()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AppLaunchArgument(value) {
        if (!this.HasProp("__IVoiceCommandContentTile")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandContentTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandContentTile := IVoiceCommandContentTile(outPtr)
        }

        return this.__IVoiceCommandContentTile.put_AppLaunchArgument(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ContentTileType() {
        if (!this.HasProp("__IVoiceCommandContentTile")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandContentTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandContentTile := IVoiceCommandContentTile(outPtr)
        }

        return this.__IVoiceCommandContentTile.get_ContentTileType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ContentTileType(value) {
        if (!this.HasProp("__IVoiceCommandContentTile")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandContentTile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandContentTile := IVoiceCommandContentTile(outPtr)
        }

        return this.__IVoiceCommandContentTile.put_ContentTileType(value)
    }

;@endregion Instance Methods
}
