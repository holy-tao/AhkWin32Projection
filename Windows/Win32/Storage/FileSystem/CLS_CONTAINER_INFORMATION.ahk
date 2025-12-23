#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes general information about a container.
 * @see https://learn.microsoft.com/windows/win32/api/clfs/ns-clfs-cls_container_information
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CLS_CONTAINER_INFORMATION extends Win32Struct
{
    static sizeof => 576

    static packingSize => 8

    /**
     * The file system attributes. CLFS uses the following attributes:
     * 
     * <ul>
     * <li>FILE_ATTRIBUTE_ARCHIVE - The log is not ephemeral.
     * </li>
     * <li>FILE_ATTRIBUTE_DEDICATED - The log is not multiplexed.
     * </li>
     * <li>FILE_ATTRIBUTE_READONLY - The file is read-only. Applications can read the file, but cannot write to it or delete it.</li>
     * </ul>
     * CLFS ignores but preserves all other file attribute values. The <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfileattributesa">SetFileAttributes</a> topic lists the valid values for attributes.
     * @type {Integer}
     */
    FileAttributes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The time a file is created.
     * @type {Integer}
     */
    CreationTime {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The last time a container is read from or written to.
     * @type {Integer}
     */
    LastAccessTime {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The last time a container is written to.
     * @type {Integer}
     */
    LastWriteTime {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The size of a container, in bytes.
     * @type {Integer}
     */
    ContainerSize {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * The size of the actual file name, in characters. 
     * 
     * This number is  different than  <b>FileNameLength</b>  when the file name of the container  is longer than MAX_PATH_LENGTH.
     * @type {Integer}
     */
    FileNameActualLength {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The size of the file name in the <i>FileName</i> buffer, in characters.
     * @type {Integer}
     */
    FileNameLength {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * A pointer to a string that contains the file name for a container.
     * @type {String}
     */
    FileName {
        get => StrGet(this.ptr + 48, 255, "UTF-16")
        set => StrPut(value, this.ptr + 48, 255, "UTF-16")
    }

    /**
     * The current state of a container.  
     * 
     * This member can be one of the  following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ClfsContainerInitializing"></a><a id="clfscontainerinitializing"></a><a id="CLFSCONTAINERINITIALIZING"></a><dl>
     * <dt><b>ClfsContainerInitializing</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The container is in the process of initializing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ClfsContainerInactive"></a><a id="clfscontainerinactive"></a><a id="CLFSCONTAINERINACTIVE"></a><dl>
     * <dt><b>ClfsContainerInactive</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The container  is allocated, but  is not in the active region of the log. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ClfsContainerActive"></a><a id="clfscontaineractive"></a><a id="CLFSCONTAINERACTIVE"></a><dl>
     * <dt><b>ClfsContainerActive</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The container is being used as storage for part of the  log.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ClfsContainerActivePendingDelete"></a><a id="clfscontaineractivependingdelete"></a><a id="CLFSCONTAINERACTIVEPENDINGDELETE"></a><dl>
     * <dt><b>ClfsContainerActivePendingDelete</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The container is marked for deletion, but still contains part of the active log.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ClfsContainerPendingArchive"></a><a id="clfscontainerpendingarchive"></a><a id="CLFSCONTAINERPENDINGARCHIVE"></a><dl>
     * <dt><b>ClfsContainerPendingArchive</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The container is marked for archive.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ClfsContainerPendingArchiveAndDelete"></a><a id="clfscontainerpendingarchiveanddelete"></a><a id="CLFSCONTAINERPENDINGARCHIVEANDDELETE"></a><dl>
     * <dt><b>ClfsContainerPendingArchiveAndDelete</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The container is marked for deletion, but still contains log data that is not  archived.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    State {
        get => NumGet(this, 560, "uint")
        set => NumPut("uint", value, this, 560)
    }

    /**
     * The physical container identifier that  cannot  be changed.
     * @type {Integer}
     */
    PhysicalContainerId {
        get => NumGet(this, 564, "uint")
        set => NumPut("uint", value, this, 564)
    }

    /**
     * The logical container identifier that  changes every time the container is recycled.
     * @type {Integer}
     */
    LogicalContainerId {
        get => NumGet(this, 568, "uint")
        set => NumPut("uint", value, this, 568)
    }
}
