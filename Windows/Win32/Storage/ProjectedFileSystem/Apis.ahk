#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include .\PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT.ahk

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
     * @returns {PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT} On success returns an opaque handle to the ProjFS virtualization instance. 
     * The provider passes this value when calling functions that require a PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT as input.
     * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/nf-projectedfslib-prjstartvirtualizing
     * @since windows10.0.17763
     */
    static PrjStartVirtualizing(virtualizationRootPath, callbacks, instanceContext, options) {
        virtualizationRootPath := virtualizationRootPath is String ? StrPtr(virtualizationRootPath) : virtualizationRootPath

        instanceContextMarshal := instanceContext is VarRef ? "ptr" : "ptr"

        namespaceVirtualizationContext := PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT()
        result := DllCall("PROJECTEDFSLIB.dll\PrjStartVirtualizing", "ptr", virtualizationRootPath, "ptr", callbacks, instanceContextMarshal, instanceContext, "ptr", options, "ptr", namespaceVirtualizationContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return namespaceVirtualizationContext
    }

    /**
     * Stops a running ProjFS virtualization instance, making it unavailable to service I/O or involve callbacks on the provider.
     * @param {PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT} namespaceVirtualizationContext An opaque handle for the virtualization instance.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/nf-projectedfslib-prjstopvirtualizing
     * @since windows10.0.17763
     */
    static PrjStopVirtualizing(namespaceVirtualizationContext) {
        namespaceVirtualizationContext := namespaceVirtualizationContext is Win32Handle ? NumGet(namespaceVirtualizationContext, "ptr") : namespaceVirtualizationContext

        DllCall("PROJECTEDFSLIB.dll\PrjStopVirtualizing", "ptr", namespaceVirtualizationContext)
    }

    /**
     * Purges the virtualization instance's negative path cache, if it is active.
     * @remarks
     * If the negative path cache is active, then if the provider indicates that a file path does not exist by returning HRESULT_FROM_WIN32(ERROR_FILE_NOT_FOUND) from its <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_placeholder_info_cb">PRJ_GET_PLACEHOLDER_INFO_CB</a> callback, ProjFS will fail subsequent opens of that path without calling the <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_placeholder_info_cb">PRJ_GET_PLACEHOLDER_INFO_CB</a> callback again. This helps improve performance of virtualization instances that host workloads that frequently probe for the presence of a file by trying to open it. 
     * 
     * 
     * To resume receiving the <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_placeholder_info_cb">PRJ_GET_PLACEHOLDER_INFO_CB</a> callback for paths the provider has indicated do not exist, the provider must call this routine.
     * @param {PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT} namespaceVirtualizationContext Opaque handle for the virtualization instance.
     * @returns {Integer} Optional pointer to a variable that receives the number of paths that were in the cache before it was purged.
     * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/nf-projectedfslib-prjclearnegativepathcache
     * @since windows10.0.17763
     */
    static PrjClearNegativePathCache(namespaceVirtualizationContext) {
        namespaceVirtualizationContext := namespaceVirtualizationContext is Win32Handle ? NumGet(namespaceVirtualizationContext, "ptr") : namespaceVirtualizationContext

        result := DllCall("PROJECTEDFSLIB.dll\PrjClearNegativePathCache", "ptr", namespaceVirtualizationContext, "uint*", &totalEntryNumber := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return totalEntryNumber
    }

    /**
     * Retrieves information about the virtualization instance.
     * @remarks
     * ProjFS callback routines provide the virtualization instance handle in their callbackData parameters. A provider that manages multiple virtualization instances can use the InstanceID field of virtualizationInstanceInfo to identify which of its virtualization instances is receiving the callback. 
     * 
     * 
     * The provider can use the WriteAlignment member of virtualizationInstanceInfo to determine the correct values to use for the byteOffset and length parameters of <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjwritefiledata">PrjWriteFileData</a>.
     * @param {PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT} namespaceVirtualizationContext An opaque handle for the virtualization instance.
     * @param {Pointer<PRJ_VIRTUALIZATION_INSTANCE_INFO>} virtualizationInstanceInfo On input points to a buffer to fill with information about the virtualization instance. On successful return the buffer is filled in.
     * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/nf-projectedfslib-prjgetvirtualizationinstanceinfo
     * @since windows10.0.17763
     */
    static PrjGetVirtualizationInstanceInfo(namespaceVirtualizationContext, virtualizationInstanceInfo) {
        namespaceVirtualizationContext := namespaceVirtualizationContext is Win32Handle ? NumGet(namespaceVirtualizationContext, "ptr") : namespaceVirtualizationContext

        result := DllCall("PROJECTEDFSLIB.dll\PrjGetVirtualizationInstanceInfo", "ptr", namespaceVirtualizationContext, "ptr", virtualizationInstanceInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Converts an existing directory to a directory placeholder.
     * @remarks
     * The provider must use this API to designate the virtualization root before calling <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjstartvirtualizing">PrjStartVirtualizing</a>.
     * @param {PWSTR} rootPathName A null-terminated Unicode string specifying the full path to the virtualization root.
     * @param {PWSTR} targetPathName A null-terminated Unicode string specifying the full path to the directory to convert to a placeholder.
     * 
     * 
     * If this parameter is not specified or is an empty string, then this means the caller wants to designate rootPathName as the virtualization root. The provider only needs to do this one time, upon establishing a new virtualization instance.
     * @param {Pointer<PRJ_PLACEHOLDER_VERSION_INFO>} versionInfo Optional version information for the target placeholder. The provider chooses what information to put in the <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/ns-projectedfslib-prj_placeholder_version_info">PRJ_PLACEHOLDER_VERSION_INFO</a> structure. If not specified, the placeholder gets zeros for its version information.
     * @param {Pointer<Guid>} virtualizationInstanceID A value that identifies the virtualization instance.
     * @returns {HRESULT} HRESULT_FROM_WIN32(ERROR_REPARSE_POINT_ENCOUNTERED) typically means the directory at targetPathName has a reparse point on it. HRESULT_FROM_WIN32(ERROR_DIRECTORY) typically means the targetPathName does not specify a directory.
     * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/nf-projectedfslib-prjmarkdirectoryasplaceholder
     * @since windows10.0.17763
     */
    static PrjMarkDirectoryAsPlaceholder(rootPathName, targetPathName, versionInfo, virtualizationInstanceID) {
        rootPathName := rootPathName is String ? StrPtr(rootPathName) : rootPathName
        targetPathName := targetPathName is String ? StrPtr(targetPathName) : targetPathName

        result := DllCall("PROJECTEDFSLIB.dll\PrjMarkDirectoryAsPlaceholder", "ptr", rootPathName, "ptr", targetPathName, "ptr", versionInfo, "ptr", virtualizationInstanceID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sends file or directory metadata to ProjFS.
     * @remarks
     * The provider uses this routine to provide the data requested in an invocation of its <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_placeholder_info_cb">PRJ_GET_PLACEHOLDER_INFO_CB</a> callback, or it may use it to proactively lay down a placeholder. 
     * 
     * 
     * The EaInformation, SecurityInformation, and StreamsInformation members of <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/ns-projectedfslib-prj_placeholder_info
     * ">PRJ_PLACEHOLDER_INFO</a> are optional. If the provider does not wish to provide extended attributes, custom security descriptors, or alternate data streams, it must set these fields to 0.
     * @param {PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT} namespaceVirtualizationContext Opaque handle for the virtualization instance. This must be the value from the VirtualizationInstanceHandle member of the callbackData passed to the provider in the <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_placeholder_info_cb">PRJ_GET_PLACEHOLDER_INFO_CB</a> callback.
     * @param {PWSTR} destinationFileName A null-terminated Unicode string specifying the path, relative to the virtualization root, to the file or directory for which to create a placeholder. 
     * 
     * This must be a match to the FilePathName member of the callbackData parameter passed to the provider in the <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_placeholder_info_cb">PRJ_GET_PLACEHOLDER_INFO_CB</a> callback. The provider should use the PrjFileNameCompare function to determine whether the two names match. 
     * 
     * 
     * For example, if the <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_placeholder_info_cb">PRJ_GET_PLACEHOLDER_INFO_CB</a> callback specifies “dir1\dir1\FILE.TXT” in callbackData-&gt;FilePathName, and the provider’s backing store contains a file called “File.txt” in the dir1\dir2 directory, and <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjfilenamecompare">PrjFileNameCompare</a> returns 0 when comparing the names “FILE.TXT” and “File.txt”, then the provider specifies “dir1\dir2\File.txt” as the value of this parameter.
     * @param {Pointer} placeholderInfo A pointer to the metadata for the file or directory.
     * @param {Integer} placeholderInfoSize Size in bytes of the buffer pointed to by placeholderInfo.
     * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/nf-projectedfslib-prjwriteplaceholderinfo
     * @since windows10.0.17763
     */
    static PrjWritePlaceholderInfo(namespaceVirtualizationContext, destinationFileName, placeholderInfo, placeholderInfoSize) {
        namespaceVirtualizationContext := namespaceVirtualizationContext is Win32Handle ? NumGet(namespaceVirtualizationContext, "ptr") : namespaceVirtualizationContext
        destinationFileName := destinationFileName is String ? StrPtr(destinationFileName) : destinationFileName

        result := DllCall("PROJECTEDFSLIB.dll\PrjWritePlaceholderInfo", "ptr", namespaceVirtualizationContext, "ptr", destinationFileName, "ptr", placeholderInfo, "uint", placeholderInfoSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sends file or directory metadata to ProjFS and allows the caller to specify extended information.
     * @remarks
     * The provider uses this routine to provide the data requested in an invocation of its <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_placeholder_info_cb">PRJ_GET_PLACEHOLDER_INFO_CB</a> callback, or it may use it to proactively lay down a placeholder. 
     * 
     * The EaInformation, SecurityInformation, and StreamsInformation members of <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/ns-projectedfslib-prj_placeholder_info
     * ">PRJ_PLACEHOLDER_INFO</a> are optional. If the provider does not wish to provide extended attributes, custom security descriptors, or alternate data streams, it must set these fields to 0.
     * @param {PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT} namespaceVirtualizationContext Opaque handle for the virtualization instance. This must be the value from the VirtualizationInstanceHandle member of the callbackData passed to the provider in the <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_placeholder_info_cb">PRJ_GET_PLACEHOLDER_INFO_CB</a> callback.
     * @param {PWSTR} destinationFileName A null-terminated Unicode string specifying the path, relative to the virtualization root, to the file or directory for which to create a placeholder.
     * 
     * This must be a match to the FilePathName member of the callbackData parameter passed to the provider in the <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_placeholder_info_cb">PRJ_GET_PLACEHOLDER_INFO_CB</a> callback. The provider should use the PrjFileNameCompare function to determine whether the two names match.
     * 
     * For example, if the <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_placeholder_info_cb">PRJ_GET_PLACEHOLDER_INFO_CB</a> callback specifies “dir1\dir1\FILE.TXT” in callbackData-&gt;FilePathName, and the provider’s backing store contains a file called “File.txt” in the dir1\dir2 directory, and <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjfilenamecompare">PrjFileNameCompare</a> returns 0 when comparing the names “FILE.TXT” and “File.txt”, then the provider specifies “dir1\dir2\File.txt” as the value of this parameter.
     * @param {Pointer} placeholderInfo A pointer to the metadata for the file or directory.
     * @param {Integer} placeholderInfoSize Size in bytes of the buffer pointed to by placeholderInfo.
     * @param {Pointer<PRJ_EXTENDED_INFO>} ExtendedInfo 
     * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/nf-projectedfslib-prjwriteplaceholderinfo2
     * @since windows10.0.19041
     */
    static PrjWritePlaceholderInfo2(namespaceVirtualizationContext, destinationFileName, placeholderInfo, placeholderInfoSize, ExtendedInfo) {
        namespaceVirtualizationContext := namespaceVirtualizationContext is Win32Handle ? NumGet(namespaceVirtualizationContext, "ptr") : namespaceVirtualizationContext
        destinationFileName := destinationFileName is String ? StrPtr(destinationFileName) : destinationFileName

        result := DllCall("PROJECTEDFSLIB.dll\PrjWritePlaceholderInfo2", "ptr", namespaceVirtualizationContext, "ptr", destinationFileName, "ptr", placeholderInfo, "uint", placeholderInfoSize, "ptr", ExtendedInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enables a provider to update an item that has been cached on the local file system.
     * @remarks
     * The provider uses this routine to update an item in the local file system if the item's information has changed in the provider’s backing store and the updates should be reflected in the items cached in the local file system. 
     * 
     * 
     * This routine cannot be called on a virtual file/directory. 
     * If the file/directory to be updated is in any state other than "placeholder", the provider must specify an appropriate combination of PRJ_UPDATE_TYPES values in the updateFlags parameter. This helps guard against accidental loss of data, since upon successful return from this routine the item becomes a placeholder with the updated metadata; any metadata that had been changed since the placeholder was created, or any file data it contained is discarded. 
     * 
     * 
     * The provider uses the local file system as a cache of the items that it manages. An item (file or directory) can be in one of six states on the local file system.
     * 
     *  Virtual - The item does not exist locally on disk. It is projected, i.e. synthesized, during enumerations of its parent directory. Virtual items are merged with any items that may exist on disk to present the full contents of the parent directory. 
     * 
     * 
     * Placeholder - For files: The file's content (primary data stream) is not present on the disk. The file’s metadata (name, size, timestamps, attributes, etc.) is cached on the disk. For directories: Some or all of the directory’s immediate descendants (the files and directories in the directory) are not present on the disk, i.e. they are still virtual. The directory’s metadata (name, timestamps, attributes, etc.) is cached on the disk. 
     * 
     * 
     * Hydrated placeholder - For files: The file’s content and metadata have been cached to the disk. Also referred to as a "partial file". For directories: Directories are never hydrated placeholders. A directory that was created on disk as a placeholder never becomes a hydrated placeholder directory. This allows the provider to add or remove items from the directory in its backing store and have those changes be reflected in the local cache. 
     * 
     * 
     * Dirty placeholder (hydrated or not) - The item's metadata has been locally modified and is no longer a cache of its state in the provider's store. Note that creating or deleting a file or directory under a placeholder directory causes that placeholder directory to become dirty. 
     * 
     * 
     * Full file/directory - For files: The file's content (primary data stream) has been modified. The file is no longer a cache of its state in the provider's store. Files that have been created on the local file system (i.e. that do not exist in the provider's store at all) are also considered to be full files. For directories: Directories that have been created on the local file system (i.e. that do not exist in the provider's store at all) are considered to be full directories. A directory that was created on disk as a placeholder never becomes a full directory. 
     * 
     * 
     * Tombstone - A special hidden placeholder that represents an item that has been deleted from the local file system. When a directory is enumerated ProjFS merges the set of local items (placeholders, full files, etc.) with the set of virtual projected items. If an item appears in both the local and projected sets, the local item takes precedence. If a file does not exist, there is no local state, so it would appear in the enumeration. However if that item had been deleted, having it appear in the enumeration would be unexpected. Replacing a deleted item with a tombstone result in the following effects:<ul>
     * <li>Enumerations to not reveal the item</li>
     * <li>File opens that expect the item to exist fail with e.g. "file not found".</li>
     * <li>File creates that expect to succeed only if the item does not exist succeed; ProjFS removes the tombstone as part of the operation.</li>
     * </ul>
     * 
     * 
     *  
     * To illustrate the above states, consider the following sequence, given a ProjFS provider that has a single file "foo.txt" located in the virtualization root C:\root. 
     * 
     * 
     * 
     * <ul>
     * <li>An app enumerates C:\root. It sees the virtual file "foo.txt". Since the file has not yet been accessed, the file does not exist on disk. 
     * </li>
     * <li>The app opens a handle to C:\root\foo.txt. ProjFS tells the provider to create a placeholder for it.</li>
     * <li>The app reads the content of the file. The provider provides the file content to ProjFS and it is cached to C:\root\foo.txt. The file is now a hydrated placeholder.</li>
     * <li>The app updates the Last Modified timestamp. The file is now a dirty hydrated placeholder.</li>
     * <li>The app opens a handle for write access to the file. C:\root\foo.txt is now a full file.</li>
     * <li>The app deletes C:\root\foo.txt. ProjFS replaces the file with a tombstone. Now when the app enumerates C:\root it does not see foo.txt. If it tries to open the file, the open fails with ERROR_FILE_NOT_FOUND.</li>
     * </ul>
     * @param {PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT} namespaceVirtualizationContext Opaque handle for the virtualization instance.
     * @param {PWSTR} destinationFileName A null-terminated Unicode string specifying the path, relative to the virtualization root, to the file or directory to be updated.
     * @param {Pointer} placeholderInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/ns-projectedfslib-prj_placeholder_info">PRJ_PLACEHOLDER_INFO</a> buffer containing the updated metadata for the file or directory. 
     * 
     * 
     * If placeholderInfo-&gt;VersionInfo.ContentID contains a content identifier that is the same as the content identifier already on the file/directory, the call succeeds and no update takes place. Otherwise, if the call succeeds then placeholderInfo-&gt;VersionInfo.ContentID replaces the existing content identifier on the file.
     * @param {Integer} placeholderInfoSize The size in bytes of the buffer pointed to by placeholderInfo.
     * @param {Integer} updateFlags Flags to control updates.
     * 
     * If the item is a dirty placeholder, full file, or tombstone, and the provider does not specify the appropriate flag(s), this routine will fail to update the placeholder
     * @returns {Integer} Optional pointer to receive a code describing the reason an update failed.
     * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/nf-projectedfslib-prjupdatefileifneeded
     * @since windows10.0.17763
     */
    static PrjUpdateFileIfNeeded(namespaceVirtualizationContext, destinationFileName, placeholderInfo, placeholderInfoSize, updateFlags) {
        namespaceVirtualizationContext := namespaceVirtualizationContext is Win32Handle ? NumGet(namespaceVirtualizationContext, "ptr") : namespaceVirtualizationContext
        destinationFileName := destinationFileName is String ? StrPtr(destinationFileName) : destinationFileName

        result := DllCall("PROJECTEDFSLIB.dll\PrjUpdateFileIfNeeded", "ptr", namespaceVirtualizationContext, "ptr", destinationFileName, "ptr", placeholderInfo, "uint", placeholderInfoSize, "int", updateFlags, "int*", &failureReason := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return failureReason
    }

    /**
     * Enables a provider to delete an item that has been cached on the local file system.
     * @remarks
     * If the item is still in the provider's backing store, deleting it from the local file system changes it to a virtual item. 
     * 
     * 
     * This routine cannot be called on a virtual file/directory. 
     * 
     * 
     * If the file/directory to be deleted is in any state other than "placeholder", the provider must specify an appropriate combination of <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/ne-projectedfslib-prj_update_types">PRJ_UPDATE_TYPES</a> values in the updateFlags parameter. This helps guard against accidental loss of data.
     * @param {PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT} namespaceVirtualizationContext An opaque handle for the virtualization instance.
     * @param {PWSTR} destinationFileName A null-terminated Unicode string specifying the path, relative to the virtualization root, to the file or directory to be deleted.
     * @param {Integer} updateFlags Flags to control the delete operation should be allowed given the state of the file.
     * @returns {Integer} Optional pointer to receive a code describing the reason a delete failed.
     * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/nf-projectedfslib-prjdeletefile
     * @since windows10.0.17763
     */
    static PrjDeleteFile(namespaceVirtualizationContext, destinationFileName, updateFlags) {
        namespaceVirtualizationContext := namespaceVirtualizationContext is Win32Handle ? NumGet(namespaceVirtualizationContext, "ptr") : namespaceVirtualizationContext
        destinationFileName := destinationFileName is String ? StrPtr(destinationFileName) : destinationFileName

        result := DllCall("PROJECTEDFSLIB.dll\PrjDeleteFile", "ptr", namespaceVirtualizationContext, "ptr", destinationFileName, "int", updateFlags, "int*", &failureReason := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return failureReason
    }

    /**
     * The PrjWriteFileData function provides the data requested in an invocation of the PRJ_GET_FILE_DATA_CB callback. (PrjWriteFileData)
     * @remarks
     * The provider uses this routine to provide the data requested in an invocation of its <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_file_data_cb">PRJ_GET_FILE_DATA_CB</a> callback. 
     * 
     * 
     * The provider’s <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_file_data_cb">PRJ_GET_FILE_DATA_CB</a> callback is invoked when the system needs to ensure that a file contains data. When the provider calls <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjwritefiledata">PrjWriteFileData</a> to supply the requested data the system uses the user’s FILE_OBJECT to write that data to the file. However the system cannot control whether that FILE_OBJECT was opened for buffered or unbuffered I/O. If the FILE_OBJECT was opened for unbuffered I/O, reads and writes to the file must adhere to certain alignment requirements. The provider can meet those alignment requirements by doing two things: 
     * <ul>
     * <li>Use <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjallocatealignedbuffer">PrjAllocateAlignedBuffer</a> to allocate the buffer to pass to buffer.</li>
     * <li>Ensure that byteOffset and length are integer multiples of the storage device’s alignment requirement (length does not have to meet this requirement if byteOffset + length is equal to the end of the file). The provider can use <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjgetvirtualizationinstanceinfo">PrjGetVirtualizationInstanceInfo</a> to retrieve the storage device’s alignment requirement.</li>
     * </ul>
     * 
     * 
     * The system leaves it up to the provider to calculate proper alignment because when processing a <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_file_data_cb">PRJ_GET_FILE_DATA_CB</a> callback the provider may opt to return the requested data across multiple <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjwritefiledata">PrjWriteFileData</a> calls, each returning part of the total requested data. 
     * 
     * Note that if the provider is going to write the entire file in a single call to <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjwritefiledata">PrjWriteFileData</a>, i.e. from byteOffset = 0 to length = size of the file, the provider does not have to do any alignment calculations. However it must still use <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjallocatealignedbuffer">PrjAllocateAlignedBuffer</a> to ensure that buffer meets the storage device's alignment requirements. See the <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-buffering">File Buffering</a> topic for more information on buffered vs unbuffered I/O.
     * @param {PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT} namespaceVirtualizationContext Opaque handle for the virtualization instance. 
     * 
     * 
     * If the provider is servicing a <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_file_data_cb">PRJ_GET_FILE_DATA_CB</a> callback, this must be the value from the VirtualizationInstanceHandle member of the callbackData passed to the provider in the callback.
     * @param {Pointer<Guid>} dataStreamId Identifier for the data stream to write to. 
     * 
     * 
     * If the provider is servicing a <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_file_data_cb">PRJ_GET_FILE_DATA_CB</a> callback, this must be the value from the DataStreamId member of the callbackData passed to the provider in the callback.
     * @param {Pointer} buffer_R 
     * @param {Integer} byteOffset Byte offset from the beginning of the file at which to write the data.
     * @param {Integer} length The number of bytes to write to the file.
     * @returns {HRESULT} HRESULT_FROM_WIN32(ERROR_OFFSET_ALIGNMENT_VIOLATION) indicates that the user's handle was opened for unbuffered I/O and byteOffset is not aligned to the sector size of the storage device.
     * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/nf-projectedfslib-prjwritefiledata
     * @since windows10.0.17763
     */
    static PrjWriteFileData(namespaceVirtualizationContext, dataStreamId, buffer_R, byteOffset, length) {
        namespaceVirtualizationContext := namespaceVirtualizationContext is Win32Handle ? NumGet(namespaceVirtualizationContext, "ptr") : namespaceVirtualizationContext

        result := DllCall("PROJECTEDFSLIB.dll\PrjWriteFileData", "ptr", namespaceVirtualizationContext, "ptr", dataStreamId, "ptr", buffer_R, "uint", byteOffset, "uint", length, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the on-disk file state for a file or directory.
     * @remarks
     * This routine tells the caller what the ProjFS caching state is of the specified file or directory. For example, the caller can use this routine to determine whether the given item is a placeholder or full file. 
     * 
     * 
     * A running provider should be cautious if using this routine on files or directories within one of its virtualization instances, as it may cause callbacks to be invoked in the provider. Depending on the design of the provider this may lead to deadlocks.
     * @param {PWSTR} destinationFileName A null-terminated Unicode string specifying the full path to the file whose state is to be queried.
     * @returns {Integer} This is a combination of one or more PRJ_FILE_STATE values describing the file state.
     * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/nf-projectedfslib-prjgetondiskfilestate
     * @since windows10.0.17763
     */
    static PrjGetOnDiskFileState(destinationFileName) {
        destinationFileName := destinationFileName is String ? StrPtr(destinationFileName) : destinationFileName

        result := DllCall("PROJECTEDFSLIB.dll\PrjGetOnDiskFileState", "ptr", destinationFileName, "int*", &fileState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return fileState
    }

    /**
     * Allocates a buffer that meets the memory alignment requirements of the virtualization instance's storage device.
     * @param {PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT} namespaceVirtualizationContext Opaque handle for the virtualization instance.
     * @param {Pointer} size The size of the buffer required, in bytes.
     * @returns {Pointer<Void>} Returns NULL if the buffer could not be allocated.
     * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/nf-projectedfslib-prjallocatealignedbuffer
     * @since windows10.0.17763
     */
    static PrjAllocateAlignedBuffer(namespaceVirtualizationContext, size) {
        namespaceVirtualizationContext := namespaceVirtualizationContext is Win32Handle ? NumGet(namespaceVirtualizationContext, "ptr") : namespaceVirtualizationContext

        result := DllCall("PROJECTEDFSLIB.dll\PrjAllocateAlignedBuffer", "ptr", namespaceVirtualizationContext, "ptr", size, "ptr")
        return result
    }

    /**
     * Frees an allocated buffer.
     * @param {Pointer<Void>} buffer_R 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/nf-projectedfslib-prjfreealignedbuffer
     * @since windows10.0.17763
     */
    static PrjFreeAlignedBuffer(buffer_R) {
        buffer_RMarshal := buffer_R is VarRef ? "ptr" : "ptr"

        DllCall("PROJECTEDFSLIB.dll\PrjFreeAlignedBuffer", buffer_RMarshal, buffer_R)
    }

    /**
     * Indicates that the provider has completed processing a callback from which it had previously returned HRESULT_FROM_WIN32(ERROR_IO_PENDING).
     * @param {PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT} namespaceVirtualizationContext Opaque handle for the virtualization instance. This must be the value from the VirtualizationInstanceHandle member of the callbackData passed to the provider in the callback that is being complete.
     * @param {Integer} commandId A value identifying the callback invocation that the provider is completing. This must be the value from the CommandId member of the callbackData passed to the provider in the callback that is being completed.
     * @param {HRESULT} completionResult The final HRESULT of the operation.
     * @param {Pointer<PRJ_COMPLETE_COMMAND_EXTENDED_PARAMETERS>} extendedParameters Optional pointer to extended parameters required for completing certain callbacks.
     * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/nf-projectedfslib-prjcompletecommand
     * @since windows10.0.17763
     */
    static PrjCompleteCommand(namespaceVirtualizationContext, commandId, completionResult, extendedParameters) {
        namespaceVirtualizationContext := namespaceVirtualizationContext is Win32Handle ? NumGet(namespaceVirtualizationContext, "ptr") : namespaceVirtualizationContext

        result := DllCall("PROJECTEDFSLIB.dll\PrjCompleteCommand", "ptr", namespaceVirtualizationContext, "int", commandId, "int", completionResult, "ptr", extendedParameters, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Provides information for one file or directory to an enumeration.
     * @remarks
     * The provider uses this routine to service a <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_directory_enumeration_cb">PRJ_GET_DIRECTORY_ENUMERATION_CB</a> callback. When processing the callback, the provider calls this routine for each matching file or directory in the enumeration. 
     * 
     * 
     * If this routine returns HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER) when adding an entry to the enumeration, the provider returns S_OK from the callback and waits for the next <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_directory_enumeration_cb">PRJ_GET_DIRECTORY_ENUMERATION_CB</a> callback. 
     * 
     * 
     * The provider resumes filling the enumeration with the entry it was trying to add when it got HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER). 
     * 
     * 
     * If this routine returns HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER) for the first file or directory in the enumeration, the provider must return HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER) from its <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_directory_enumeration_cb">PRJ_GET_DIRECTORY_ENUMERATION_CB</a> callback.
     * @param {PWSTR} fileName A pointer to a null-terminated string that contains the name of the entry
     * @param {Pointer<PRJ_FILE_BASIC_INFO>} fileBasicInfo Basic information about the entry to be filled.
     * @param {PRJ_DIR_ENTRY_BUFFER_HANDLE} dirEntryBufferHandle An opaque handle to a structure that receives information about the filled entries.
     * @returns {HRESULT} HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER) indicates that dirEntryBufferHandle doesn't have enough space for the new entry.
     * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/nf-projectedfslib-prjfilldirentrybuffer
     * @since windows10.0.17763
     */
    static PrjFillDirEntryBuffer(fileName, fileBasicInfo, dirEntryBufferHandle) {
        fileName := fileName is String ? StrPtr(fileName) : fileName
        dirEntryBufferHandle := dirEntryBufferHandle is Win32Handle ? NumGet(dirEntryBufferHandle, "ptr") : dirEntryBufferHandle

        result := DllCall("PROJECTEDFSLIB.dll\PrjFillDirEntryBuffer", "ptr", fileName, "ptr", fileBasicInfo, "ptr", dirEntryBufferHandle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Provides information for one file or directory to an enumeration and allows the caller to specify extended information.
     * @remarks
     * The provider uses this routine to service a <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_directory_enumeration_cb">PRJ_GET_DIRECTORY_ENUMERATION_CB</a> callback. When processing the callback, the provider calls this routine for each matching file or directory in the enumeration. This routine allows the provider to specify extended information about the file or directory, such as whether it is a symbolic link.
     * 
     * If this routine returns HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER) when adding an entry to the enumeration, the provider returns S_OK from the callback and waits for the next <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_directory_enumeration_cb">PRJ_GET_DIRECTORY_ENUMERATION_CB</a> callback.
     * 
     * The provider resumes filling the enumeration with the entry it was trying to add when it got HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER).
     * 
     * If this routine returns HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER) for the first file or directory in the enumeration, the provider must return HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER) from its <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_directory_enumeration_cb">PRJ_GET_DIRECTORY_ENUMERATION_CB</a> callback.
     * @param {PRJ_DIR_ENTRY_BUFFER_HANDLE} dirEntryBufferHandle An opaque handle to a structure that receives information about the filled entries.
     * @param {PWSTR} fileName A pointer to a null-terminated string that contains the name of the entry
     * @param {Pointer<PRJ_FILE_BASIC_INFO>} fileBasicInfo Basic information about the entry to be filled.
     * @param {Pointer<PRJ_EXTENDED_INFO>} extendedInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/ns-projectedfslib-prj_extended_info">PRJ_EXTENDED_INFO</a> struct specifying extended information about the entry to be filled.
     * @returns {HRESULT} HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER) indicates that dirEntryBufferHandle doesn't have enough space for the new entry.
     * 
     * E_INVALIDARG indicates that extendedInfo.InfoType is unrecognized.
     * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/nf-projectedfslib-prjfilldirentrybuffer2
     * @since windows10.0.19041
     */
    static PrjFillDirEntryBuffer2(dirEntryBufferHandle, fileName, fileBasicInfo, extendedInfo) {
        dirEntryBufferHandle := dirEntryBufferHandle is Win32Handle ? NumGet(dirEntryBufferHandle, "ptr") : dirEntryBufferHandle
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := DllCall("PROJECTEDFSLIB.dll\PrjFillDirEntryBuffer2", "ptr", dirEntryBufferHandle, "ptr", fileName, "ptr", fileBasicInfo, "ptr", extendedInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines whether a file name matches a search pattern.
     * @remarks
     * The provider must use this routine when processing a <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_directory_enumeration_cb">PRJ_GET_DIRECTORY_ENUMERATION_CB</a> callback to determine whether a name in its backing store matches the searchExpression passed to the callback. This routine performs pattern matching in the same way the file system does when it is processing a directory enumeration
     * @param {PWSTR} fileNameToCheck A null-terminated Unicode string of at most MAX_PATH characters specifying the file name to check against pattern.
     * @param {PWSTR} pattern A null-terminated Unicode string of at most MAX_PATH characters specifying the pattern to compare against fileNameToCheck.
     * @returns {BOOLEAN} True if fileNameToCheck matches pattern, False otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/nf-projectedfslib-prjfilenamematch
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
     * @remarks
     * The provider may use this routine to determine how to sort file names in the same order that the file system does.
     * @param {PWSTR} fileName1 A null-terminated Unicode string specifying the first name to compare.
     * @param {PWSTR} fileName2 A null-terminated Unicode string specifying the second name to compare.
     * @returns {Integer} <ul>
     * <li>&lt;0 indicates fileName1 is before fileName2 in collation order</li>
     * <li>0 indicates fileName1 is equal to fileName2</li>
     * <li>&gt;0 indicates fileName1 is after fileName2 in collation order</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/nf-projectedfslib-prjfilenamecompare
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
     * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/nf-projectedfslib-prjdoesnamecontainwildcards
     * @since windows10.0.17763
     */
    static PrjDoesNameContainWildCards(fileName) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := DllCall("PROJECTEDFSLIB.dll\PrjDoesNameContainWildCards", "ptr", fileName, "char")
        return result
    }

;@endregion Methods
}
