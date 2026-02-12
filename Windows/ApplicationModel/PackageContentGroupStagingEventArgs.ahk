#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackageContentGroupStagingEventArgs.ahk
#Include ..\..\Guid.ahk

/**
 * Provides information about the package content group that is being staged.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecontentgroupstagingeventargs
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class PackageContentGroupStagingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackageContentGroupStagingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackageContentGroupStagingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the identifier of the content group staging operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecontentgroupstagingeventargs.activityid
     * @type {Guid} 
     */
    ActivityId {
        get => this.get_ActivityId()
    }

    /**
     * Gets the package that is being staged.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecontentgroupstagingeventargs.package
     * @type {Package} 
     */
    Package {
        get => this.get_Package()
    }

    /**
     * Gets an approximation of the package content group's staging progress.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecontentgroupstagingeventargs.progress
     * @type {Float} 
     */
    Progress {
        get => this.get_Progress()
    }

    /**
     * Indicates whether the content group is done staging.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecontentgroupstagingeventargs.iscomplete
     * @type {Boolean} 
     */
    IsComplete {
        get => this.get_IsComplete()
    }

    /**
     * Gets the result of the package content group staging operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecontentgroupstagingeventargs.errorcode
     * @type {HRESULT} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
    }

    /**
     * Gets the name of the content group that is being staged.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecontentgroupstagingeventargs.contentgroupname
     * @type {HSTRING} 
     */
    ContentGroupName {
        get => this.get_ContentGroupName()
    }

    /**
     * Indicates whether the content group is required.
     * @remarks
     * Required content groups contain core executable binaries and are downloaded during app install.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecontentgroupstagingeventargs.iscontentgrouprequired
     * @type {Boolean} 
     */
    IsContentGroupRequired {
        get => this.get_IsContentGroupRequired()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ActivityId() {
        if (!this.HasProp("__IPackageContentGroupStagingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageContentGroupStagingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageContentGroupStagingEventArgs := IPackageContentGroupStagingEventArgs(outPtr)
        }

        return this.__IPackageContentGroupStagingEventArgs.get_ActivityId()
    }

    /**
     * 
     * @returns {Package} 
     */
    get_Package() {
        if (!this.HasProp("__IPackageContentGroupStagingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageContentGroupStagingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageContentGroupStagingEventArgs := IPackageContentGroupStagingEventArgs(outPtr)
        }

        return this.__IPackageContentGroupStagingEventArgs.get_Package()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Progress() {
        if (!this.HasProp("__IPackageContentGroupStagingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageContentGroupStagingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageContentGroupStagingEventArgs := IPackageContentGroupStagingEventArgs(outPtr)
        }

        return this.__IPackageContentGroupStagingEventArgs.get_Progress()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsComplete() {
        if (!this.HasProp("__IPackageContentGroupStagingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageContentGroupStagingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageContentGroupStagingEventArgs := IPackageContentGroupStagingEventArgs(outPtr)
        }

        return this.__IPackageContentGroupStagingEventArgs.get_IsComplete()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ErrorCode() {
        if (!this.HasProp("__IPackageContentGroupStagingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageContentGroupStagingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageContentGroupStagingEventArgs := IPackageContentGroupStagingEventArgs(outPtr)
        }

        return this.__IPackageContentGroupStagingEventArgs.get_ErrorCode()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentGroupName() {
        if (!this.HasProp("__IPackageContentGroupStagingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageContentGroupStagingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageContentGroupStagingEventArgs := IPackageContentGroupStagingEventArgs(outPtr)
        }

        return this.__IPackageContentGroupStagingEventArgs.get_ContentGroupName()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsContentGroupRequired() {
        if (!this.HasProp("__IPackageContentGroupStagingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageContentGroupStagingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageContentGroupStagingEventArgs := IPackageContentGroupStagingEventArgs(outPtr)
        }

        return this.__IPackageContentGroupStagingEventArgs.get_IsContentGroupRequired()
    }

;@endregion Instance Methods
}
