#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IActionEntityFactory2.ahk
#Include .\IActionEntityFactory3.ahk
#Include .\IActionEntityFactory4.ahk
#Include .\IActionEntityFactory5.ahk
#Include .\IActionEntityFactory6.ahk
#Include .\IActionEntityFactory7.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IActionEntityFactoryFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * A factory class that provides methods for instantiating different subclasses of [ActionEntity](actionentity.md) and other utility classes.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionentityfactory
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class ActionEntityFactory extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IActionEntityFactory2

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IActionEntityFactory2.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * Creates a new instance of [FileActionEntity](fileactionentity.md).
     * @param {HSTRING} path_ The path to the file represented by the **FileActionEntity**.
     * @returns {FileActionEntity} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionentityfactory.createfileentity
     */
    CreateFileEntity(path_) {
        if (!this.HasProp("__IActionEntityFactory2")) {
            if ((queryResult := this.QueryInterface(IActionEntityFactory2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionEntityFactory2 := IActionEntityFactory2(outPtr)
        }

        return this.__IActionEntityFactory2.CreateFileEntity(path_)
    }

    /**
     * Creates a new instance of [DocumentActionEntity](documentactionentity.md).
     * @param {HSTRING} path_ The path to the document file represented by the **DocumentActionEntity**.
     * @returns {DocumentActionEntity} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionentityfactory.createdocumententity
     */
    CreateDocumentEntity(path_) {
        if (!this.HasProp("__IActionEntityFactory2")) {
            if ((queryResult := this.QueryInterface(IActionEntityFactory2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionEntityFactory2 := IActionEntityFactory2(outPtr)
        }

        return this.__IActionEntityFactory2.CreateDocumentEntity(path_)
    }

    /**
     * Creates a new instance of [PhotoActionEntity](photoactionentity.md).
     * @param {HSTRING} path_ The path to the image file represented by the **PhotoActionEntity**.
     * @returns {PhotoActionEntity} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionentityfactory.createphotoentity
     */
    CreatePhotoEntity(path_) {
        if (!this.HasProp("__IActionEntityFactory2")) {
            if ((queryResult := this.QueryInterface(IActionEntityFactory2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionEntityFactory2 := IActionEntityFactory2(outPtr)
        }

        return this.__IActionEntityFactory2.CreatePhotoEntity(path_)
    }

    /**
     * Creates a new instance of [TextActionEntity](textactionentity.md) with the specified text and text format.
     * @param {HSTRING} text The text of the new **TextActionEntity**.
     * @returns {TextActionEntity} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionentityfactory.createtextentity
     */
    CreateTextEntity(text) {
        if (!this.HasProp("__IActionEntityFactory2")) {
            if ((queryResult := this.QueryInterface(IActionEntityFactory2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionEntityFactory2 := IActionEntityFactory2(outPtr)
        }

        return this.__IActionEntityFactory2.CreateTextEntity(text)
    }

    /**
     * Creates a new instance of [RemoteFileActionEntity](remotefileactionentity.md) which enables actions to operate on files hosted by cloud storage providers.
     * @remarks
     * This method has parameters that represent values that are commonly used across different cloud providers. The implementation and behavior of these parameters will vary between providers. App action provider developers should consult the documentation for each supported cloud storage provider for usage information for these parameters.
     * @param {HSTRING} sourceId The identifier of the cloud storage provider that hosts the remote file.
     * @param {Integer} fileKind A member of the [RemoteFileKind](remotefilekind.md) enumeration specifying the remote file kind.
     * @param {Uri} sourceUri The URI of the remote file. Optional. Some cloud storage providers may use the *sourfileId* parameter instead.
     * @param {HSTRING} fileId The identifier of the remote file. Optional. Some cloud storage providers may use the *sourceUri* parameter instead.
     * @param {HSTRING} contentType The MIME type of the remote file.
     * @param {HSTRING} driveId The identifier for the remote drive associated with the remote file.
     * @param {HSTRING} accountId The identifier of the cloud service account associated with the remote file. Optional.
     * @param {HSTRING} extension_ The extension of the remote file.
     * @returns {RemoteFileActionEntity} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionentityfactory.createremotefileentity
     */
    CreateRemoteFileEntity(sourceId, fileKind, sourceUri, fileId, contentType, driveId, accountId, extension_) {
        if (!this.HasProp("__IActionEntityFactory3")) {
            if ((queryResult := this.QueryInterface(IActionEntityFactory3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionEntityFactory3 := IActionEntityFactory3(outPtr)
        }

        return this.__IActionEntityFactory3.CreateRemoteFileEntity(sourceId, fileKind, sourceUri, fileId, contentType, driveId, accountId, extension_)
    }

    /**
     * Creates a new instance of [TextActionEntity](textactionentity.md) with the specified text.
     * @param {HSTRING} text The text of the new **TextActionEntity**.
     * @param {Integer} textFormat 
     * @returns {TextActionEntity} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionentityfactory.createtextentity
     */
    CreateTextEntityWithTextFormat(text, textFormat) {
        if (!this.HasProp("__IActionEntityFactory3")) {
            if ((queryResult := this.QueryInterface(IActionEntityFactory3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionEntityFactory3 := IActionEntityFactory3(outPtr)
        }

        return this.__IActionEntityFactory3.CreateTextEntityWithTextFormat(text, textFormat)
    }

    /**
     * Creates a new instance of [StreamingTextActionEntityWriter](streamingtextactionentitywriter.md) which supports the [StreamingTextActionEntity](streamingtextactionentity.md) class.
     * @param {Integer} textFormat A member of the [ActionEntityTextFormat](actionentitytextformat.md) enumeration specifying the format of the streaming text.
     * @returns {StreamingTextActionEntityWriter} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionentityfactory.createstreamingtextactionentitywriter
     */
    CreateStreamingTextActionEntityWriter(textFormat) {
        if (!this.HasProp("__IActionEntityFactory3")) {
            if ((queryResult := this.QueryInterface(IActionEntityFactory3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionEntityFactory3 := IActionEntityFactory3(outPtr)
        }

        return this.__IActionEntityFactory3.CreateStreamingTextActionEntityWriter(textFormat)
    }

    /**
     * Creates a new instance of [TableActionEntity](tableactionentity.md).
     * @param {Integer} data_length 
     * @param {Pointer<HSTRING>} data A one-dimensional array of strings representing a two-dimensional string table.
     * @param {Integer} columnCount The number of columns in the table. The system determines the number of rows by dividing the length of the *data* array by the *columnCount*, casting the row count to an integer. If the product of the column count and row count is not the same as the data length, an exception will be raised.
     * @returns {TableActionEntity} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionentityfactory.createtableentity
     */
    CreateTableEntity(data_length, data, columnCount) {
        if (!this.HasProp("__IActionEntityFactory4")) {
            if ((queryResult := this.QueryInterface(IActionEntityFactory4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionEntityFactory4 := IActionEntityFactory4(outPtr)
        }

        return this.__IActionEntityFactory4.CreateTableEntity(data_length, data, columnCount)
    }

    /**
     * Creates a new instance of [ContactActionEntity](contactactionentity.md).
     * @param {Contact} contact_ A [Contact](/uwp/api/windows.applicationmodel.contacts.contact) object.
     * @returns {ContactActionEntity} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionentityfactory.createcontactentity
     */
    CreateContactEntity(contact_) {
        if (!this.HasProp("__IActionEntityFactory4")) {
            if ((queryResult := this.QueryInterface(IActionEntityFactory4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionEntityFactory4 := IActionEntityFactory4(outPtr)
        }

        return this.__IActionEntityFactory4.CreateContactEntity(contact_)
    }

    /**
     * Creates a new instance of [UriActionEntity](uriactionentity.md).
     * @param {Uri} Uri_ The URI associated with the **UriActionEntity**.
     * @returns {UriActionEntity} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionentityfactory.createurientity
     */
    CreateUriEntity(Uri_) {
        if (!this.HasProp("__IActionEntityFactory5")) {
            if ((queryResult := this.QueryInterface(IActionEntityFactory5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionEntityFactory5 := IActionEntityFactory5(outPtr)
        }

        return this.__IActionEntityFactory5.CreateUriEntity(Uri_)
    }

    /**
     * 
     * @param {Integer} kind 
     * @param {Integer} entities_length 
     * @param {Pointer<ActionEntity>} entities 
     * @returns {ArrayActionEntity} 
     */
    CreateArrayEntity(kind, entities_length, entities) {
        if (!this.HasProp("__IActionEntityFactory5")) {
            if ((queryResult := this.QueryInterface(IActionEntityFactory5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionEntityFactory5 := IActionEntityFactory5(outPtr)
        }

        return this.__IActionEntityFactory5.CreateArrayEntity(kind, entities_length, entities)
    }

    /**
     * 
     * @param {DateTime} dateTime_ 
     * @returns {DateTimeActionEntity} 
     */
    CreateDateTimeEntity(dateTime_) {
        if (!this.HasProp("__IActionEntityFactory6")) {
            if ((queryResult := this.QueryInterface(IActionEntityFactory6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionEntityFactory6 := IActionEntityFactory6(outPtr)
        }

        return this.__IActionEntityFactory6.CreateDateTimeEntity(dateTime_)
    }

    /**
     * 
     * @param {HSTRING} sourceId 
     * @param {Appointment} appointment_ 
     * @param {Integer} attendees_length 
     * @param {Pointer<ContactActionEntity>} attendees 
     * @returns {AppointmentActionEntity} 
     */
    CreateAppointmentEntity(sourceId, appointment_, attendees_length, attendees) {
        if (!this.HasProp("__IActionEntityFactory6")) {
            if ((queryResult := this.QueryInterface(IActionEntityFactory6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionEntityFactory6 := IActionEntityFactory6(outPtr)
        }

        return this.__IActionEntityFactory6.CreateAppointmentEntity(sourceId, appointment_, attendees_length, attendees)
    }

    /**
     * 
     * @param {HSTRING} kind 
     * @param {HSTRING} keyPhrase 
     * @param {IMapView<HSTRING, IInspectable>} props 
     * @returns {CustomTextActionEntity} 
     */
    CreateCustomTextEntity(kind, keyPhrase, props) {
        if (!this.HasProp("__IActionEntityFactory7")) {
            if ((queryResult := this.QueryInterface(IActionEntityFactory7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionEntityFactory7 := IActionEntityFactory7(outPtr)
        }

        return this.__IActionEntityFactory7.CreateCustomTextEntity(kind, keyPhrase, props)
    }

    /**
     * 
     * @param {Integer} elementKind 
     * @param {HSTRING} customKind 
     * @param {Integer} entities_length 
     * @param {Pointer<ActionEntity>} entities 
     * @returns {ArrayActionEntity} 
     */
    CreateArrayEntityWithCustomKind(elementKind, customKind, entities_length, entities) {
        if (!this.HasProp("__IActionEntityFactory7")) {
            if ((queryResult := this.QueryInterface(IActionEntityFactory7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionEntityFactory7 := IActionEntityFactory7(outPtr)
        }

        return this.__IActionEntityFactory7.CreateArrayEntityWithCustomKind(elementKind, customKind, entities_length, entities)
    }

    /**
     * Closes and releases any resources used by this **ActionEntityFactory**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionentityfactory.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
