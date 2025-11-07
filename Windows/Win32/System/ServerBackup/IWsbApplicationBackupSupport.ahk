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
     * 
     * @param {PWSTR} wszWriterMetadata 
     * @param {PWSTR} wszComponentName 
     * @param {PWSTR} wszComponentLogicalPath 
     * @param {Integer} cVolumes 
     * @param {Pointer<PWSTR>} rgwszSourceVolumePath 
     * @param {Pointer<PWSTR>} rgwszSnapshotVolumePath 
     * @returns {IWsbApplicationAsync} 
     * @see https://learn.microsoft.com/windows/win32/api/wsbapp/nf-wsbapp-iwsbapplicationbackupsupport-checkconsistency
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
