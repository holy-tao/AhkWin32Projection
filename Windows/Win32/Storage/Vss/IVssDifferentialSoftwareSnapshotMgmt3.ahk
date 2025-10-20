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
     * 
     * @param {Pointer<UInt16>} pwszVolumeName 
     * @param {Integer} protectionLevel 
     * @returns {HRESULT} 
     */
    SetVolumeProtectLevel(pwszVolumeName, protectionLevel) {
        result := ComCall(13, this, "ushort*", pwszVolumeName, "int", protectionLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwszVolumeName 
     * @param {Pointer<VSS_VOLUME_PROTECTION_INFO>} protectionLevel 
     * @returns {HRESULT} 
     */
    GetVolumeProtectLevel(pwszVolumeName, protectionLevel) {
        result := ComCall(14, this, "ushort*", pwszVolumeName, "ptr", protectionLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwszVolumeName 
     * @returns {HRESULT} 
     */
    ClearVolumeProtectFault(pwszVolumeName) {
        result := ComCall(15, this, "ushort*", pwszVolumeName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwszDiffAreaVolumeName 
     * @returns {HRESULT} 
     */
    DeleteUnusedDiffAreas(pwszDiffAreaVolumeName) {
        result := ComCall(16, this, "ushort*", pwszDiffAreaVolumeName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} idSnapshotOlder 
     * @param {Pointer<Guid>} idSnapshotYounger 
     * @param {Pointer<UInt32>} pcBlockSizePerBit 
     * @param {Pointer<UInt32>} pcBitmapLength 
     * @param {Pointer<Byte>} ppbBitmap 
     * @returns {HRESULT} 
     */
    QuerySnapshotDeltaBitmap(idSnapshotOlder, idSnapshotYounger, pcBlockSizePerBit, pcBitmapLength, ppbBitmap) {
        result := ComCall(17, this, "ptr", idSnapshotOlder, "ptr", idSnapshotYounger, "uint*", pcBlockSizePerBit, "uint*", pcBitmapLength, "char*", ppbBitmap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
