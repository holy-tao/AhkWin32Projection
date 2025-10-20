#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method to format a partition with additional formatting options.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsdiskpartitionmf2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsDiskPartitionMF2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsDiskPartitionMF2
     * @type {Guid}
     */
    static IID => Guid("{9cbe50ca-f2d2-4bf4-ace1-96896b729625}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FormatPartitionEx2"]

    /**
     * 
     * @param {Integer} ullOffset 
     * @param {PWSTR} pwszFileSystemTypeName 
     * @param {Integer} usFileSystemRevision 
     * @param {Integer} ulDesiredUnitAllocationSize 
     * @param {PWSTR} pwszLabel 
     * @param {Integer} Options 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsdiskpartitionmf2-formatpartitionex2
     */
    FormatPartitionEx2(ullOffset, pwszFileSystemTypeName, usFileSystemRevision, ulDesiredUnitAllocationSize, pwszLabel, Options, ppAsync) {
        pwszFileSystemTypeName := pwszFileSystemTypeName is String ? StrPtr(pwszFileSystemTypeName) : pwszFileSystemTypeName
        pwszLabel := pwszLabel is String ? StrPtr(pwszLabel) : pwszLabel

        result := ComCall(3, this, "uint", ullOffset, "ptr", pwszFileSystemTypeName, "ushort", usFileSystemRevision, "uint", ulDesiredUnitAllocationSize, "ptr", pwszLabel, "uint", Options, "ptr*", ppAsync, "HRESULT")
        return result
    }
}
