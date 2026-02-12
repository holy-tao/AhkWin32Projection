#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPreviewBuildsManager.ahk
#Include .\IPreviewBuildsManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Manages the state of preview builds for the device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.update.previewbuildsmanager
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class PreviewBuildsManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPreviewBuildsManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPreviewBuildsManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the default [PreviewBuildsManager](previewbuildsmanager.md) from the device.
     * @remarks
     * To determine if the API is supported on the platform, use [PreviewBuildsManager.IsSupported](previewbuildsmanager_issupported_930300905.md).
     * @returns {PreviewBuildsManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.previewbuildsmanager.getdefault
     */
    static GetDefault() {
        if (!PreviewBuildsManager.HasProp("__IPreviewBuildsManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.PreviewBuildsManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPreviewBuildsManagerStatics.IID)
            PreviewBuildsManager.__IPreviewBuildsManagerStatics := IPreviewBuildsManagerStatics(factoryPtr)
        }

        return PreviewBuildsManager.__IPreviewBuildsManagerStatics.GetDefault()
    }

    /**
     * Determines if this API is supported on the device.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.previewbuildsmanager.issupported
     */
    static IsSupported() {
        if (!PreviewBuildsManager.HasProp("__IPreviewBuildsManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.PreviewBuildsManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPreviewBuildsManagerStatics.IID)
            PreviewBuildsManager.__IPreviewBuildsManagerStatics := IPreviewBuildsManagerStatics(factoryPtr)
        }

        return PreviewBuildsManager.__IPreviewBuildsManagerStatics.IsSupported()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * A boolean value describing whether preview builds are allowed on the device.
     * @remarks
     * The caller can set this property to True. Note that this is updated when the user opts in on the Windows Insider Program Device Portal page.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.previewbuildsmanager.arepreviewbuildsallowed
     * @type {Boolean} 
     */
    ArePreviewBuildsAllowed {
        get => this.get_ArePreviewBuildsAllowed()
        set => this.put_ArePreviewBuildsAllowed(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ArePreviewBuildsAllowed() {
        if (!this.HasProp("__IPreviewBuildsManager")) {
            if ((queryResult := this.QueryInterface(IPreviewBuildsManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPreviewBuildsManager := IPreviewBuildsManager(outPtr)
        }

        return this.__IPreviewBuildsManager.get_ArePreviewBuildsAllowed()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ArePreviewBuildsAllowed(value) {
        if (!this.HasProp("__IPreviewBuildsManager")) {
            if ((queryResult := this.QueryInterface(IPreviewBuildsManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPreviewBuildsManager := IPreviewBuildsManager(outPtr)
        }

        return this.__IPreviewBuildsManager.put_ArePreviewBuildsAllowed(value)
    }

    /**
     * The current state of the [PreviewBuildsState](previewbuildsstate.md) object.
     * @returns {PreviewBuildsState} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.previewbuildsmanager.getcurrentstate
     */
    GetCurrentState() {
        if (!this.HasProp("__IPreviewBuildsManager")) {
            if ((queryResult := this.QueryInterface(IPreviewBuildsManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPreviewBuildsManager := IPreviewBuildsManager(outPtr)
        }

        return this.__IPreviewBuildsManager.GetCurrentState()
    }

    /**
     * Syncs the PreviewBuildsManager with the server to get current information.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.previewbuildsmanager.syncasync
     */
    SyncAsync() {
        if (!this.HasProp("__IPreviewBuildsManager")) {
            if ((queryResult := this.QueryInterface(IPreviewBuildsManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPreviewBuildsManager := IPreviewBuildsManager(outPtr)
        }

        return this.__IPreviewBuildsManager.SyncAsync()
    }

;@endregion Instance Methods
}
