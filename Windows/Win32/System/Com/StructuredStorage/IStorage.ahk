#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IStream.ahk
#Include .\IStorage.ahk
#Include .\IEnumSTATSTG.ahk
#Include ..\STATSTG.ahk
#Include ..\IUnknown.ahk

/**
 * The IStorage interface supports the creation and management of structured storage objects.
 * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nn-objidl-istorage
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class IStorage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorage
     * @type {Guid}
     */
    static IID => Guid("{0000000b-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateStream", "OpenStream", "CreateStorage", "OpenStorage", "CopyTo", "MoveElementTo", "Commit", "Revert", "EnumElements", "DestroyElement", "RenameElement", "SetElementTimes", "SetClass", "SetStateBits", "Stat"]

    /**
     * Creates and opens a stream object with the specified name contained in this storage object.
     * @remarks
     * If a stream with the name specified in the <i>pwcsName</i> parameter already exists and the <i>grfMode</i> parameter includes the STGM_CREATE flag, the existing stream is replaced by a newly created one. Both the destruction of the old stream and the creation of the new stream object are subject to the transaction mode on the parent storage object.
     * 
     * The COM-provided compound file implementation of the <b>IStorage::CreateStream</b> method does not support the following behaviors:
     * 
     * <ul>
     * <li>The STGM_DELETEONRELEASE flag is not supported.</li>
     * <li>Transacted mode (STGM_TRANSACTED) is not supported for stream objects.</li>
     * <li>Opening the same stream more than once from the same storage is not supported. The STGM_SHARE_EXCLUSIVE sharing-mode flag must be specified in the <i>grfMode</i> parameter.</li>
     * </ul>
     * If the stream already exists and <i>grfMode</i> is set to STGM_FAILIFTHERE, this method fails with the return value STG_E_FILEALREADYEXISTS.
     * @param {PWSTR} pwcsName A pointer to a wide character null-terminated Unicode string that contains the name of the newly created stream. The name can be used later to open or reopen the stream. The name must not exceed 31 characters in length, not including the string terminator. The 000 through 01f characters, serving as the first character of the stream/storage name, are reserved for use by OLE. This is a compound file restriction, not a structured storage restriction.
     * @param {Integer} grfMode Specifies the access mode to use when opening the newly created stream. For more information and descriptions of the possible values, see <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM Constants</a>.
     * @param {Integer} reserved1 Reserved for future use; must be zero.
     * @param {Integer} reserved2 Reserved for future use; must be zero.
     * @returns {IStream} On return, pointer to the location of the new 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface pointer. This is only valid if the operation is successful. When an error occurs, this parameter is set to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-istorage-createstream
     */
    CreateStream(pwcsName, grfMode, reserved1, reserved2) {
        pwcsName := pwcsName is String ? StrPtr(pwcsName) : pwcsName

        result := ComCall(3, this, "ptr", pwcsName, "uint", grfMode, "uint", reserved1, "uint", reserved2, "ptr*", &ppstm := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStream(ppstm)
    }

    /**
     * Opens an existing stream object within this storage object in the specified access mode.
     * @remarks
     * <b>IStorage::OpenStream</b> opens an existing stream object within this storage object in the access mode specified in <i>grfMode</i>. There are restrictions on the permissions that can be given in <i>grfMode</i>. For example, the permissions on this storage object restrict the permissions on its streams. In general, access restrictions on streams need to be stricter than those on their parent storages. Compound-file streams must be opened with STGM_SHARE_EXCLUSIVE.
     * @param {PWSTR} pwcsName A pointer to a wide character null-terminated Unicode string that contains the name of the stream to open. The 000 through 01f characters, serving as the first character of the stream/storage name, are reserved for use by OLE. This is a compound file restriction, not a structured storage restriction.
     * @param {Integer} grfMode Specifies the access mode to be assigned to the open stream. For more information and descriptions of possible values, see <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM Constants</a>.  Other modes you choose must at least specify STGM_SHARE_EXCLUSIVE when calling this method in the compound file implementation.
     * @param {Integer} reserved2 Reserved for future use; must be zero.
     * @returns {IStream} A pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> pointer variable that receives the interface pointer to the newly opened stream object. If an error occurs, *<i>ppstm</i> must be set to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-istorage-openstream
     */
    OpenStream(pwcsName, grfMode, reserved2) {
        static reserved1 := 0 ;Reserved parameters must always be NULL

        pwcsName := pwcsName is String ? StrPtr(pwcsName) : pwcsName

        result := ComCall(4, this, "ptr", pwcsName, "ptr", reserved1, "uint", grfMode, "uint", reserved2, "ptr*", &ppstm := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStream(ppstm)
    }

    /**
     * Creates and opens a new storage object nested within this storage object with the specified name in the specified access mode.
     * @remarks
     * If a storage with the name specified in the <i>pwcsName</i> parameter already exists within the parent storage object, and the <i>grfMode</i> parameter includes the STGM_CREATE flag, the existing storage is replaced by the new one. If the <i>grfMode</i> parameter includes the STGM_CONVERT flag, the existing element is converted to a stream object named CONTENTS and the new storage object is created containing the CONTENTS stream object. The destruction of the old element and the creation of the new storage object are both subject to the transaction mode on the parent storage object. Be aware that you cannot use STGM_CONVERT if you are also using STGM_CREATE.
     * 
     * The COM-provided compound file implementation of the <b>IStorage::CreateStorage</b> method does not support the following behavior:
     * 
     * <ul>
     * <li>The STGM_PRIORITY flag for nonroot storages.</li>
     * <li>Opening the same storage object more than once from the same parent storage. The STGM_SHARE_EXCLUSIVE flag must be specified.</li>
     * <li>The STGM_DELETEONRELEASE flag. If this flag is specified, the function returns STG_E_INVALIDFLAG.</li>
     * </ul>
     * If a storage object with the same name already exists and <i>grfMode</i> is set to STGM_FAILIFTHERE, this method fails with the return value STG_E_FILEALREADYEXISTS.
     * @param {PWSTR} pwcsName A pointer to a wide character null-terminated Unicode string that contains the name of the newly created storage object. The name can be used later to reopen the storage object. The name must not exceed 31 characters in length, not including the string terminator. The 000 through 01f characters, serving as the first character of the stream/storage name, are reserved for use by OLE. This is a compound file restriction, not a structured storage restriction.
     * @param {Integer} grfMode A value that specifies the access mode to use when opening the newly created storage object. For more information and a description of possible values, see <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM Constants</a>.
     * @param {Integer} reserved1 Reserved for future use; must be zero.
     * @param {Integer} reserved2 Reserved for future use; must be zero.
     * @returns {IStorage} A pointer, when successful, to the location of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer to the newly created storage object. This parameter is set to <b>NULL</b> if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-istorage-createstorage
     */
    CreateStorage(pwcsName, grfMode, reserved1, reserved2) {
        pwcsName := pwcsName is String ? StrPtr(pwcsName) : pwcsName

        result := ComCall(5, this, "ptr", pwcsName, "uint", grfMode, "uint", reserved1, "uint", reserved2, "ptr*", &ppstg := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStorage(ppstg)
    }

    /**
     * Opens an existing storage object with the specified name in the specified access mode.
     * @remarks
     * If the <i>pstgPriority</i> parameter is <b>NULL</b>, it is ignored. If the <i>pstgPriority</i> parameter is not <b>NULL</b>, it is an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer to a previous opening of an element of the storage object, usually one that was opened in priority mode. The storage object should be closed and reopened according to <i>grfMode</i>. When the <b>IStorage::OpenStorage</b> method returns, <i>pstgPriority</i> is no longer valid. Use the value supplied in the <i>ppstg</i> parameter.
     * 
     * Storage objects can be opened with STGM_DELETEONRELEASE, in which case the object is destroyed when it receives its final release. This is useful for creating temporary storage objects.
     * @param {PWSTR} pwcsName A pointer to a wide character null-terminated Unicode string that contains the name of the storage object to open. The 000 through 01f characters, serving as the first character of the stream/storage name, are reserved for use by OLE. This is a compound file restriction, not a structured storage restriction. It is ignored if <i>pstgPriority</i> is non-<b>NULL</b>.
     * @param {IStorage} pstgPriority Must be <b>NULL</b>. A non-<b>NULL</b> value will return STG_E_INVALIDPARAMETER.
     * @param {Integer} grfMode Specifies the access mode to use when opening the storage object. For descriptions of the possible values, see <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM Constants</a>. Other modes you choose must at least specify STGM_SHARE_EXCLUSIVE when calling this method.
     * @param {Pointer<Pointer<Integer>>} snbExclude Must be <b>NULL</b>. A non-<b>NULL</b> value will return STG_E_INVALIDPARAMETER.
     * @param {Integer} reserved Reserved for future use; must be zero.
     * @returns {IStorage} When successful, pointer to the location of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer to the opened storage object. This parameter is set to <b>NULL</b> if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-istorage-openstorage
     */
    OpenStorage(pwcsName, pstgPriority, grfMode, snbExclude, reserved) {
        pwcsName := pwcsName is String ? StrPtr(pwcsName) : pwcsName

        snbExcludeMarshal := snbExclude is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", pwcsName, "ptr", pstgPriority, "uint", grfMode, snbExcludeMarshal, snbExclude, "uint", reserved, "ptr*", &ppstg := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStorage(ppstg)
    }

    /**
     * Copies the entire contents of an open storage object to another storage object.
     * @remarks
     * This method merges elements contained in the source storage object with those already present in the destination. The layout of the destination storage object may differ from the source storage object.
     * 
     * The copy process is recursive, invoking <b>IStorage::CopyTo</b> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-copyto">IStream::CopyTo</a> on the elements nested inside the source.
     * 
     * When copying a stream on top of an existing stream with the same name, the existing stream is first removed and then replaced with the source stream. When copying a storage on top of an existing storage with the same name, the existing storage is not removed. As a result, after the copy operation, the destination 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> contains older elements, unless they were replaced by newer ones with the same names.
     * 
     * A storage object may expose interfaces other than 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a>, including 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irootstorage">IRootStorage</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a>. The <i>rgiidExclude</i> parameter permits the exclusion of any or all of these additional interfaces from the copy operation.
     * 
     * A caller with a newer or more efficient copy of an existing substorage or stream object may want to exclude the current versions of these objects from the copy operation. The <i>snbExclude</i> and <i>rgiidExclude</i> parameters provide two ways of excluding a storage objects existing storages or streams.
     * 
     * <h3><a id="Note_to_Callers"></a><a id="note_to_callers"></a><a id="NOTE_TO_CALLERS"></a>Note to Callers</h3>
     * The most common way to use the <b>IStorage::CopyTo</b> method is to copy everything from the source to the destination, as in most full-save and save-as operations.
     * 
     * The following  example code shows how to copy everything  from the source storage object to the destination storage object.
     * 
     * 
     * ```cpp
     * pstg->CopyTo(0, Null, Null, pstgDest)
     * ```
     * 
     * 
     * <div class="alert"><b>Note</b>  To compact a document file, call <b>CopyTo</b> on the root storage object and copy to a new storage object.</div>
     * <div> </div>
     * @param {Integer} ciidExclude The number of elements in the array pointed to by <i>rgiidExclude</i>. If <i>rgiidExclude</i> is <b>NULL</b>, then <i>ciidExclude</i> is ignored.
     * @param {Pointer<Guid>} rgiidExclude An array of interface identifiers (IIDs) that either the caller knows about and does not want copied or that the storage object does not support, but whose state the caller will later explicitly copy. The array can include 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a>, indicating that only stream objects are to be copied, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>, indicating that only storage objects are to be copied. An array length of zero indicates that only the state exposed by the 
     * <b>IStorage</b> object is to be copied; all other interfaces on the object are to be ignored. Passing <b>NULL</b> indicates that all interfaces on the object are to be copied.
     * @param {Pointer<Pointer<Integer>>} snbExclude A string name block (refer to 
     * <a href="https://docs.microsoft.com/windows/desktop/Stg/snb">SNB</a>) that specifies a block of storage or stream objects that are not to be copied to the destination. These elements are not created at the destination. If <b>IID_IStorage</b> is in the <i>rgiidExclude</i> array, this parameter is ignored. This parameter may be <b>NULL</b>.
     * @param {IStorage} pstgDest A pointer to the open storage object into which this storage object is to be copied. The destination storage object can be a different implementation of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface from the source storage object. Thus, <b>IStorage::CopyTo</b> can use only publicly available methods of the destination storage object. If <i>pstgDest</i> is open in transacted mode, it can be reverted by calling its 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-revert">IStorage::Revert</a> method.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The storage object was successfully copied.|
     * |E_PENDING | Asynchronous Storage only: Part or all of the data to be copied is currently unavailable. |
     * |STG_E_ACCESSDENIED | The destination storage object is a child of the source storage object.|
     * |STG_E_INSUFFICIENTMEMORY | The copy was not completed due to a lack of memory.|
     * |STG_E_INVALIDPOINTER | The pointer specified for the storage object was not valid.|
     * |STG_E_INVALIDPARAMETER | One of the parameters was not valid.|
     * |STG_E_TOOMANYOPENFILES | The copy was not completed because there are too many open files.|
     * |STG_E_REVERTED | The storage object has been invalidated by a revert operation above it in the transaction tree.|
     * |STG_E_MEDIUMFULL | The copy was not completed because the storage medium is full.|
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-istorage-copyto
     */
    CopyTo(ciidExclude, rgiidExclude, snbExclude, pstgDest) {
        snbExcludeMarshal := snbExclude is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "uint", ciidExclude, "ptr", rgiidExclude, snbExcludeMarshal, snbExclude, "ptr", pstgDest, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The MoveElementTo method copies or moves a substorage or stream from this storage object to another storage object.
     * @remarks
     * The <b>IStorage::MoveElementTo</b> method is typically the same as invoking the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-copyto">IStorage::CopyTo</a> method on the indicated element and then removing the source element. In this case, the 
     * <b>MoveElementTo</b> method uses only the publicly available functions of the destination storage object to carry out the move.
     * 
     * If the source and destination storage objects have special knowledge about each other's implementation (they could, for example, be different instances of the same implementation), this method can be implemented more efficiently.
     * 
     * Before calling this method, the element to be moved must be closed, and the destination storage must be open. Also, the destination object and element cannot be the same storage object/element name as the source of the move. That is, you cannot move an element to itself.
     * @param {PWSTR} pwcsName Pointer to a wide character null-terminated Unicode string that contains the name of the element in this storage object to be moved or copied.
     * @param {IStorage} pstgDest <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer to the destination storage object.
     * @param {PWSTR} pwcsNewName Pointer to a wide character null-terminated unicode string that contains the new name for the element in its new storage object.
     * @param {Integer} grfFlags Specifies whether the operation should be a move (STGMOVE_MOVE) or a copy (STGMOVE_COPY). See the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-stgmove">STGMOVE</a> enumeration.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The storage object was successfully copied or moved.|
     * |E_PENDING | Asynchronous Storage only: Part or all of the element's data is currently unavailable. |
     * |STG_E_ACCESSDENIED | The destination storage object is a child of the source storage object. Or, the destination object and element name are the same as the source object and element name. In other words, you cannot move an element to itself.|
     * |STG_E_FILENOTFOUND | The element with the specified name does not exist.|
     * |STG_E_FILEALREADYEXISTS | The specified file already exists.|
     * |STG_E_INSUFFICIENTMEMORY | The copy or move was not completed due to a lack of memory.|
     * |STG_E_INVALIDFLAG | The value for the *grfFlags* parameter is not valid.|
     * |STG_E_INVALIDNAME | Not a valid value for *pwcsName*.|
     * |STG_E_INVALIDPOINTER | The pointer specified for the storage object was not valid.|
     * |STG_E_INVALIDPARAMETER | One of the parameters was not valid.|
     * |STG_E_REVERTED | The storage object has been invalidated by a revert operation above it in the transaction tree.|
     * |STG_E_TOOMANYOPENFILES | The copy or move was not completed because there are too many open files.|
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-istorage-moveelementto
     */
    MoveElementTo(pwcsName, pstgDest, pwcsNewName, grfFlags) {
        pwcsName := pwcsName is String ? StrPtr(pwcsName) : pwcsName
        pwcsNewName := pwcsNewName is String ? StrPtr(pwcsNewName) : pwcsNewName

        result := ComCall(8, this, "ptr", pwcsName, "ptr", pstgDest, "ptr", pwcsNewName, "uint", grfFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Commit method ensures that any changes made to a storage object open in transacted mode are reflected in the parent storage.
     * @remarks
     * <b>IStorage::Commit</b> makes permanent changes to a storage object that is in transacted mode, in which changes are accumulated in a buffer, and not reflected in the storage object until there is a call to this method. The alternative is to open an object in direct mode, in which changes are immediately reflected in the storage object. An object opened in the direct mode does not require calling <b>IStorage::Commit</b> to make permanent changes in the storage object. Calling the <b>IStorage::Commit</b> method on a nonroot storage opened in direct mode has no effect. Opening a root storage object in direct mode ensures that changes in memory buffers are written to the underlying storage device.
     * 
     * The commit operation publishes the current changes in this storage object and its children to the next level up in the storage hierarchy. To undo current changes before committing them, call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-revert">IStorage::Revert</a> to roll back to the last-committed version.
     * 
     * Calling <b>IStorage::Commit</b> has no effect on currently opened nested elements of this storage object. They remain valid and can be used. However, the <b>IStorage::Commit</b> method does not automatically commit changes to these nested elements. The commit operation publishes only known changes to the next higher level in the storage hierarchy. Thus, transactions to nested levels must be committed to this storage object before they can be committed to higher levels.
     * 
     * In commit operations, you need to take steps to ensure that data is protected during the commit process:
     * 
     * <ul>
     * <li>When committing changes to root storage objects, the caller must check the return value to determine whether the operation has been completed successfully, and if not, that the old committed contents of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> are still intact and can be restored.</li>
     * <li>If this storage object was opened with some of its items excluded, the caller is responsible for rewriting them before calling commit. Write mode is required on the storage opening for the commit to succeed.</li>
     * <li>Unless prohibiting multiple simultaneous writers on the same storage object, an application calling this method should specify at least STGC_ONLYIFCURRENT in the <i>grfCommitFlags</i> parameter to prevent the changes made by one writer from inadvertently overwriting the changes made by another.</li>
     * </ul>
     * If the STGC_CONSOLIDATE flag is not supported by a storage implementation, calling <b>IStorage::Commit</b> with STGC_CONSOLIDATE specified in the <i>grfCommitFlags</i> parameter returns the value STG_E_INVALIDFLAG.
     * @param {Integer} grfCommitFlags Controls how the changes are committed to the storage object. See the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-stgc">STGC</a> enumeration for a definition of these values.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | Changes to the storage object were successfully committed to the parent level. If STGC_CONSOLIDATE was specified, the storage was successfully consolidated, or the storage was already too compact to consolidate further.|
     * |STG_S_MULTIPLEOPENS | The commit operation succeeded, but the storage could not be consolidated because it had been opened multiple times using the STGM_NOSNAPSHOT flag.|
     * |STG_S_CANNOTCONSOLIDATE | The commit operation succeeded, but the storage could not be consolidated due to an incorrect storage mode. For compound files, the storage may have been opened using the STGM_NOSCRATCH flag, or the storage may not be the outermost transacted level.|
     * |STG_S_CONSOLIDATIONFAILED | The commit operation succeeded, but the storage could not be consolidated due to an internal error (for example, a memory allocation failure).|
     * |E_PENDING | Asynchronous storage only: Part or all of the data to be committed is currently unavailable.|
     * |STG_E_INVALIDFLAG | The value for the *grfCommitFlags* parameter is not valid.|
     * |STG_E_INVALIDPARAMETER | One of the parameters was not valid.|
     * |STG_E_NOTCURRENT | Another open instance of the storage object has committed changes. As a result, the current commit operation may overwrite previous changes.|
     * |STG_E_MEDIUMFULL | No space left on device to commit.|
     * |STG_E_TOOMANYOPENFILES | The commit operation could not be completed because there are too many open files.|
     * |STG_E_REVERTED | The storage object has been invalidated by a revert operation above it in the transaction tree.|
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-istorage-commit
     */
    Commit(grfCommitFlags) {
        result := ComCall(9, this, "uint", grfCommitFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Revert method discards all changes that have been made to the storage object since the last commit operation.
     * @remarks
     * For storage objects opened in transacted mode, the <b>IStorage::Revert</b> method discards any uncommitted changes to this storage object or changes that have been committed to this storage object from nested elements.
     * 
     * After this method returns, any existing elements (substorages or streams) that were opened from the reverted storage object are invalid and can no longer be used. Specifying these reverted elements in any call except <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> returns the error STG_E_REVERTED
     * 
     * This method has no effect on storage objects opened in direct mode.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The revert operation was successful.|
     * |E_PENDING | Asynchronous Storage only: Part or all of the storage's data is currently unavailable. |
     * |STG_E_INSUFFICIENTMEMORY | The revert operation could not be completed due to a lack of memory.|
     * |STG_E_TOOMANYOPENFILES | The revert operation could not be completed because there are too many open files.|
     * |STG_E_REVERTED | The storage object has been invalidated by a revert operation above it in the transaction tree.|
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-istorage-revert
     */
    Revert() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The EnumElements method retrieves a pointer to an enumerator object that can be used to enumerate the storage and stream objects contained within this storage object.
     * @remarks
     * The enumerator object returned by this method implements the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstatstg">IEnumSTATSTG</a> interface, one of the standard enumerator interfaces that contain the <b>Next</b>, <b>Reset</b>, 
     * <b>Clone</b>, and <b>Skip</b> methods. 
     * <b>IEnumSTATSTG</b> enumerates the data stored in an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statstg">STATSTG</a> structures.
     * 
     * The storage object must be open in read mode to allow the enumeration of its elements.
     * 
     * The enumerator object is permitted to enumerate the elements in any order.
     * The enumerator object is also permitted to treat the enumeration as a snapshot
     * or to have the enumeration reflect the current state of the storage object.
     * @returns {IEnumSTATSTG} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstatstg">IEnumSTATSTG</a>* pointer variable that receives the interface pointer to the new enumerator object.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-istorage-enumelements
     */
    EnumElements() {
        static reserved1 := 0, reserved2 := 0, reserved3 := 0 ;Reserved parameters must always be NULL

        result := ComCall(11, this, "uint", reserved1, "ptr", reserved2, "uint", reserved3, "ptr*", &ppenum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumSTATSTG(ppenum)
    }

    /**
     * Removes the specified storage or stream from this storage object.
     * @remarks
     * The 
     * <b>DestroyElement</b> method deletes a substorage or stream from the current storage object. After a successful call to 
     * <b>DestroyElement</b>, any open instance of the destroyed element from the parent storage becomes invalid.
     * 
     * If a storage object is opened in the transacted mode, destruction of an element requires that the call to 
     * <b>DestroyElement</b> be followed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-commit">IStorage::Commit</a>.
     * 
     * <div class="alert"><b>Note</b>  The <b>DestroyElement</b> method does not shrink the directory stream.  It only marks the deleted directory entry as invalid.  Invalid entries are reused when creating a new storage or stream.  <p class="note">For content streams, the deleted stream sectors are marked as free. If the free sectors are at the end of the file, the document file should shrink.  To compact a document file, call <b>IStorage::CopyTo</b> on the root storage object and copy to a new storage object.
     * 
     * </div>
     * <div> </div>
     * @param {PWSTR} pwcsName A pointer to a wide character null-terminated Unicode string that contains the name of the storage or stream to be removed.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The element was successfully removed.|
     * |E_PENDING | Asynchronous Storage only: Part or all of the element data is currently unavailable. |
     * |STG_E_ACCESSDENIED | The caller does not have permissions to remove the element.|
     * |STG_E_FILENOTFOUND | The element with the specified name does not exist.|
     * |STG_E_INSUFFICIENTMEMORY | The element was not removed due to a lack of memory.|
     * |STG_E_INVALIDNAME | Invalid value for *pwcsName*.|
     * |STG_E_INVALIDPOINTER | The pointer specified for the element was not valid.|
     * |STG_E_INVALIDPARAMETER | One of the parameters was not valid.|
     * |STG_E_REVERTED | The storage object has been invalidated by a revert operation above it in the transaction tree.|
     * |STG_E_TOOMANYOPENFILES | The element was not removed because there are too many open files.|
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-istorage-destroyelement
     */
    DestroyElement(pwcsName) {
        pwcsName := pwcsName is String ? StrPtr(pwcsName) : pwcsName

        result := ComCall(12, this, "ptr", pwcsName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The RenameElement method renames the specified substorage or stream in this storage object.
     * @remarks
     * <b>IStorage::RenameElement</b> renames the specified substorage or stream in this storage object. An element in a storage object cannot be renamed while it is open. The rename operation is subject to committing the changes if the storage is open in transacted mode.
     * 
     * The <b>IStorage::RenameElement</b> method is not guaranteed to work in low memory with storage objects open in transacted mode. It may work in direct mode.
     * @param {PWSTR} pwcsOldName Pointer to a wide character null-terminated Unicode string that contains the name of the substorage or stream to be changed.
     * 
     * <div class="alert"><b>Note</b>  The <i>pwcsName</i>, created in <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-createstorage">CreateStorage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-createstream">CreateStream</a> must not exceed 31 characters in length, not including the string terminator.</div>
     * <div> </div>
     * @param {PWSTR} pwcsNewName Pointer to a wide character null-terminated unicode string that contains the new name for the specified substorage or stream.
     * 
     * <div class="alert"><b>Note</b>  The <i>pwcsName</i>, created in <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-createstorage">CreateStorage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-createstream">CreateStream</a> must not exceed 31 characters in length, not including the string terminator.</div>
     * <div> </div>
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The element was successfully renamed.|
     * |E_PENDING | Asynchronous Storage only: Part or all of the element's data is currently unavailable.|
     * |STG_E_ACCESSDENIED | The caller does not have enough permissions for renaming the element.|
     * |STG_E_FILENOTFOUND | The element with the specified old name does not exist.|
     * |STG_E_FILEALREADYEXISTS | The element specified by the new name already exists.|
     * |STG_E_INSUFFICIENTMEMORY | The element was not renamed due to a lack of memory.|
     * |STG_E_INVALIDNAME | Invalid value for one of the names.|
     * |STG_E_INVALIDPOINTER | The pointer specified for the element was not valid.|
     * |STG_E_INVALIDPARAMETER | One of the parameters was not valid.|
     * |STG_E_REVERTED | The storage object has been invalidated by a revert operation above it in the transaction tree.|
     * |STG_E_TOOMANYOPENFILES | The element was not renamed because there are too many open files.|
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-istorage-renameelement
     */
    RenameElement(pwcsOldName, pwcsNewName) {
        pwcsOldName := pwcsOldName is String ? StrPtr(pwcsOldName) : pwcsOldName
        pwcsNewName := pwcsNewName is String ? StrPtr(pwcsNewName) : pwcsNewName

        result := ComCall(13, this, "ptr", pwcsOldName, "ptr", pwcsNewName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetElementTimes method sets the modification, access, and creation times of the specified storage element, if the underlying file system supports this method.
     * @remarks
     * <b>SetElementTimes</b>  sets time statistics for the specified storage element within this storage object.
     * 
     * Not all file systems support all the time values. This method sets those times that are supported and ignores the rest. Each time-value parameter can be <b>NULL</b>; indicating that no modification should occur.
     * 
     * Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-stat">IStorage::Stat</a> method to retrieve these time values.
     * @param {PWSTR} pwcsName The name of the storage object element whose times are to be modified. If <b>NULL</b>, the time is set on the root storage rather than one of its elements.
     * @param {Pointer<FILETIME>} pctime Either the new creation time for the element or <b>NULL</b> if the creation time is not to be modified.
     * @param {Pointer<FILETIME>} patime Either the new access time for the element or <b>NULL</b> if the access time is not to be modified.
     * @param {Pointer<FILETIME>} pmtime Either the new modification time for the element or <b>NULL</b> if the modification time is not to be modified.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The time values were successfully set.|
     * |E_PENDING | Asynchronous Storage only: Part or all of the element's data is currently unavailable.|
     * |STG_E_ACCESSDENIED | The caller does not have enough permissions for changing the element.|
     * |STG_E_FILENOTFOUND | The element with the specified name does not exist.|
     * |STG_E_INSUFFICIENTMEMORY | The element was not changed due to a lack of memory.|
     * |STG_E_INVALIDNAME | Not a valid value for the element name.|
     * |STG_E_INVALIDPOINTER | The pointer specified for the element was not valid.|
     * |STG_E_INVALIDPARAMETER | One of the parameters was not valid.|
     * |STG_E_TOOMANYOPENFILES | The element was not changed because there are too many open files.|
     * |STG_E_REVERTED | The storage object has been invalidated by a revert operation above it in the transaction tree.|
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-istorage-setelementtimes
     */
    SetElementTimes(pwcsName, pctime, patime, pmtime) {
        pwcsName := pwcsName is String ? StrPtr(pwcsName) : pwcsName

        result := ComCall(14, this, "ptr", pwcsName, "ptr", pctime, "ptr", patime, "ptr", pmtime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetClass method assigns the specified class identifier (CLSID) to this storage object.
     * @remarks
     * When first created, a storage object has an associated CLSID of CLSID_NULL. Call <b>SetClass</b> to assign a CLSID to the storage object.
     * 
     * Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-stat">IStorage::Stat</a> method to retrieve the current CLSID of a storage object.
     * @param {Pointer<Guid>} clsid The CLSID that is to be associated with the storage object.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The CLSID was successfully assigned.|
     * |E_PENDING | Asynchronous Storage only: Part or all of the storage's data is currently unavailable.|
     * |STG_E_ACCESSDENIED | The caller does not have enough permissions for assigning a CLSID to the storage object.|
     * |STG_E_MEDIUMFULL | Not enough space was left on device to complete the operation.|
     * |STG_E_REVERTED | The storage object has been invalidated by a revert operation above it in the transaction tree.|
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-istorage-setclass
     */
    SetClass(clsid) {
        result := ComCall(15, this, "ptr", clsid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetStateBits method stores up to 32 bits of state information in this storage object.
     * @remarks
     * The values for the state bits are not currently defined.
     * @param {Integer} grfStateBits Specifies the new values of the bits to set. No legal values are defined for these bits; they are all reserved for future use and must not be used by applications.
     * @param {Integer} grfMask A binary mask indicating which bits in <i>grfStateBits</i> are significant in this call.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The state information was successfully set.|
     * |E_PENDING | Asynchronous Storage only: Part or all of the storage's data is currently unavailable. |
     * |STG_E_ACCESSDENIED | The caller does not have enough permissions for changing this storage object.|
     * |STG_E_INVALIDFLAG | The value for the grfStateBits or *grfMask* parameter is not valid.|
     * |STG_E_INVALIDPARAMETER | One of the parameters was not valid.|
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-istorage-setstatebits
     */
    SetStateBits(grfStateBits, grfMask) {
        result := ComCall(16, this, "uint", grfStateBits, "uint", grfMask, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Stat method retrieves the STATSTG structure for this open storage object.
     * @remarks
     * <b>IStorage::Stat</b> retrieves the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statstg">STATSTG</a> structure for the current storage object. The 
     * <b>STATSTG</b> structure contains statistical information about the storage object. <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-enumelements">IStorage::EnumElements</a> returns a pointer to an enumerator object. The enumerator object returned by this method implements the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstatstg">IEnumSTATSTG</a> interface, through which the data stored in the array of the 
     * <b>STATSTG</b> structures is enumerated.
     * @param {Integer} grfStatFlag Specifies that some of the members in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statstg">STATSTG</a> structure are not returned, thus saving a memory allocation operation. Values are taken from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-statflag">STATFLAG</a> enumeration.
     * @returns {STATSTG} On return, pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statstg">STATSTG</a> structure where this method places information about the open storage object. This parameter is <b>NULL</b> if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-istorage-stat
     */
    Stat(grfStatFlag) {
        pstatstg := STATSTG()
        result := ComCall(17, this, "ptr", pstatstg, "uint", grfStatFlag, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pstatstg
    }
}
