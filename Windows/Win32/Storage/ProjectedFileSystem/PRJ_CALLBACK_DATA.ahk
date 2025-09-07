#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Defines the standard information passed to a provider for every operation callback.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ns-projectedfslib-prj_callback_data
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 * @version v4.0.30319
 */
class PRJ_CALLBACK_DATA extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Size in bytes of this structure. The provider must not attempt to access any field of this structure that is located beyond this value.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Callback-specific flags.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Opaque handle to the virtualization instance that is sending the callback.
     * @type {PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT}
     */
    NamespaceVirtualizationContext{
        get {
            if(!this.HasProp("__NamespaceVirtualizationContext"))
                this.__NamespaceVirtualizationContext := PRJ_NAMESPACE_VIRTUALIZATION_CONTEXT(this.ptr + 8)
            return this.__NamespaceVirtualizationContext
        }
    }

    /**
     * A value that uniquely identifies a particular invocation of a callback. The provider uses this value: 
     * 
     * 
     * <ul>
     * <li>In calls to <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjcompletecommand">PrjCompleteCommand</a> to signal completion of a callback from which it earlier returned HRESULT_FROM_WIN32(ERROR_IO_PENDING).</li>
     * <li>When ProjFS sends a <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_cancel_command_cb">PRJ_CANCEL_COMMAND_CB</a> callback. The commandId in the <i>PRJ_CANCEL_COMMAND_CB</i> call identifies an earlier invocation of a callback that the provider should cancel.</li>
     * </ul>
     * @type {Integer}
     */
    CommandId {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * A value that uniquely identifies the file handle for the callback.
     * @type {Pointer<Guid>}
     */
    FileId {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A value that uniquely identifies an open data stream for the callback.
     * @type {Pointer<Guid>}
     */
    DataStreamId {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The path to the target file. This is a null-terminated string of Unicode characters. This path is always specified relative to the virtualization root.
     * @type {PWSTR}
     */
    FilePathName{
        get {
            if(!this.HasProp("__FilePathName"))
                this.__FilePathName := PWSTR(this.ptr + 40)
            return this.__FilePathName
        }
    }

    /**
     * Version information if the target of the callback is a placeholder or partial file.
     * @type {Pointer<PRJ_PLACEHOLDER_VERSION_INFO>}
     */
    VersionInfo {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * The process identifier for the process that triggered this callback. If this information is not available, this will be 0. Callbacks that supply this information include: <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_placeholder_info_cb">PRJ_GET_PLACEHOLDER_INFO_CB</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_get_file_data_cb">PRJ_GET_FILE_DATA_CB</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_notification_cb">PRJ_NOTIFICATION_CB</a>.
     * @type {Integer}
     */
    TriggeringProcessId {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * A null-terminated Unicode string specifying the image file name corresponding to TriggeringProcessId. If TriggeringProcessId is 0 this will be NULL.
     * @type {PWSTR}
     */
    TriggeringProcessImageFileName{
        get {
            if(!this.HasProp("__TriggeringProcessImageFileName"))
                this.__TriggeringProcessImageFileName := PWSTR(this.ptr + 64)
            return this.__TriggeringProcessImageFileName
        }
    }

    /**
     * A pointer to context information defined by the provider. The provider passes this context in the instanceContext parameter of <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjstartvirtualizing">PrjStartVirtualizing</a>. 
     * 
     * 
     * If the provider did not specify such a context, this value will be NULL.
     * @type {Pointer<Void>}
     */
    InstanceContext {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
