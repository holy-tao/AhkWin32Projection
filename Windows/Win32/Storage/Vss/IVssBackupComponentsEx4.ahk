#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVssBackupComponentsEx3.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * Defines additional methods to support the processing of UNC file share paths in a requester.
 * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nl-vsbackup-ivssbackupcomponentsex4
 * @namespace Windows.Win32.Storage.Vss
 */
class IVssBackupComponentsEx4 extends IVssBackupComponentsEx3 {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssBackupComponentsEx4
     * @type {Guid}
     */
    static IID => Guid("{f434c2fd-b553-4961-a9f9-a8e90b673e53}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 64

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRootAndLogicalPrefixPaths"]

    /**
     * Normalizes a local volume path or UNC share path so that it can be passed to the IVssBackupComponents::AddToSnapshotSet method.
     * @remarks
     * This method normalizes a local volume path or UNC share path and separates it into a root path and a logical prefix path. The root path can then be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addtosnapshotset">IVssBackupComponents::AddToSnapshotSet</a> method.
     * 
     * If <i>pwszFilePath</i> is a local volume path, the root path will be similar to a volume mount point. In this case, the root and the logical prefix paths map to the results of <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-getvolumepathnamew">GetVolumePathName</a> and <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-getvolumenameforvolumemountpointw">GetVolumeNameForVolumeMountPoint</a>, respectively.
     * 
     * If <i>pwszFilePath</i> is a UNC share path, the root and logical prefix paths map to the root path of the file share and the fully evaluated physical share path (which will take into account DFS and cluster deployment), respectively.
     * 
     * If you call this method more than once for the same shadow copy set creation operation, you must set the <i>bNormalizeFQDNforRootPath</i> to the same value for every call. Fully qualified domain name format and host name format cannot be mixed in the same shadow copy set.
     * @param {Pointer<Integer>} pwszFilePath The path to be normalized.
     * @param {Pointer<Pointer<Integer>>} ppwszRootPath Receives the root path that should be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addtosnapshotset">IVssBackupComponents::AddToSnapshotSet</a> method.
     * @param {Pointer<Pointer<Integer>>} ppwszLogicalPrefix If <i>pwszFilePath</i> is a local path, this parameter receives the volume GUID name. If it's a UNC path, this parameter receives a fully evaluated share path.
     * @param {BOOL} bNormalizeFQDNforRootPath If <i>pwszFilePath</i> is a UNC share path, the server name portion can be <ul>
     * <li>A host name</li>
     * <li>A fully qualified domain name</li>
     * <li>An IP address</li>
     * </ul>
     * 
     * 
     * This parameter specifies whether host name format or fully qualified domain name format should be used in the server name portion of the normalized root path that is returned in the <i>ppwszRootPath</i> parameter.
     * 
     * If this parameter is <b>FALSE</b>, simple host name format will be used.
     * 
     * The default value for this parameter is <b>FALSE</b>.
     * 
     * If this parameter is <b>TRUE</b>, fully qualified domain name will be used.
     * 
     * In a deployment where a host name could exist in multiple domain suffixes, this parameter should be <b>TRUE</b>.
     * @returns {HRESULT} The following are the valid return codes for this method.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully returned the path information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vsbackup/nf-vsbackup-ivssbackupcomponentsex4-getrootandlogicalprefixpaths
     */
    GetRootAndLogicalPrefixPaths(pwszFilePath, ppwszRootPath, ppwszLogicalPrefix, bNormalizeFQDNforRootPath) {
        pwszFilePathMarshal := pwszFilePath is VarRef ? "ushort*" : "ptr"
        ppwszRootPathMarshal := ppwszRootPath is VarRef ? "ptr*" : "ptr"
        ppwszLogicalPrefixMarshal := ppwszLogicalPrefix is VarRef ? "ptr*" : "ptr"

        result := ComCall(64, this, pwszFilePathMarshal, pwszFilePath, ppwszRootPathMarshal, ppwszRootPath, ppwszLogicalPrefixMarshal, ppwszLogicalPrefix, "int", bNormalizeFQDNforRootPath, "HRESULT")
        return result
    }
}
