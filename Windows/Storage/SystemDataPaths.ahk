#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemDataPaths.ahk
#Include .\ISystemDataPathsStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Gets some commonly used system wide folder locations based on the [KNOWNFOLDERID](/windows/desktop/shell/knownfolderid) naming pattern.
 * @remarks
 * This class contains methods and properties that return paths consistent with those that a Desktop app would use.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.systemdatapaths
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class SystemDataPaths extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemDataPaths

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemDataPaths.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the paths to various system data folders.
     * @returns {SystemDataPaths} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemdatapaths.getdefault
     */
    static GetDefault() {
        if (!SystemDataPaths.HasProp("__ISystemDataPathsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.SystemDataPaths")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemDataPathsStatics.IID)
            SystemDataPaths.__ISystemDataPathsStatics := ISystemDataPathsStatics(factoryPtr)
        }

        return SystemDataPaths.__ISystemDataPathsStatics.GetDefault()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the path to the fonts folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemdatapaths.fonts
     * @type {HSTRING} 
     */
    Fonts {
        get => this.get_Fonts()
    }

    /**
     * Gets the path to the ProgramData folder on the machine.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemdatapaths.programdata
     * @type {HSTRING} 
     */
    ProgramData {
        get => this.get_ProgramData()
    }

    /**
     * Gets the path to the Public folder on the machine.
     * @remarks
     * The Public folder typically contains additional public folders, for example, Public Documents, Public Pictures, etc.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemdatapaths.public
     * @type {HSTRING} 
     */
    Public {
        get => this.get_Public()
    }

    /**
     * Gets the path to the Public Desktop folder on the machine.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemdatapaths.publicdesktop
     * @type {HSTRING} 
     */
    PublicDesktop {
        get => this.get_PublicDesktop()
    }

    /**
     * Gets the path to the Public Documents folder on the machine.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemdatapaths.publicdocuments
     * @type {HSTRING} 
     */
    PublicDocuments {
        get => this.get_PublicDocuments()
    }

    /**
     * Gets the path to the Public Downloads folder on the machine.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemdatapaths.publicdownloads
     * @type {HSTRING} 
     */
    PublicDownloads {
        get => this.get_PublicDownloads()
    }

    /**
     * Gets the path to the Public Music folder on the machine.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemdatapaths.publicmusic
     * @type {HSTRING} 
     */
    PublicMusic {
        get => this.get_PublicMusic()
    }

    /**
     * Gets the path to the Public Pictures folder on the machine.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemdatapaths.publicpictures
     * @type {HSTRING} 
     */
    PublicPictures {
        get => this.get_PublicPictures()
    }

    /**
     * Gets the path to the Public Videos folder on the machine.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemdatapaths.publicvideos
     * @type {HSTRING} 
     */
    PublicVideos {
        get => this.get_PublicVideos()
    }

    /**
     * Gets the path to the Windows system folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemdatapaths.system
     * @type {HSTRING} 
     */
    System {
        get => this.get_System()
    }

    /**
     * Gets the path to the System folder regardless of the operating system architecture (x64, x86, ARM).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemdatapaths.systemhost
     * @type {HSTRING} 
     */
    SystemHost {
        get => this.get_SystemHost()
    }

    /**
     * Gets the path to the 32-bit Windows system folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemdatapaths.systemx86
     * @type {HSTRING} 
     */
    SystemX86 {
        get => this.get_SystemX86()
    }

    /**
     * Gets the path to the 64-bit Windows system folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemdatapaths.systemx64
     * @type {HSTRING} 
     */
    SystemX64 {
        get => this.get_SystemX64()
    }

    /**
     * Gets the path to the System folder for a machine using an ARM operating system.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemdatapaths.systemarm
     * @type {HSTRING} 
     */
    SystemArm {
        get => this.get_SystemArm()
    }

    /**
     * Gets a path to the user profiles for the computer.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemdatapaths.userprofiles
     * @type {HSTRING} 
     */
    UserProfiles {
        get => this.get_UserProfiles()
    }

    /**
     * Gets a path to the Windows directory.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemdatapaths.windows
     * @type {HSTRING} 
     */
    Windows {
        get => this.get_Windows()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Fonts() {
        if (!this.HasProp("__ISystemDataPaths")) {
            if ((queryResult := this.QueryInterface(ISystemDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemDataPaths := ISystemDataPaths(outPtr)
        }

        return this.__ISystemDataPaths.get_Fonts()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProgramData() {
        if (!this.HasProp("__ISystemDataPaths")) {
            if ((queryResult := this.QueryInterface(ISystemDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemDataPaths := ISystemDataPaths(outPtr)
        }

        return this.__ISystemDataPaths.get_ProgramData()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Public() {
        if (!this.HasProp("__ISystemDataPaths")) {
            if ((queryResult := this.QueryInterface(ISystemDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemDataPaths := ISystemDataPaths(outPtr)
        }

        return this.__ISystemDataPaths.get_Public()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PublicDesktop() {
        if (!this.HasProp("__ISystemDataPaths")) {
            if ((queryResult := this.QueryInterface(ISystemDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemDataPaths := ISystemDataPaths(outPtr)
        }

        return this.__ISystemDataPaths.get_PublicDesktop()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PublicDocuments() {
        if (!this.HasProp("__ISystemDataPaths")) {
            if ((queryResult := this.QueryInterface(ISystemDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemDataPaths := ISystemDataPaths(outPtr)
        }

        return this.__ISystemDataPaths.get_PublicDocuments()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PublicDownloads() {
        if (!this.HasProp("__ISystemDataPaths")) {
            if ((queryResult := this.QueryInterface(ISystemDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemDataPaths := ISystemDataPaths(outPtr)
        }

        return this.__ISystemDataPaths.get_PublicDownloads()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PublicMusic() {
        if (!this.HasProp("__ISystemDataPaths")) {
            if ((queryResult := this.QueryInterface(ISystemDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemDataPaths := ISystemDataPaths(outPtr)
        }

        return this.__ISystemDataPaths.get_PublicMusic()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PublicPictures() {
        if (!this.HasProp("__ISystemDataPaths")) {
            if ((queryResult := this.QueryInterface(ISystemDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemDataPaths := ISystemDataPaths(outPtr)
        }

        return this.__ISystemDataPaths.get_PublicPictures()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PublicVideos() {
        if (!this.HasProp("__ISystemDataPaths")) {
            if ((queryResult := this.QueryInterface(ISystemDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemDataPaths := ISystemDataPaths(outPtr)
        }

        return this.__ISystemDataPaths.get_PublicVideos()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_System() {
        if (!this.HasProp("__ISystemDataPaths")) {
            if ((queryResult := this.QueryInterface(ISystemDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemDataPaths := ISystemDataPaths(outPtr)
        }

        return this.__ISystemDataPaths.get_System()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SystemHost() {
        if (!this.HasProp("__ISystemDataPaths")) {
            if ((queryResult := this.QueryInterface(ISystemDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemDataPaths := ISystemDataPaths(outPtr)
        }

        return this.__ISystemDataPaths.get_SystemHost()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SystemX86() {
        if (!this.HasProp("__ISystemDataPaths")) {
            if ((queryResult := this.QueryInterface(ISystemDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemDataPaths := ISystemDataPaths(outPtr)
        }

        return this.__ISystemDataPaths.get_SystemX86()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SystemX64() {
        if (!this.HasProp("__ISystemDataPaths")) {
            if ((queryResult := this.QueryInterface(ISystemDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemDataPaths := ISystemDataPaths(outPtr)
        }

        return this.__ISystemDataPaths.get_SystemX64()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SystemArm() {
        if (!this.HasProp("__ISystemDataPaths")) {
            if ((queryResult := this.QueryInterface(ISystemDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemDataPaths := ISystemDataPaths(outPtr)
        }

        return this.__ISystemDataPaths.get_SystemArm()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserProfiles() {
        if (!this.HasProp("__ISystemDataPaths")) {
            if ((queryResult := this.QueryInterface(ISystemDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemDataPaths := ISystemDataPaths(outPtr)
        }

        return this.__ISystemDataPaths.get_UserProfiles()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Windows() {
        if (!this.HasProp("__ISystemDataPaths")) {
            if ((queryResult := this.QueryInterface(ISystemDataPaths.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemDataPaths := ISystemDataPaths(outPtr)
        }

        return this.__ISystemDataPaths.get_Windows()
    }

;@endregion Instance Methods
}
