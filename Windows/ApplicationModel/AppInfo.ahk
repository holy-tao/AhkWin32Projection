#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppInfo.ahk
#Include .\IAppInfo2.ahk
#Include .\IAppInfo3.ahk
#Include .\IAppInfo4.ahk
#Include .\IAppInfoStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Provides information about an application such as its name, logo, package information, ID.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinfo
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class AppInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppInfo.IID

    /**
     * Retrieves the AppInfo object corresponding to the currently running process.
     * @remarks
     * When used by an unpackaged application, accessing this property throws an **InvalidOperationException** with HRESULT `80073D54`, indicating "The process has no package identity."
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinfo.current
     * @type {AppInfo} 
     */
    static Current {
        get => AppInfo.get_Current()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {AppInfo} 
     */
    static get_Current() {
        if (!AppInfo.HasProp("__IAppInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.AppInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppInfoStatics.IID)
            AppInfo.__IAppInfoStatics := IAppInfoStatics(factoryPtr)
        }

        return AppInfo.__IAppInfoStatics.get_Current()
    }

    /**
     * Retrieves the AppInfo object associated with an AppUserModelId (AUMID).
     * @remarks
     * Requesting the AppInfo for another package requires the **packageQuery** capability. This capability is not required if the AUMID resolves to the current package. Note that full trust applications have this capability by default.
     * @param {HSTRING} appUserModelId The AUMID of the app from which to retrieve the AppInfo.
     * @returns {AppInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinfo.getfromappusermodelid
     */
    static GetFromAppUserModelId(appUserModelId) {
        if (!AppInfo.HasProp("__IAppInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.AppInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppInfoStatics.IID)
            AppInfo.__IAppInfoStatics := IAppInfoStatics(factoryPtr)
        }

        return AppInfo.__IAppInfoStatics.GetFromAppUserModelId(appUserModelId)
    }

    /**
     * Retrieves the AppInfo object associated with a specified User and AppUserModelId (AUMID).
     * @remarks
     * Finding AppInfo for another user requires administration privileges.
     * 
     * Requesting the AppInfo for another package requires the **packageQuery** capability. This capability is not required if the AUMID resolves to the current package. Note that full trust applications have this capability by default.
     * @param {User} user_ The User whose AppInfos you wish to access.
     * @param {HSTRING} appUserModelId The AUMID of the app from which to retrieve the AppInfo.
     * @returns {AppInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinfo.getfromappusermodelidforuser
     */
    static GetFromAppUserModelIdForUser(user_, appUserModelId) {
        if (!AppInfo.HasProp("__IAppInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.AppInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppInfoStatics.IID)
            AppInfo.__IAppInfoStatics := IAppInfoStatics(factoryPtr)
        }

        return AppInfo.__IAppInfoStatics.GetFromAppUserModelIdForUser(user_, appUserModelId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the app identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinfo.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * An identifier that uniquely identifies the app.
     * @remarks
     * An application user model identifier is used to associate processes, files, and windows with a particular application. See [Application User Model IDs](/windows/desktop/shell/appids) for more details.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinfo.appusermodelid
     * @type {HSTRING} 
     */
    AppUserModelId {
        get => this.get_AppUserModelId()
    }

    /**
     * Gets information that describes the application.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinfo.displayinfo
     * @type {AppDisplayInfo} 
     */
    DisplayInfo {
        get => this.get_DisplayInfo()
    }

    /**
     * An identifier that uniquely identifies the app's package.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinfo.packagefamilyname
     * @type {HSTRING} 
     */
    PackageFamilyName {
        get => this.get_PackageFamilyName()
    }

    /**
     * Retrieves the full Package object for the calling AppInfo object.
     * @remarks
     * This API is recommended for use in any case where a process enumerating AppInfo in the system needs access to a full Package object.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinfo.package
     * @type {Package} 
     */
    Package {
        get => this.get_Package()
    }

    /**
     * An enum that represents the execution context for the specified app. Values may be one of Unknown, Host, or Guest. On Desktop devices, this will be Host.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinfo.executioncontext
     * @type {Integer} 
     */
    ExecutionContext {
        get => this.get_ExecutionContext()
    }

    /**
     * A list of file extensions that the application has been registered to handle. An app can register to handle an extension under the `windows.fileTypeAssociation` in the application manifest file.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinfo.supportedfileextensions
     */
    SupportedFileExtensions {
        get => this.get_SupportedFileExtensions()
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
    get_Id() {
        if (!this.HasProp("__IAppInfo")) {
            if ((queryResult := this.QueryInterface(IAppInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInfo := IAppInfo(outPtr)
        }

        return this.__IAppInfo.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppUserModelId() {
        if (!this.HasProp("__IAppInfo")) {
            if ((queryResult := this.QueryInterface(IAppInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInfo := IAppInfo(outPtr)
        }

        return this.__IAppInfo.get_AppUserModelId()
    }

    /**
     * 
     * @returns {AppDisplayInfo} 
     */
    get_DisplayInfo() {
        if (!this.HasProp("__IAppInfo")) {
            if ((queryResult := this.QueryInterface(IAppInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInfo := IAppInfo(outPtr)
        }

        return this.__IAppInfo.get_DisplayInfo()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PackageFamilyName() {
        if (!this.HasProp("__IAppInfo")) {
            if ((queryResult := this.QueryInterface(IAppInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInfo := IAppInfo(outPtr)
        }

        return this.__IAppInfo.get_PackageFamilyName()
    }

    /**
     * 
     * @returns {Package} 
     */
    get_Package() {
        if (!this.HasProp("__IAppInfo2")) {
            if ((queryResult := this.QueryInterface(IAppInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInfo2 := IAppInfo2(outPtr)
        }

        return this.__IAppInfo2.get_Package()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExecutionContext() {
        if (!this.HasProp("__IAppInfo3")) {
            if ((queryResult := this.QueryInterface(IAppInfo3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInfo3 := IAppInfo3(outPtr)
        }

        return this.__IAppInfo3.get_ExecutionContext()
    }

    /**
     * 
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} 
     */
    get_SupportedFileExtensions(value) {
        if (!this.HasProp("__IAppInfo4")) {
            if ((queryResult := this.QueryInterface(IAppInfo4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInfo4 := IAppInfo4(outPtr)
        }

        return this.__IAppInfo4.get_SupportedFileExtensions(value)
    }

;@endregion Instance Methods
}
