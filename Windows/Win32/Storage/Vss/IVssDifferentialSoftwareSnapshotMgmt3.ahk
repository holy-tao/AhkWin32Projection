#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVssDifferentialSoftwareSnapshotMgmt2.ahk

/**
 * Defines methods that allow applications to use the shadow copy protection feature of VSS.
 * @remarks
 * 
  * An application with administrator privilege can use the <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/nf-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt3-setvolumeprotectlevel">SetVolumeProtectLevel</a> method to specify a shadow copy protection level for a volume and the separate volume that contains its shadow copy storage area. The same protection level should be set for both volumes. The possible protection levels are defined by the <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/ne-vsmgmt-vss_protection_level">VSS_PROTECTION_LEVEL</a> enumeration.
  * 
  * When a volume protection fault occurs, the application must call the <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/nf-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt3-getvolumeprotectlevel">GetVolumeProtectLevel</a> method for the volume to identify the cause of the fault.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vsmgmt/nn-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt3
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssDifferentialSoftwareSnapshotMgmt3 extends IVssDifferentialSoftwareSnapshotMgmt2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssDifferentialSoftwareSnapshotMgmt3
     * @type {Guid}
     */
    static IID => Guid("{383f7e71-a4c5-401f-b27f-f826289f8458}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetVolumeProtectLevel", "GetVolumeProtectLevel", "ClearVolumeProtectFault", "DeleteUnusedDiffAreas", "QuerySnapshotDeltaBitmap"]

    /**
     * 
     * @param {Pointer<Integer>} pwszVolumeName 
     * @param {Integer} protectionLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/nf-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt3-setvolumeprotectlevel
     */
    SetVolumeProtectLevel(pwszVolumeName, protectionLevel) {
        pwszVolumeNameMarshal := pwszVolumeName is VarRef ? "ushort*" : "ptr"

        result := ComCall(13, this, pwszVolumeNameMarshal, pwszVolumeName, "int", protectionLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwszVolumeName 
     * @param {Pointer<VSS_VOLUME_PROTECTION_INFO>} protectionLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/nf-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt3-getvolumeprotectlevel
     */
    GetVolumeProtectLevel(pwszVolumeName, protectionLevel) {
        pwszVolumeNameMarshal := pwszVolumeName is VarRef ? "ushort*" : "ptr"

        result := ComCall(14, this, pwszVolumeNameMarshal, pwszVolumeName, "ptr", protectionLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwszVolumeName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/nf-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt3-clearvolumeprotectfault
     */
    ClearVolumeProtectFault(pwszVolumeName) {
        pwszVolumeNameMarshal := pwszVolumeName is VarRef ? "ushort*" : "ptr"

        result := ComCall(15, this, pwszVolumeNameMarshal, pwszVolumeName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwszDiffAreaVolumeName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/nf-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt3-deleteunuseddiffareas
     */
    DeleteUnusedDiffAreas(pwszDiffAreaVolumeName) {
        pwszDiffAreaVolumeNameMarshal := pwszDiffAreaVolumeName is VarRef ? "ushort*" : "ptr"

        result := ComCall(16, this, pwszDiffAreaVolumeNameMarshal, pwszDiffAreaVolumeName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} idSnapshotOlder 
     * @param {Guid} idSnapshotYounger 
     * @param {Pointer<Integer>} pcBlockSizePerBit 
     * @param {Pointer<Integer>} pcBitmapLength 
     * @param {Pointer<Pointer<Integer>>} ppbBitmap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/nf-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt3-querysnapshotdeltabitmap
     */
    QuerySnapshotDeltaBitmap(idSnapshotOlder, idSnapshotYounger, pcBlockSizePerBit, pcBitmapLength, ppbBitmap) {
        pcBlockSizePerBitMarshal := pcBlockSizePerBit is VarRef ? "uint*" : "ptr"
        pcBitmapLengthMarshal := pcBitmapLength is VarRef ? "uint*" : "ptr"
        ppbBitmapMarshal := ppbBitmap is VarRef ? "ptr*" : "ptr"

        result := ComCall(17, this, "ptr", idSnapshotOlder, "ptr", idSnapshotYounger, pcBlockSizePerBitMarshal, pcBlockSizePerBit, pcBitmapLengthMarshal, pcBitmapLength, ppbBitmapMarshal, ppbBitmap, "HRESULT")
        return result
    }
}
