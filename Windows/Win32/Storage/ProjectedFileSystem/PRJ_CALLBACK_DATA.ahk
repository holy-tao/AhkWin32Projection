#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PRJ_CALLBACK_DATA_FLAGS.ahk" { PRJ_CALLBACK_DATA_FLAGS }
#Import ".\PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT.ahk" { PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT }
#Import ".\PRJ_PLACEHOLDER_VERSION_INFO.ahk" { PRJ_PLACEHOLDER_VERSION_INFO }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Defines the standard information passed to a provider for every operation callback.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ns-projectedfslib-prj_callback_data
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 */
export default struct PRJ_CALLBACK_DATA {
    #StructPack 8

    /**
     * Size in bytes of this structure. The provider must not attempt to access any field of this structure that is located beyond this value.
     */
    Size : UInt32

    /**
     * Callback-specific flags.
     */
    Flags : PRJ_CALLBACK_DATA_FLAGS

    /**
     * Opaque handle to the virtualization instance that is sending the callback.
     */
    NamespaceVirtualizationContext : PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT

    /**
     * A value that uniquely identifies a particular invocation of a callback. The provider uses this value: 
     * 
     * 
     * <ul>
     * <li>In calls to <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjcompletecommand">PrjCompleteCommand</a> to signal completion of a callback from which it earlier returned HRESULT_FROM_WIN32(ERROR_IO_PENDING).</li>
     * <li>When ProjFS sends a <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_cancel_command_cb">PRJ_CANCEL_COMMAND_CB</a> callback. The commandId in the <i>PRJ_CANCEL_COMMAND_CB</i> call identifies an earlier invocation of a callback that the provider should cancel.</li>
     * </ul>
     */
    CommandId : Int32

    /**
     * A value that uniquely identifies the file handle for the callback.
     */
    FileId : Guid

    /**
     * A value that uniquely identifies an open data stream for the callback.
     */
    DataStreamId : Guid

    /**
     * The path to the target file. This is a null-terminated string of Unicode characters. This path is always specified relative to the virtualization root.
     */
    FilePathName : PWSTR

    /**
     * Version information if the target of the callback is a placeholder or partial file.
     */
    VersionInfo : PRJ_PLACEHOLDER_VERSION_INFO.Ptr

    /**
     * The process identifier for the process that triggered this callback. If this information is not available, this will be 0. Callbacks that supply this information include: <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_placeholder_info_cb">PRJ_GET_PLACEHOLDER_INFO_CB</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_file_data_cb">PRJ_GET_FILE_DATA_CB</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_notification_cb">PRJ_NOTIFICATION_CB</a>.
     */
    TriggeringProcessId : UInt32

    /**
     * A null-terminated Unicode string specifying the image file name corresponding to TriggeringProcessId. If TriggeringProcessId is 0 this will be NULL.
     */
    TriggeringProcessImageFileName : PWSTR

    /**
     * A pointer to context information defined by the provider. The provider passes this context in the instanceContext parameter of <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjstartvirtualizing">PrjStartVirtualizing</a>. 
     * 
     * 
     * If the provider did not specify such a context, this value will be NULL.
     */
    InstanceContext : IntPtr

}
