#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIsolatedWindowsEnvironmentOptions.ahk
#Include .\IIsolatedWindowsEnvironmentOptions2.ahk
#Include .\IIsolatedWindowsEnvironmentOptions3.ahk
#Include ..\..\..\Guid.ahk

/**
 * **Deprecated.** Runtime class that controls various attributes that are applied to the Isolated Windows Environment during creation.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentoptions
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIsolatedWindowsEnvironmentOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIsolatedWindowsEnvironmentOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * **Deprecated.** String that identifies the owner of each Isolated Windows Environment created.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentoptions.environmentownerid
     * @type {HSTRING} 
     */
    EnvironmentOwnerId {
        get => this.get_EnvironmentOwnerId()
        set => this.put_EnvironmentOwnerId(value)
    }

    /**
     * **Deprecated.** Enum of clipboard formats for Isolated Windows Environment.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentoptions.allowedclipboardformats
     * @type {Integer} 
     */
    AllowedClipboardFormats {
        get => this.get_AllowedClipboardFormats()
        set => this.put_AllowedClipboardFormats(value)
    }

    /**
     * **Deprecated.** Enum of clipboard direction options for Isolated Windows Environment.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentoptions.clipboardcopypastedirections
     * @type {Integer} 
     */
    ClipboardCopyPasteDirections {
        get => this.get_ClipboardCopyPasteDirections()
        set => this.put_ClipboardCopyPasteDirections(value)
    }

    /**
     * **Deprecated.** Enum of printer selections for Isolated Windows Environment.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentoptions.availableprinters
     * @type {Integer} 
     */
    AvailablePrinters {
        get => this.get_AvailablePrinters()
        set => this.put_AvailablePrinters(value)
    }

    /**
     * **Deprecated.** Path of host folder that is shared between the Isolated Windows Environment and the host for sharing of untrusted items set by calling [ShareHostFolderForUntrustedItems](isolatedwindowsenvironmentoptions_sharehostfolderforuntrusteditems_1340872862.md).
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentoptions.sharedhostfolderpath
     * @type {HSTRING} 
     */
    SharedHostFolderPath {
        get => this.get_SharedHostFolderPath()
    }

    /**
     * **Deprecated.** Display name of the folder used to sharing untrusted item inside the Isolated Windows Environment set by calling [ShareHostFolderForUntrustedItems](isolatedwindowsenvironmentoptions_sharehostfolderforuntrusteditems_1340872862.md).
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentoptions.sharedfoldernameinenvironment
     * @type {HSTRING} 
     */
    SharedFolderNameInEnvironment {
        get => this.get_SharedFolderNameInEnvironment()
    }

    /**
     * **Deprecated.** Allows user profile to persist in the Isolated Windows Environment from session to session.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentoptions.persistuserprofile
     * @type {Boolean} 
     */
    PersistUserProfile {
        get => this.get_PersistUserProfile()
        set => this.put_PersistUserProfile(value)
    }

    /**
     * **Deprecated.** Boolean of whether Isolated Windows Environment renders graphics using hardware or software acceleration.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentoptions.allowgraphicshardwareacceleration
     * @type {Boolean} 
     */
    AllowGraphicsHardwareAcceleration {
        get => this.get_AllowGraphicsHardwareAcceleration()
        set => this.put_AllowGraphicsHardwareAcceleration(value)
    }

    /**
     * **Deprecated.** Boolean of whether applications running inside Isolated Windows Environment can access the device’s camera and microphone.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentoptions.allowcameraandmicrophoneaccess
     * @type {Boolean} 
     */
    AllowCameraAndMicrophoneAccess {
        get => this.get_AllowCameraAndMicrophoneAccess()
        set => this.put_AllowCameraAndMicrophoneAccess(value)
    }

    /**
     * **Deprecated.** String that sets the value of the window title annotation to be set for Isolated Windows Environment windows.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * 
     * The WindowAnnotationOverride changes the string value that will be appended to the window title of an Isolated Windows Environment window. By default, this annotation is set to "in Application Guard".
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentoptions.windowannotationoverride
     * @type {HSTRING} 
     */
    WindowAnnotationOverride {
        get => this.get_WindowAnnotationOverride()
        set => this.put_WindowAnnotationOverride(value)
    }

    /**
     * **Deprecated.** Configures the allowed clipboard formats allowed to be copied to the environment.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentoptions.allowedclipboardformatstoenvironment
     * @type {Integer} 
     */
    AllowedClipboardFormatsToEnvironment {
        get => this.get_AllowedClipboardFormatsToEnvironment()
        set => this.put_AllowedClipboardFormatsToEnvironment(value)
    }

    /**
     * **Deprecated.** Configures the allowed clipboard formats allowed to be copied to the host.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentoptions.allowedclipboardformatstohost
     * @type {Integer} 
     */
    AllowedClipboardFormatsToHost {
        get => this.get_AllowedClipboardFormatsToHost()
        set => this.put_AllowedClipboardFormatsToHost(value)
    }

    /**
     * **Deprecated.** Gets or sets the creation priority of the isolated environment. Once the environment is created, the priority cannot be changed with this property. Use [ChangeCreationPriority](isolatedwindowsenvironmentcreateresult_changecreationpriority_106051463.md) to modify the priority of an existing environment.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentoptions.creationpriority
     * @type {Integer} 
     */
    CreationPriority {
        get => this.get_CreationPriority()
        set => this.put_CreationPriority(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * **Deprecated.** Returns of various [IsolatedWindowsEnvironmentOptions](isolatedwindowsenvironmentoptions.md)for the Isolated Windows Environment.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Security.Isolation.IsolatedWindowsEnvironmentOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EnvironmentOwnerId() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOptions")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOptions := IIsolatedWindowsEnvironmentOptions(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOptions.get_EnvironmentOwnerId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_EnvironmentOwnerId(value) {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOptions")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOptions := IIsolatedWindowsEnvironmentOptions(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOptions.put_EnvironmentOwnerId(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AllowedClipboardFormats() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOptions")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOptions := IIsolatedWindowsEnvironmentOptions(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOptions.get_AllowedClipboardFormats()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AllowedClipboardFormats(value) {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOptions")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOptions := IIsolatedWindowsEnvironmentOptions(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOptions.put_AllowedClipboardFormats(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ClipboardCopyPasteDirections() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOptions")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOptions := IIsolatedWindowsEnvironmentOptions(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOptions.get_ClipboardCopyPasteDirections()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ClipboardCopyPasteDirections(value) {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOptions")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOptions := IIsolatedWindowsEnvironmentOptions(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOptions.put_ClipboardCopyPasteDirections(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AvailablePrinters() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOptions")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOptions := IIsolatedWindowsEnvironmentOptions(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOptions.get_AvailablePrinters()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AvailablePrinters(value) {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOptions")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOptions := IIsolatedWindowsEnvironmentOptions(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOptions.put_AvailablePrinters(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SharedHostFolderPath() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOptions")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOptions := IIsolatedWindowsEnvironmentOptions(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOptions.get_SharedHostFolderPath()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SharedFolderNameInEnvironment() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOptions")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOptions := IIsolatedWindowsEnvironmentOptions(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOptions.get_SharedFolderNameInEnvironment()
    }

    /**
     * **Deprecated.** Sets both [SharedFolderNameInEnvironment](isolatedwindowsenvironmentoptions_sharedfoldernameinenvironment.md) and [SharedHostFolderPath](isolatedwindowsenvironmentoptions_sharedhostfolderpath.md) to configure folder to be shared for sharing of untrusted items with the Isolated Windows Environment.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @param {HSTRING} SharedHostFolderPath Path of shared host folder.
     * @param {HSTRING} ShareFolderNameInEnvironment Name of folder in Isolated Windows Environment.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmentoptions.sharehostfolderforuntrusteditems
     */
    ShareHostFolderForUntrustedItems(SharedHostFolderPath, ShareFolderNameInEnvironment) {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOptions")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOptions := IIsolatedWindowsEnvironmentOptions(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOptions.ShareHostFolderForUntrustedItems(SharedHostFolderPath, ShareFolderNameInEnvironment)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PersistUserProfile() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOptions")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOptions := IIsolatedWindowsEnvironmentOptions(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOptions.get_PersistUserProfile()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_PersistUserProfile(value) {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOptions")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOptions := IIsolatedWindowsEnvironmentOptions(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOptions.put_PersistUserProfile(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowGraphicsHardwareAcceleration() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOptions")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOptions := IIsolatedWindowsEnvironmentOptions(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOptions.get_AllowGraphicsHardwareAcceleration()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowGraphicsHardwareAcceleration(value) {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOptions")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOptions := IIsolatedWindowsEnvironmentOptions(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOptions.put_AllowGraphicsHardwareAcceleration(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowCameraAndMicrophoneAccess() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOptions")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOptions := IIsolatedWindowsEnvironmentOptions(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOptions.get_AllowCameraAndMicrophoneAccess()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowCameraAndMicrophoneAccess(value) {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOptions")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOptions := IIsolatedWindowsEnvironmentOptions(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOptions.put_AllowCameraAndMicrophoneAccess(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WindowAnnotationOverride() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOptions2")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOptions2 := IIsolatedWindowsEnvironmentOptions2(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOptions2.get_WindowAnnotationOverride()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_WindowAnnotationOverride(value) {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOptions2")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOptions2 := IIsolatedWindowsEnvironmentOptions2(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOptions2.put_WindowAnnotationOverride(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AllowedClipboardFormatsToEnvironment() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOptions3")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOptions3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOptions3 := IIsolatedWindowsEnvironmentOptions3(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOptions3.get_AllowedClipboardFormatsToEnvironment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AllowedClipboardFormatsToEnvironment(value) {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOptions3")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOptions3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOptions3 := IIsolatedWindowsEnvironmentOptions3(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOptions3.put_AllowedClipboardFormatsToEnvironment(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AllowedClipboardFormatsToHost() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOptions3")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOptions3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOptions3 := IIsolatedWindowsEnvironmentOptions3(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOptions3.get_AllowedClipboardFormatsToHost()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AllowedClipboardFormatsToHost(value) {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOptions3")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOptions3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOptions3 := IIsolatedWindowsEnvironmentOptions3(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOptions3.put_AllowedClipboardFormatsToHost(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CreationPriority() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOptions3")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOptions3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOptions3 := IIsolatedWindowsEnvironmentOptions3(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOptions3.get_CreationPriority()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CreationPriority(value) {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentOptions3")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentOptions3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentOptions3 := IIsolatedWindowsEnvironmentOptions3(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentOptions3.put_CreationPriority(value)
    }

;@endregion Instance Methods
}
