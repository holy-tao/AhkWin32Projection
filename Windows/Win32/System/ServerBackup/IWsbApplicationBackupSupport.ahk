#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWsbApplicationAsync.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Defines a method for checking the consistency of the application's VSS writer's components.
 * @see https://docs.microsoft.com/windows/win32/api//wsbapp/nn-wsbapp-iwsbapplicationbackupsupport
 * @namespace Windows.Win32.System.ServerBackup
 * @version v4.0.30319
 */
class IWsbApplicationBackupSupport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWsbApplicationBackupSupport
     * @type {Guid}
     */
    static IID => Guid("{1eff3510-4a27-46ad-b9e0-08332f0f4f6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CheckConsistency"]

    /**
     * Checks the consistency of the VSS writer's components in the shadow copy after shadow copies are created for the volumes to be backed up.
     * @param {PWSTR} wszWriterMetadata A string that contains the VSS writer's metadata.
     * @param {PWSTR} wszComponentName The name of the component or component set to be checked. This should match the name in the metadata that 
     *     the <i>wszWriterMetadata</i> parameter points to.
     * @param {PWSTR} wszComponentLogicalPath The <a href="https://docs.microsoft.com/windows/desktop/VSS/logical-pathing-of-components">logical path</a> of the component or 
     *     component set to be checked. This should match the logical path in the metadata that the 
     *   <i>wszWriterMetadata</i> parameter points to.
     * @param {Integer} cVolumes The number of shadow copy volumes. The value of this parameter can range from 0 to 
     *     <b>MAX_VOLUMES</b>.
     * @param {Pointer<PWSTR>} rgwszSourceVolumePath A pointer to an array of volume <b>GUID</b> paths, one for each of the source 
     *     volumes. The format of a volume <b>GUID</b> path is 
     *   "\\?&#92;<i>Volume</i>{<i>GUID</i>}\".
     * @param {Pointer<PWSTR>} rgwszSnapshotVolumePath A pointer to an array of volume <b>GUID</b> paths, one for each of the shadow copy 
     *     volumes. The consistency check is performed on these volumes.
     * @returns {IWsbApplicationAsync} A pointer to a variable that will receive an 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wsbapp/nn-wsbapp-iwsbapplicationasync">IWsbApplicationAsync</a> interface pointer that can be 
     *   used to retrieve the status of the consistency-check operation.  This pointer can be <b>NULL</b> 
     *   if a consistency check is not required. When the consistency-check operation is complete, the 
     *   <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method must be called to free all 
     *       resources held by the <b>IWsbApplicationAsync</b> object.
     * @see https://docs.microsoft.com/windows/win32/api//wsbapp/nf-wsbapp-iwsbapplicationbackupsupport-checkconsistency
     */
    CheckConsistency(wszWriterMetadata, wszComponentName, wszComponentLogicalPath, cVolumes, rgwszSourceVolumePath, rgwszSnapshotVolumePath) {
        wszWriterMetadata := wszWriterMetadata is String ? StrPtr(wszWriterMetadata) : wszWriterMetadata
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName
        wszComponentLogicalPath := wszComponentLogicalPath is String ? StrPtr(wszComponentLogicalPath) : wszComponentLogicalPath

        rgwszSourceVolumePathMarshal := rgwszSourceVolumePath is VarRef ? "ptr*" : "ptr"
        rgwszSnapshotVolumePathMarshal := rgwszSnapshotVolumePath is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", wszWriterMetadata, "ptr", wszComponentName, "ptr", wszComponentLogicalPath, "uint", cVolumes, rgwszSourceVolumePathMarshal, rgwszSourceVolumePath, rgwszSnapshotVolumePathMarshal, rgwszSnapshotVolumePath, "ptr*", &ppAsync := 0, "HRESULT")
        return IWsbApplicationAsync(ppAsync)
    }
}
