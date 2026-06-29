#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Describes general information about a container.
 * @see https://learn.microsoft.com/windows/win32/api/clfs/ns-clfs-cls_container_information
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CLS_CONTAINER_INFORMATION {
    #StructPack 8

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
     */
    FileAttributes : UInt32

    /**
     * The time a file is created.
     */
    CreationTime : Int64

    /**
     * The last time a container is read from or written to.
     */
    LastAccessTime : Int64

    /**
     * The last time a container is written to.
     */
    LastWriteTime : Int64

    /**
     * The size of a container, in bytes.
     */
    ContainerSize : Int64

    /**
     * The size of the actual file name, in characters. 
     * 
     * This number is  different than  <b>FileNameLength</b>  when the file name of the container  is longer than MAX_PATH_LENGTH.
     */
    FileNameActualLength : UInt32

    /**
     * The size of the file name in the <i>FileName</i> buffer, in characters.
     */
    FileNameLength : UInt32

    /**
     * A pointer to a string that contains the file name for a container.
     */
    FileName : WCHAR[256]

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
     */
    State : UInt32

    /**
     * The physical container identifier that  cannot  be changed.
     */
    PhysicalContainerId : UInt32

    /**
     * The logical container identifier that  changes every time the container is recycled.
     */
    LogicalContainerId : UInt32

}
