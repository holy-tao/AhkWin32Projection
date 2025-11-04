#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to perform additional file system management operations on the volume object.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsvolumemf3
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsVolumeMF3 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsVolumeMF3
     * @type {Guid}
     */
    static IID => Guid("{6788faf9-214e-4b85-ba59-266953616e09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryVolumeGuidPathnames", "FormatEx2", "OfflineVolume"]

    /**
     * 
     * @param {Pointer<Pointer<PWSTR>>} pwszPathArray 
     * @param {Pointer<Integer>} pulNumberOfPaths 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumemf3-queryvolumeguidpathnames
     */
    QueryVolumeGuidPathnames(pwszPathArray, pulNumberOfPaths) {
        pwszPathArrayMarshal := pwszPathArray is VarRef ? "ptr*" : "ptr"
        pulNumberOfPathsMarshal := pulNumberOfPaths is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pwszPathArrayMarshal, pwszPathArray, pulNumberOfPathsMarshal, pulNumberOfPaths, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszFileSystemTypeName 
     * @param {Integer} usFileSystemRevision 
     * @param {Integer} ulDesiredUnitAllocationSize 
     * @param {PWSTR} pwszLabel 
     * @param {Integer} Options 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumemf3-formatex2
     */
    FormatEx2(pwszFileSystemTypeName, usFileSystemRevision, ulDesiredUnitAllocationSize, pwszLabel, Options, ppAsync) {
        pwszFileSystemTypeName := pwszFileSystemTypeName is String ? StrPtr(pwszFileSystemTypeName) : pwszFileSystemTypeName
        pwszLabel := pwszLabel is String ? StrPtr(pwszLabel) : pwszLabel

        result := ComCall(4, this, "ptr", pwszFileSystemTypeName, "ushort", usFileSystemRevision, "uint", ulDesiredUnitAllocationSize, "ptr", pwszLabel, "uint", Options, "ptr*", ppAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumemf3-offlinevolume
     */
    OfflineVolume() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
