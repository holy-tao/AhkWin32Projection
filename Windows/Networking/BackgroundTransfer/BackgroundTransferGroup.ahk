#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundTransferGroup.ahk
#Include .\IBackgroundTransferGroupStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * A named group used to associate multiple download or upload operations. This class makes it easy for your app to create these groups and to complete downloads and uploads simultaneously, in serial, or based on priority.
  * 
  * For example, if a user decides to download and watch episodes from a popular television series, your app can prioritize the earliest episodes in the series or let the user choose which episode to download first.
 * @remarks
 * A BackgroundTransferGroup object can persist to support transfer operations that span app sessions. New methods have been introduced to [BackgroundDownloader](backgrounddownloader.md), [BackgroundUploader](backgrounduploader.md), [DownloadOperation](downloadoperation.md), and [UploadOperation](uploadoperation.md) to simplify accessing groups created in a previous app session.
 * 
 * > [!NOTE]
 * > Up to 50 unique transfer groups per app are supported.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgroundtransfergroup
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class BackgroundTransferGroup extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackgroundTransferGroup

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackgroundTransferGroup.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a transfer group using the provided group name.
     * @remarks
     * A [BackgroundTransferGroup](backgroundtransfergroup.md) object can persist to support transfer operations that span app sessions. New methods have been introduced to [BackgroundDownloader](backgrounddownloader.md), [BackgroundUploader](backgrounduploader.md), [DownloadOperation](downloadoperation.md), and [UploadOperation](uploadoperation.md) to simplify accessing groups created in a previous app session.
     * 
     * > [!NOTE]
     * > Windows 8.1 and Windows Server 2012 R2 support a maximum of 50 unique transfer groups for the entire system. So an app should reuse a unique ID or a small number of unique IDs for all transfer groups created by the app. If more than 50 transfer groups are created on the system, the app will get in an unrecoverable state.
     * @param {HSTRING} name The name of the group. If a group with the this name already exists, this method will return a reference to the existing group object.
     * @returns {BackgroundTransferGroup} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgroundtransfergroup.creategroup
     */
    static CreateGroup(name) {
        if (!BackgroundTransferGroup.HasProp("__IBackgroundTransferGroupStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.BackgroundTransfer.BackgroundTransferGroup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundTransferGroupStatics.IID)
            BackgroundTransferGroup.__IBackgroundTransferGroupStatics := IBackgroundTransferGroupStatics(factoryPtr)
        }

        return BackgroundTransferGroup.__IBackgroundTransferGroupStatics.CreateGroup(name)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the name of the group.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgroundtransfergroup.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets or sets the property used to specify if transfers within this group run simultaneously or in serial. Possible values are defined by [BackgroundTransferBehavior](backgroundtransferbehavior.md).
     * @remarks
     * When using Background Transfer during development, you may get into a situation where the internal caches of active and completed transfer operations can get out of sync. This may result in the inability to start new transfer operations or interact with existing operations and [BackgroundTransferGroup](backgroundtransfergroup.md) objects. In some cases, attempting to interact with existing operations may trigger a crash. This result can occur if the TransferBehavior property is set to **Parallel**. This issue occurs only in certain scenarios during development and is not applicable to end users of your app. For more Information, see the Debugging Guidance section in [BackgroundDownloader](backgrounddownloader.md) and [BackgroundUploader](backgrounduploader.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgroundtransfergroup.transferbehavior
     * @type {Integer} 
     */
    TransferBehavior {
        get => this.get_TransferBehavior()
        set => this.put_TransferBehavior(value)
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
    get_Name() {
        if (!this.HasProp("__IBackgroundTransferGroup")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferGroup := IBackgroundTransferGroup(outPtr)
        }

        return this.__IBackgroundTransferGroup.get_Name()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TransferBehavior() {
        if (!this.HasProp("__IBackgroundTransferGroup")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferGroup := IBackgroundTransferGroup(outPtr)
        }

        return this.__IBackgroundTransferGroup.get_TransferBehavior()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TransferBehavior(value) {
        if (!this.HasProp("__IBackgroundTransferGroup")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferGroup := IBackgroundTransferGroup(outPtr)
        }

        return this.__IBackgroundTransferGroup.put_TransferBehavior(value)
    }

;@endregion Instance Methods
}
