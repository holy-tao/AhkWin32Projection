#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ActionEntity.ahk
#Include .\IRemoteFileActionEntity.ahk
#Include .\IRemoteFileActionEntity2.ahk
#Include ..\..\..\Guid.ahk

/**
 * A subtype of [ActionEntity](actionentity.md) that represents a remote file.
 * @remarks
 * Create an instance of this class by calling [ActionEntityFactory.CreateRemoteFileEntity](actionentityfactory_createremotefileentity_971519456.md).
 * 
 * This class has properties that represent values that are commonly used across different cloud providers. The implementation and behavior of these parameters will vary between providers. App action provider developers should consult the documentation for each supported cloud storage provider for usage information for these parameters.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.remotefileactionentity
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class RemoteFileActionEntity extends ActionEntity {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteFileActionEntity

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteFileActionEntity.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the identifier of the cloud storage provider that hosts the remote file.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.remotefileactionentity.sourceid
     * @type {HSTRING} 
     */
    SourceId {
        get => this.get_SourceId()
    }

    /**
     * Gets a value specifying the remote file kind.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.remotefileactionentity.filekind
     * @type {Integer} 
     */
    FileKind {
        get => this.get_FileKind()
    }

    /**
     * Gets the URI of the remote file.
     * @remarks
     * Some cloud storage providers may use the [FileId](remotefileactionentity_fileid.md) value instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.remotefileactionentity.sourceuri
     * @type {Uri} 
     */
    SourceUri {
        get => this.get_SourceUri()
    }

    /**
     * Gets the identifier of the remote file.
     * @remarks
     * Some cloud storage providers may use the [SourceUri](remotefileactionentity_sourceuri.md) value instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.remotefileactionentity.fileid
     * @type {HSTRING} 
     */
    FileId {
        get => this.get_FileId()
    }

    /**
     * Gets the MIME type of the remote file.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.remotefileactionentity.contenttype
     * @type {HSTRING} 
     */
    ContentType {
        get => this.get_ContentType()
    }

    /**
     * Gets the identifier for the remote drive associated with the remote file.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.remotefileactionentity.driveid
     * @type {HSTRING} 
     */
    DriveId {
        get => this.get_DriveId()
    }

    /**
     * Gets the identifier of the cloud service account associated with the remote file.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.remotefileactionentity.accountid
     * @type {HSTRING} 
     */
    AccountId {
        get => this.get_AccountId()
    }

    /**
     * Gets the extension of the remote file.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.remotefileactionentity.extension
     * @type {HSTRING} 
     */
    Extension {
        get => this.get_Extension()
    }

    /**
     * @type {HSTRING} 
     */
    Filename {
        get => this.get_Filename()
        set => this.put_Filename(value)
    }

    /**
     * @type {ContactActionEntity} 
     */
    Creator {
        get => this.get_Creator()
        set => this.put_Creator(value)
    }

    /**
     * @type {IReference<DateTime>} 
     */
    LastUpdatedTime {
        get => this.get_LastUpdatedTime()
        set => this.put_LastUpdatedTime(value)
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
    get_SourceId() {
        if (!this.HasProp("__IRemoteFileActionEntity")) {
            if ((queryResult := this.QueryInterface(IRemoteFileActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteFileActionEntity := IRemoteFileActionEntity(outPtr)
        }

        return this.__IRemoteFileActionEntity.get_SourceId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FileKind() {
        if (!this.HasProp("__IRemoteFileActionEntity")) {
            if ((queryResult := this.QueryInterface(IRemoteFileActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteFileActionEntity := IRemoteFileActionEntity(outPtr)
        }

        return this.__IRemoteFileActionEntity.get_FileKind()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_SourceUri() {
        if (!this.HasProp("__IRemoteFileActionEntity")) {
            if ((queryResult := this.QueryInterface(IRemoteFileActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteFileActionEntity := IRemoteFileActionEntity(outPtr)
        }

        return this.__IRemoteFileActionEntity.get_SourceUri()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FileId() {
        if (!this.HasProp("__IRemoteFileActionEntity")) {
            if ((queryResult := this.QueryInterface(IRemoteFileActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteFileActionEntity := IRemoteFileActionEntity(outPtr)
        }

        return this.__IRemoteFileActionEntity.get_FileId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentType() {
        if (!this.HasProp("__IRemoteFileActionEntity")) {
            if ((queryResult := this.QueryInterface(IRemoteFileActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteFileActionEntity := IRemoteFileActionEntity(outPtr)
        }

        return this.__IRemoteFileActionEntity.get_ContentType()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DriveId() {
        if (!this.HasProp("__IRemoteFileActionEntity")) {
            if ((queryResult := this.QueryInterface(IRemoteFileActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteFileActionEntity := IRemoteFileActionEntity(outPtr)
        }

        return this.__IRemoteFileActionEntity.get_DriveId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AccountId() {
        if (!this.HasProp("__IRemoteFileActionEntity")) {
            if ((queryResult := this.QueryInterface(IRemoteFileActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteFileActionEntity := IRemoteFileActionEntity(outPtr)
        }

        return this.__IRemoteFileActionEntity.get_AccountId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Extension() {
        if (!this.HasProp("__IRemoteFileActionEntity")) {
            if ((queryResult := this.QueryInterface(IRemoteFileActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteFileActionEntity := IRemoteFileActionEntity(outPtr)
        }

        return this.__IRemoteFileActionEntity.get_Extension()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Filename() {
        if (!this.HasProp("__IRemoteFileActionEntity2")) {
            if ((queryResult := this.QueryInterface(IRemoteFileActionEntity2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteFileActionEntity2 := IRemoteFileActionEntity2(outPtr)
        }

        return this.__IRemoteFileActionEntity2.get_Filename()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Filename(value) {
        if (!this.HasProp("__IRemoteFileActionEntity2")) {
            if ((queryResult := this.QueryInterface(IRemoteFileActionEntity2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteFileActionEntity2 := IRemoteFileActionEntity2(outPtr)
        }

        return this.__IRemoteFileActionEntity2.put_Filename(value)
    }

    /**
     * 
     * @returns {ContactActionEntity} 
     */
    get_Creator() {
        if (!this.HasProp("__IRemoteFileActionEntity2")) {
            if ((queryResult := this.QueryInterface(IRemoteFileActionEntity2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteFileActionEntity2 := IRemoteFileActionEntity2(outPtr)
        }

        return this.__IRemoteFileActionEntity2.get_Creator()
    }

    /**
     * 
     * @param {ContactActionEntity} value 
     * @returns {HRESULT} 
     */
    put_Creator(value) {
        if (!this.HasProp("__IRemoteFileActionEntity2")) {
            if ((queryResult := this.QueryInterface(IRemoteFileActionEntity2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteFileActionEntity2 := IRemoteFileActionEntity2(outPtr)
        }

        return this.__IRemoteFileActionEntity2.put_Creator(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_LastUpdatedTime() {
        if (!this.HasProp("__IRemoteFileActionEntity2")) {
            if ((queryResult := this.QueryInterface(IRemoteFileActionEntity2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteFileActionEntity2 := IRemoteFileActionEntity2(outPtr)
        }

        return this.__IRemoteFileActionEntity2.get_LastUpdatedTime()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_LastUpdatedTime(value) {
        if (!this.HasProp("__IRemoteFileActionEntity2")) {
            if ((queryResult := this.QueryInterface(IRemoteFileActionEntity2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteFileActionEntity2 := IRemoteFileActionEntity2(outPtr)
        }

        return this.__IRemoteFileActionEntity2.put_LastUpdatedTime(value)
    }

    /**
     * 
     * @param {Integer} contributors_length 
     * @param {Pointer<ContactActionEntity>} contributors 
     * @returns {HRESULT} 
     */
    SetContributors(contributors_length, contributors) {
        if (!this.HasProp("__IRemoteFileActionEntity2")) {
            if ((queryResult := this.QueryInterface(IRemoteFileActionEntity2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteFileActionEntity2 := IRemoteFileActionEntity2(outPtr)
        }

        return this.__IRemoteFileActionEntity2.SetContributors(contributors_length, contributors)
    }

    /**
     * 
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} 
     */
    GetContributors(result_) {
        if (!this.HasProp("__IRemoteFileActionEntity2")) {
            if ((queryResult := this.QueryInterface(IRemoteFileActionEntity2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteFileActionEntity2 := IRemoteFileActionEntity2(outPtr)
        }

        return this.__IRemoteFileActionEntity2.GetContributors(result_)
    }

;@endregion Instance Methods
}
