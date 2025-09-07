#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLFS_NODE_ID.ahk

/**
 * The CLS_SCAN_CONTEXT structure contains information about the containers that are being scanned by ScanLogContainers.
 * @remarks
 * This structure is allocated by the client, initialized using <a href="https://docs.microsoft.com/windows/desktop/api/clfsw32/nf-clfsw32-createlogcontainerscancontext">CreateLogContainerScanContext</a>, and then passed to <a href="https://docs.microsoft.com/windows/desktop/api/clfsw32/nf-clfsw32-scanlogcontainers">ScanLogContainers</a> in repeated calls.
 * @see https://learn.microsoft.com/windows/win32/api/clfs/ns-clfs-cls_scan_context~r1
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CLS_SCAN_CONTEXT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The ID of the current node. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/clfs/ns-clfs-clfs_node_id">CLFS_NODE_ID</a>.
     * @type {CLFS_NODE_ID}
     */
    cidNode{
        get {
            if(!this.HasProp("__cidNode"))
                this.__cidNode := CLFS_NODE_ID(this.ptr + 0)
            return this.__cidNode
        }
    }

    /**
     * A handle to the log being scanned that is obtained from <a href="https://docs.microsoft.com/windows/desktop/api/clfsw32/nf-clfsw32-createlogfile">CreateLogFile</a> with permissions  to scan the log containers.
     * @type {Pointer<Ptr>}
     */
    hLog {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The index of the current container.
     * @type {Integer}
     */
    cIndex {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of system-allocated <a href="https://docs.microsoft.com/windows/desktop/api/clfs/ns-clfs-cls_container_information">CLFS_CONTAINER_INFORMATION</a> structures in an array that is pointed to by <b>pinfoContainer</b>. 
     * 
     * That is, this member is the number of containers to scan with each scan call.   The caller knows the scan is complete when the number of containers returned is less than this value.
     * @type {Integer}
     */
    cContainers {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The number of containers that are returned after a call to <a href="https://docs.microsoft.com/windows/desktop/api/clfsw32/nf-clfsw32-scanlogcontainers">ScanLogContainers</a>.
     * @type {Integer}
     */
    cContainersReturned {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The mode in which containers are scanned.  
     * 
     * Containers can be scanned in one of the following modes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLFS_SCAN_INIT"></a><a id="clfs_scan_init"></a><dl>
     * <dt><b>CLFS_SCAN_INIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Initializes the scan context, but does not allocate associated storage.  
     * 
     * The initialization is destructive, because all  data that is stored in the current scan context is lost.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLFS_SCAN_CLOSE"></a><a id="clfs_scan_close"></a><dl>
     * <dt><b>CLFS_SCAN_CLOSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uninitializes the scan context and deallocates  system storage that is associated with a scan context.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLFS_SCAN_FORWARD"></a><a id="clfs_scan_forward"></a><dl>
     * <dt><b>CLFS_SCAN_FORWARD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Causes the next call to <a href="https://docs.microsoft.com/windows/desktop/api/clfsw32/nf-clfsw32-scanlogcontainers">ScanLogContainers</a> to proceed  in a forward direction. 
     * 
     * Cannot be used if <b>CLFS_SCAN_BACKWARD</b> is specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLFS_SCAN_BACKWARD"></a><a id="clfs_scan_backward"></a><dl>
     * <dt><b>CLFS_SCAN_BACKWARD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Causes the next call to <a href="https://docs.microsoft.com/windows/desktop/api/clfsw32/nf-clfsw32-scanlogcontainers">ScanLogContainers</a> to proceed  in a backward direction. 
     * 
     * Cannot be used if <b>CLFS_SCAN_FORWARD</b> is specified.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    eScanMode {
        get => NumGet(this, 28, "char")
        set => NumPut("char", value, this, 28)
    }

    /**
     * A pointer to
     * 					a client-allocated array of <a href="https://docs.microsoft.com/windows/desktop/api/clfs/ns-clfs-cls_container_information">CLFS_CONTAINER_INFORMATION</a> structures to be filled by <a href="https://docs.microsoft.com/windows/desktop/api/clfsw32/nf-clfsw32-scanlogcontainers">ScanLogContainers</a> after each successful call.
     * @type {Pointer<CLS_CONTAINER_INFORMATION>}
     */
    pinfoContainer {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
