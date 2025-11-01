#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 * @version v4.0.30319
 */
class ProjectedFileSystem {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Configures a ProjFS virtualization instance and starts it, making it available to service I/O and invoke callbacks on the provider.
     * @param {PWSTR} virtualizationRootPath Pointer to a null-terminated unicode string specifying the full path to the virtualization root directory.
     * 
     * The provider must have called <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjmarkdirectoryasplaceholder">PrjMarkDirectoryAsPlaceholder</a> passing the specified path as the rootPathName parameter and NULL as the targetPathName parameter before calling this routine. This only needs to be done once to designate the path as the virtualization root directory
     * @param {Pointer<PRJ_CALLBACKS>} callbacks Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/ns-projectedfslib-prj_callbacks">PRJ_CALLBACKS</a> structure that has been initialized with PrjCommandCallbacksInit and filled in with pointers to the provider's callback functions.
     * @param {Pointer<Void>} instanceContext Pointer to context information defined by the provider for each instance. This parameter is optional and can be NULL. If it is specified, ProjFS will return it in the InstanceContext member of <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/ns-projectedfslib-prj_callback_data">PRJ_CALLBACK_DATA</a> when invoking provider callback routines.
     * @param {Pointer<PRJ_STARTVIRTUALIZING_OPTIONS>} options An optional pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/ns-projectedfslib-prj_startvirtualizing_options">PRJ_STARTVIRTUALIZING_OPTIONS</a>.
     * @param {Pointer<PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT>} namespaceVirtualizationContext On success returns an opaque handle to the ProjFS virtualization instance. 
     * The provider passes this value when calling functions that require a PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT as input.
     * @returns {HRESULT} The error, HRESULT_FROM_WIN32(ERROR_REPARSE_TAG_MISMATCH), indicates that virtualizationRootPath has not been configured as a virtualization root.
     * @see https://docs.microsoft.com/windows/win32/api//projectedfslib/nf-projectedfslib-prjstartvirtualizing
     * @since windows10.0.17763
     */
    static PrjStartVirtualizing(virtualizationRootPath, callbacks, instanceContext, options, namespaceVirtualizationContext) {
        virtualizationRootPath := virtualizationRootPath is String ? StrPtr(virtualizationRootPath) : virtualizationRootPath

        instanceContextMarshal := instanceContext is VarRef ? "ptr" : "ptr"

        result := DllCall("PROJECTEDFSLIB.dll\PrjStartVirtualizing", "ptr", virtualizationRootPath, "ptr", callbacks, instanceContextMarshal, instanceContext, "ptr", options, "ptr", namespaceVirtualizationContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Stops a running ProjFS virtualization instance, making it unavailable to service I/O or involve callbacks on the provider.
     * @param {PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT} namespaceVirtualizationContext An opaque handle for the virtualization instance.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//projectedfslib/nf-projectedfslib-prjstopvirtualizing
     * @since windows10.0.17763
     */
    static PrjStopVirtualizing(namespaceVirtualizationContext) {
        namespaceVirtualizationContext := namespaceVirtualizationContext is Win32Handle ? NumGet(namespaceVirtualizationContext, "ptr") : namespaceVirtualizationContext

        DllCall("PROJECTEDFSLIB.dll\PrjStopVirtualizing", "ptr", namespaceVirtualizationContext)
    }

    /**
     * Purges the virtualization instance's negative path cache, if it is active.
     * @param {PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT} namespaceVirtualizationContext Opaque handle for the virtualization instance.
     * @param {Pointer<Integer>} totalEntryNumber Optional pointer to a variable that receives the number of paths that were in the cache before it was purged.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//projectedfslib/nf-projectedfslib-prjclearnegativepathcache
     * @since windows10.0.17763
     */
    static PrjClearNegativePathCache(namespaceVirtualizationContext, totalEntryNumber) {
        namespaceVirtualizationContext := namespaceVirtualizationContext is Win32Handle ? NumGet(namespaceVirtualizationContext, "ptr") : namespaceVirtualizationContext

        totalEntryNumberMarshal := totalEntryNumber is VarRef ? "uint*" : "ptr"

        result := DllCall("PROJECTEDFSLIB.dll\PrjClearNegativePathCache", "ptr", namespaceVirtualizationContext, totalEntryNumberMarshal, totalEntryNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves information about the virtualization instance.
     * @param {PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT} namespaceVirtualizationContext An opaque handle for the virtualization instance.
     * @param {Pointer<PRJ_VIRTUALIZATION_INSTANCE_INFO>} virtualizationInstanceInfo On input points to a buffer to fill with information about the virtualization instance. On successful return the buffer is filled in.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//projectedfslib/nf-projectedfslib-prjgetvirtualizationinstanceinfo
     * @since windows10.0.17763
     */
    static PrjGetVirtualizationInstanceInfo(namespaceVirtualizationContext, virtualizationInstanceInfo) {
        namespaceVirtualizationContext := namespaceVirtualizationContext is Win32Handle ? NumGet(namespaceVirtualizationContext, "ptr") : namespaceVirtualizationContext

        result := DllCall("PROJECTEDFSLIB.dll\PrjGetVirtualizationInstanceInfo", "ptr", namespaceVirtualizationContext, "ptr", virtualizationInstanceInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts an existing directory to a directory placeholder.
     * @param {PWSTR} rootPathName A null-terminated Unicode string specifying the full path to the virtualization root.
     * @param {PWSTR} targetPathName A null-terminated Unicode string specifying the full path to the directory to convert to a placeholder.
     * 
     * 
     * If this parameter is not specified or is an empty string, then this means the caller wants to designate rootPathName as the virtualization root. The provider only needs to do this one time, upon establishing a new virtualization instance.
     * @param {Pointer<PRJ_PLACEHOLDER_VERSION_INFO>} versionInfo Optional version information for the target placeholder. The provider chooses what information to put in the <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/ns-projectedfslib-prj_placeholder_version_info">PRJ_PLACEHOLDER_VERSION_INFO</a> structure. If not specified, the placeholder gets zeros for its version information.
     * @param {Pointer<Guid>} virtualizationInstanceID A value that identifies the virtualization instance.
     * @returns {HRESULT} HRESULT_FROM_WIN32(ERROR_REPARSE_POINT_ENCOUNTERED) typically means the directory at targetPathName has a reparse point on it. HRESULT_FROM_WIN32(ERROR_DIRECTORY) typically means the targetPathName does not specify a directory.
     * @see https://docs.microsoft.com/windows/win32/api//projectedfslib/nf-projectedfslib-prjmarkdirectoryasplaceholder
     * @since windows10.0.17763
     */
    static PrjMarkDirectoryAsPlaceholder(rootPathName, targetPathName, versionInfo, virtualizationInstanceID) {
        rootPathName := rootPathName is String ? StrPtr(rootPathName) : rootPathName
        targetPathName := targetPathName is String ? StrPtr(targetPathName) : targetPathName

        result := DllCall("PROJECTEDFSLIB.dll\PrjMarkDirectoryAsPlaceholder", "ptr", rootPathName, "ptr", targetPathName, "ptr", versionInfo, "ptr", virtualizationInstanceID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sends file or directory metadata to ProjFS.
     * @param {PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT} namespaceVirtualizationContext Opaque handle for the virtualization instance. This must be the value from the VirtualizationInstanceHandle member of the callbackData passed to the provider in the <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_placeholder_info_cb">PRJ_GET_PLACEHOLDER_INFO_CB</a> callback.
     * @param {PWSTR} destinationFileName A null-terminated Unicode string specifying the path, relative to the virtualization root, to the file or directory for which to create a placeholder. 
     * 
     * This must be a match to the FilePathName member of the callbackData parameter passed to the provider in the <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_placeholder_info_cb">PRJ_GET_PLACEHOLDER_INFO_CB</a> callback. The provider should use the PrjFileNameCompare function to determine whether the two names match. 
     * 
     * 
     * For example, if the <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_placeholder_info_cb">PRJ_GET_PLACEHOLDER_INFO_CB</a> callback specifies “dir1\dir1\FILE.TXT” in callbackData-&gt;FilePathName, and the provider’s backing store contains a file called “File.txt” in the dir1\dir2 directory, and <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjfilenamecompare">PrjFileNameCompare</a> returns 0 when comparing the names “FILE.TXT” and “File.txt”, then the provider specifies “dir1\dir2\File.txt” as the value of this parameter.
     * @param {Pointer} placeholderInfo A pointer to the metadata for the file or directory.
     * @param {Integer} placeholderInfoSize Size in bytes of the buffer pointed to by placeholderInfo.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//projectedfslib/nf-projectedfslib-prjwriteplaceholderinfo
     * @since windows10.0.17763
     */
    static PrjWritePlaceholderInfo(namespaceVirtualizationContext, destinationFileName, placeholderInfo, placeholderInfoSize) {
        namespaceVirtualizationContext := namespaceVirtualizationContext is Win32Handle ? NumGet(namespaceVirtualizationContext, "ptr") : namespaceVirtualizationContext
        destinationFileName := destinationFileName is String ? StrPtr(destinationFileName) : destinationFileName

        result := DllCall("PROJECTEDFSLIB.dll\PrjWritePlaceholderInfo", "ptr", namespaceVirtualizationContext, "ptr", destinationFileName, "ptr", placeholderInfo, "uint", placeholderInfoSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sends file or directory metadata to ProjFS and allows the caller to specify extended information.
     * @param {PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT} namespaceVirtualizationContext Opaque handle for the virtualization instance. This must be the value from the VirtualizationInstanceHandle member of the callbackData passed to the provider in the <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_placeholder_info_cb">PRJ_GET_PLACEHOLDER_INFO_CB</a> callback.
     * @param {PWSTR} destinationFileName A null-terminated Unicode string specifying the path, relative to the virtualization root, to the file or directory for which to create a placeholder.
     * 
     * This must be a match to the FilePathName member of the callbackData parameter passed to the provider in the <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_placeholder_info_cb">PRJ_GET_PLACEHOLDER_INFO_CB</a> callback. The provider should use the PrjFileNameCompare function to determine whether the two names match.
     * 
     * For example, if the <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_placeholder_info_cb">PRJ_GET_PLACEHOLDER_INFO_CB</a> callback specifies “dir1\dir1\FILE.TXT” in callbackData-&gt;FilePathName, and the provider’s backing store contains a file called “File.txt” in the dir1\dir2 directory, and <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjfilenamecompare">PrjFileNameCompare</a> returns 0 when comparing the names “FILE.TXT” and “File.txt”, then the provider specifies “dir1\dir2\File.txt” as the value of this parameter.
     * @param {Pointer} placeholderInfo A pointer to the metadata for the file or directory.
     * @param {Integer} placeholderInfoSize Size in bytes of the buffer pointed to by placeholderInfo.
     * @param {Pointer<PRJ_EXTENDED_INFO>} ExtendedInfo 
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//projectedfslib/nf-projectedfslib-prjwriteplaceholderinfo2
     * @since windows10.0.19041
     */
    static PrjWritePlaceholderInfo2(namespaceVirtualizationContext, destinationFileName, placeholderInfo, placeholderInfoSize, ExtendedInfo) {
        namespaceVirtualizationContext := namespaceVirtualizationContext is Win32Handle ? NumGet(namespaceVirtualizationContext, "ptr") : namespaceVirtualizationContext
        destinationFileName := destinationFileName is String ? StrPtr(destinationFileName) : destinationFileName

        result := DllCall("PROJECTEDFSLIB.dll\PrjWritePlaceholderInfo2", "ptr", namespaceVirtualizationContext, "ptr", destinationFileName, "ptr", placeholderInfo, "uint", placeholderInfoSize, "ptr", ExtendedInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Enables a provider to update an item that has been cached on the local file system.
     * @param {PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT} namespaceVirtualizationContext Opague handle for the virtualization instance.
     * @param {PWSTR} destinationFileName A null-terminated Unicode string specifying the path, relative to the virtualization root, to the file or directory to be updated.
     * @param {Pointer} placeholderInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/ns-projectedfslib-prj_placeholder_info">PRJ_PLACEHOLDER_INFO</a> buffer containing the updated metadata for the file or directory. 
     * 
     * 
     * If placeholderInfo-&gt;VersionInfo.ContentID contains a content identifier that is the same as the content identifier already on the file/directory, the call succeeds and no update takes place. Otherwise, if the call succeeds then placeholderInfo-&gt;VersionInfo.ContentID replaces the existing content identifier on the file.
     * @param {Integer} placeholderInfoSize The size in bytes of the buffer pointed to by placeholderInfo.
     * @param {Integer} updateFlags Flags to control updates.
     * 
     * If the item is a dirty placeholder, full file, or tombstone, and the provider does not specify the appropriate flag(s), this routine will fail to update the placeholder
     * @param {Pointer<Integer>} failureReason Optional pointer to receive a code describing the reason an update failed.
     * @returns {HRESULT} If an HRESULT_FROM_WIN32(ERROR_FILE_SYSTEM_VIRTUALIZATION_INVALID_OPERATION) error is returned, the update failed due to the item's state and the value of updateFlags. failureReason, if specified, will describe the reason for the failure.
     * @see https://docs.microsoft.com/windows/win32/api//projectedfslib/nf-projectedfslib-prjupdatefileifneeded
     * @since windows10.0.17763
     */
    static PrjUpdateFileIfNeeded(namespaceVirtualizationContext, destinationFileName, placeholderInfo, placeholderInfoSize, updateFlags, failureReason) {
        namespaceVirtualizationContext := namespaceVirtualizationContext is Win32Handle ? NumGet(namespaceVirtualizationContext, "ptr") : namespaceVirtualizationContext
        destinationFileName := destinationFileName is String ? StrPtr(destinationFileName) : destinationFileName

        failureReasonMarshal := failureReason is VarRef ? "int*" : "ptr"

        result := DllCall("PROJECTEDFSLIB.dll\PrjUpdateFileIfNeeded", "ptr", namespaceVirtualizationContext, "ptr", destinationFileName, "ptr", placeholderInfo, "uint", placeholderInfoSize, "int", updateFlags, failureReasonMarshal, failureReason, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Enables a provider to delete an item that has been cached on the local file system.
     * @param {PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT} namespaceVirtualizationContext An opaque handle for the virtualization instance.
     * @param {PWSTR} destinationFileName A null-terminated Unicode string specifying the path, relative to the virtualization root, to the file or directory to be deleted.
     * @param {Integer} updateFlags Flags to control the delete operation should be allowed given the state of the file.
     * @param {Pointer<Integer>} failureReason Optional pointer to receive a code describing the reason a delete failed.
     * @returns {HRESULT} If an HRESULT_FROM_WIN32(ERROR_FILE_SYSTEM_VIRTUALIZATION_INVALID_OPERATION) error is returned, the update failed due to the item's state and the value of updateFlags. failureReason, if specified, will describe the reason for the failure.
     * @see https://docs.microsoft.com/windows/win32/api//projectedfslib/nf-projectedfslib-prjdeletefile
     * @since windows10.0.17763
     */
    static PrjDeleteFile(namespaceVirtualizationContext, destinationFileName, updateFlags, failureReason) {
        namespaceVirtualizationContext := namespaceVirtualizationContext is Win32Handle ? NumGet(namespaceVirtualizationContext, "ptr") : namespaceVirtualizationContext
        destinationFileName := destinationFileName is String ? StrPtr(destinationFileName) : destinationFileName

        failureReasonMarshal := failureReason is VarRef ? "int*" : "ptr"

        result := DllCall("PROJECTEDFSLIB.dll\PrjDeleteFile", "ptr", namespaceVirtualizationContext, "ptr", destinationFileName, "int", updateFlags, failureReasonMarshal, failureReason, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * TBD.
     * @param {PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT} namespaceVirtualizationContext Opaque handle for the virtualization instance. 
     * 
     * 
     * If the provider is servicing a <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_file_data_cb">PRJ_GET_FILE_DATA_CB</a> callback, this must be the value from the VirtualizationInstanceHandle member of the callbackData passed to the provider in the callback.
     * @param {Pointer<Guid>} dataStreamId Identifier for the data stream to write to. 
     * 
     * 
     * If the provider is servicing a <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_file_data_cb">PRJ_GET_FILE_DATA_CB</a> callback, this must be the value from the DataStreamId member of the callbackData passed to the provider in the callback.
     * @param {Pointer} buffer Pointer to a buffer containing the data to write. The buffer must be at least as large as the value of the length parameter in bytes. The provider should use <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjallocatealignedbuffer">PrjAllocateAlignedBuffer</a> to ensure that the buffer meets the storage device's alignment requirements.
     * @param {Integer} byteOffset Byte offset from the beginning of the file at which to write the data.
     * @param {Integer} length The number of bytes to write to the file.
     * @returns {HRESULT} HRESULT_FROM_WIN32(ERROR_OFFSET_ALIGNMENT_VIOLATION) indicates that the user's handle was opened for unbuffered I/O and byteOffset is not aligned to the sector size of the storage device.
     * @see https://docs.microsoft.com/windows/win32/api//projectedfslib/nf-projectedfslib-prjwritefiledata
     * @since windows10.0.17763
     */
    static PrjWriteFileData(namespaceVirtualizationContext, dataStreamId, buffer, byteOffset, length) {
        namespaceVirtualizationContext := namespaceVirtualizationContext is Win32Handle ? NumGet(namespaceVirtualizationContext, "ptr") : namespaceVirtualizationContext

        result := DllCall("PROJECTEDFSLIB.dll\PrjWriteFileData", "ptr", namespaceVirtualizationContext, "ptr", dataStreamId, "ptr", buffer, "uint", byteOffset, "uint", length, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the on-disk file state for a file or directory.
     * @param {PWSTR} destinationFileName A null-terminated Unicode string specifying the full path to the file whose state is to be queried.
     * @param {Pointer<Integer>} fileState This is a combination of one or more PRJ_FILE_STATE values describing the file state.
     * @returns {HRESULT} HRESULT_FROM_WIN32(ERROR_FILE_NOT_FOUND) indicates destinationFileName does not exist. HRESULT_FROM_WIN32(ERROR_PATH_NOT_FOUND) indicates that an intermediate component of the path to destinationFileName does not exist.
     * @see https://docs.microsoft.com/windows/win32/api//projectedfslib/nf-projectedfslib-prjgetondiskfilestate
     * @since windows10.0.17763
     */
    static PrjGetOnDiskFileState(destinationFileName, fileState) {
        destinationFileName := destinationFileName is String ? StrPtr(destinationFileName) : destinationFileName

        fileStateMarshal := fileState is VarRef ? "int*" : "ptr"

        result := DllCall("PROJECTEDFSLIB.dll\PrjGetOnDiskFileState", "ptr", destinationFileName, fileStateMarshal, fileState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Allocates a buffer that meets the memory alignment requirements of the virtualization instance's storage device.
     * @param {PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT} namespaceVirtualizationContext Opaque handle for the virtualization instance.
     * @param {Pointer} size The size of the buffer required, in bytes.
     * @returns {Pointer<Void>} Returns NULL if the buffer could not be allocated.
     * @see https://docs.microsoft.com/windows/win32/api//projectedfslib/nf-projectedfslib-prjallocatealignedbuffer
     * @since windows10.0.17763
     */
    static PrjAllocateAlignedBuffer(namespaceVirtualizationContext, size) {
        namespaceVirtualizationContext := namespaceVirtualizationContext is Win32Handle ? NumGet(namespaceVirtualizationContext, "ptr") : namespaceVirtualizationContext

        result := DllCall("PROJECTEDFSLIB.dll\PrjAllocateAlignedBuffer", "ptr", namespaceVirtualizationContext, "ptr", size, "ptr")
        return result
    }

    /**
     * Frees an allocated buffer.
     * @param {Pointer<Void>} buffer The buffer to free.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//projectedfslib/nf-projectedfslib-prjfreealignedbuffer
     * @since windows10.0.17763
     */
    static PrjFreeAlignedBuffer(buffer) {
        bufferMarshal := buffer is VarRef ? "ptr" : "ptr"

        DllCall("PROJECTEDFSLIB.dll\PrjFreeAlignedBuffer", bufferMarshal, buffer)
    }

    /**
     * Indicates that the provider has completed processing a callback from which it had previously returned HRESULT_FROM_WIN32(ERROR_IO_PENDING).
     * @param {PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT} namespaceVirtualizationContext Opaque handle for the virtualization instance. This must be the value from the VirtualizationInstanceHandle member of the callbackData passed to the provider in the callback that is being complete.
     * @param {Integer} commandId A value identifying the callback invocation that the provider is completing. This must be the value from the CommandId member of the callbackData passed to the provider in the callback that is being completed.
     * @param {HRESULT} completionResult The final HRESULT of the operation.
     * @param {Pointer<PRJ_COMPLETE_COMMAND_EXTENDED_PARAMETERS>} extendedParameters Optional pointer to extended parameters required for completing certain callbacks.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//projectedfslib/nf-projectedfslib-prjcompletecommand
     * @since windows10.0.17763
     */
    static PrjCompleteCommand(namespaceVirtualizationContext, commandId, completionResult, extendedParameters) {
        namespaceVirtualizationContext := namespaceVirtualizationContext is Win32Handle ? NumGet(namespaceVirtualizationContext, "ptr") : namespaceVirtualizationContext

        result := DllCall("PROJECTEDFSLIB.dll\PrjCompleteCommand", "ptr", namespaceVirtualizationContext, "int", commandId, "int", completionResult, "ptr", extendedParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Provides information for one file or directory to an enumeration.
     * @param {PWSTR} fileName A pointer to a null-terminated string that contains the name of the entry
     * @param {Pointer<PRJ_FILE_BASIC_INFO>} fileBasicInfo Basic information about the entry to be filled.
     * @param {PRJ_DIR_ENTRY_BUFFER_HANDLE} dirEntryBufferHandle An opaque handle to a structure that receives information about the filled entries.
     * @returns {HRESULT} HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER) indicates that dirEntryBufferHandle doesn't have enough space for the new entry.
     * @see https://docs.microsoft.com/windows/win32/api//projectedfslib/nf-projectedfslib-prjfilldirentrybuffer
     * @since windows10.0.17763
     */
    static PrjFillDirEntryBuffer(fileName, fileBasicInfo, dirEntryBufferHandle) {
        fileName := fileName is String ? StrPtr(fileName) : fileName
        dirEntryBufferHandle := dirEntryBufferHandle is Win32Handle ? NumGet(dirEntryBufferHandle, "ptr") : dirEntryBufferHandle

        result := DllCall("PROJECTEDFSLIB.dll\PrjFillDirEntryBuffer", "ptr", fileName, "ptr", fileBasicInfo, "ptr", dirEntryBufferHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Provides information for one file or directory to an enumeration and allows the caller to specify extended information.
     * @param {PRJ_DIR_ENTRY_BUFFER_HANDLE} dirEntryBufferHandle An opaque handle to a structure that receives information about the filled entries.
     * @param {PWSTR} fileName A pointer to a null-terminated string that contains the name of the entry
     * @param {Pointer<PRJ_FILE_BASIC_INFO>} fileBasicInfo Basic information about the entry to be filled.
     * @param {Pointer<PRJ_EXTENDED_INFO>} extendedInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/ns-projectedfslib-prj_extended_info">PRJ_EXTENDED_INFO</a> struct specifying extended information about the entry to be filled.
     * @returns {HRESULT} HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER) indicates that dirEntryBufferHandle doesn't have enough space for the new entry.
     * 
     * E_INVALIDARG indicates that extendedInfo.InfoType is unrecognized.
     * @see https://docs.microsoft.com/windows/win32/api//projectedfslib/nf-projectedfslib-prjfilldirentrybuffer2
     * @since windows10.0.19041
     */
    static PrjFillDirEntryBuffer2(dirEntryBufferHandle, fileName, fileBasicInfo, extendedInfo) {
        dirEntryBufferHandle := dirEntryBufferHandle is Win32Handle ? NumGet(dirEntryBufferHandle, "ptr") : dirEntryBufferHandle
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := DllCall("PROJECTEDFSLIB.dll\PrjFillDirEntryBuffer2", "ptr", dirEntryBufferHandle, "ptr", fileName, "ptr", fileBasicInfo, "ptr", extendedInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Determines whether a file name matches a search pattern.
     * @param {PWSTR} fileNameToCheck A null-terminated Unicode string of at most MAX_PATH characters specifying the file name to check against pattern.
     * @param {PWSTR} pattern A null-terminated Unicode string of at most MAX_PATH characters specifying the pattern to compare against fileNameToCheck.
     * @returns {BOOLEAN} True if fileNameToCheck matches pattern, False otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//projectedfslib/nf-projectedfslib-prjfilenamematch
     * @since windows10.0.17763
     */
    static PrjFileNameMatch(fileNameToCheck, pattern) {
        fileNameToCheck := fileNameToCheck is String ? StrPtr(fileNameToCheck) : fileNameToCheck
        pattern := pattern is String ? StrPtr(pattern) : pattern

        result := DllCall("PROJECTEDFSLIB.dll\PrjFileNameMatch", "ptr", fileNameToCheck, "ptr", pattern, "char")
        return result
    }

    /**
     * Compares two file names and returns a value that indicates their relative collation order.
     * @param {PWSTR} fileName1 A null-terminated Unicode string specifying the first name to compare.
     * @param {PWSTR} fileName2 A null-terminated Unicode string specifying the second name to compare.
     * @returns {Integer} <ul>
     * <li>&lt;0 indicates fileName1 is before fileName2 in collation order</li>
     * <li>0 indicates fileName1 is equal to fileName2</li>
     * <li>&gt;0 indicates fileName1 is after fileName2 in collation order</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//projectedfslib/nf-projectedfslib-prjfilenamecompare
     * @since windows10.0.17763
     */
    static PrjFileNameCompare(fileName1, fileName2) {
        fileName1 := fileName1 is String ? StrPtr(fileName1) : fileName1
        fileName2 := fileName2 is String ? StrPtr(fileName2) : fileName2

        result := DllCall("PROJECTEDFSLIB.dll\PrjFileNameCompare", "ptr", fileName1, "ptr", fileName2, "int")
        return result
    }

    /**
     * Determines whether a name contains wildcard characters.
     * @param {PWSTR} fileName A null-terminated Unicode string to check for wildcard characters.
     * @returns {BOOLEAN} True if fileName contains wildcards, False otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//projectedfslib/nf-projectedfslib-prjdoesnamecontainwildcards
     * @since windows10.0.17763
     */
    static PrjDoesNameContainWildCards(fileName) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := DllCall("PROJECTEDFSLIB.dll\PrjDoesNameContainWildCards", "ptr", fileName, "char")
        return result
    }

;@endregion Methods
}
