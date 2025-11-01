#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to perform file system management operations on partitions.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsdiskpartitionmf
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsDiskPartitionMF extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsDiskPartitionMF
     * @type {Guid}
     */
    static IID => Guid("{538684e0-ba3d-4bc0-aca9-164aff85c2a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPartitionFileSystemProperties", "GetPartitionFileSystemTypeName", "QueryPartitionFileSystemFormatSupport", "FormatPartitionEx"]

    /**
     * 
     * @param {Integer} ullOffset 
     * @param {Pointer<VDS_FILE_SYSTEM_PROP>} pFileSystemProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsdiskpartitionmf-getpartitionfilesystemproperties
     */
    GetPartitionFileSystemProperties(ullOffset, pFileSystemProp) {
        result := ComCall(3, this, "uint", ullOffset, "ptr", pFileSystemProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullOffset 
     * @param {Pointer<PWSTR>} ppwszFileSystemTypeName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsdiskpartitionmf-getpartitionfilesystemtypename
     */
    GetPartitionFileSystemTypeName(ullOffset, ppwszFileSystemTypeName) {
        result := ComCall(4, this, "uint", ullOffset, "ptr", ppwszFileSystemTypeName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullOffset 
     * @param {Pointer<Pointer<VDS_FILE_SYSTEM_FORMAT_SUPPORT_PROP>>} ppFileSystemSupportProps 
     * @param {Pointer<Integer>} plNumberOfFileSystems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsdiskpartitionmf-querypartitionfilesystemformatsupport
     */
    QueryPartitionFileSystemFormatSupport(ullOffset, ppFileSystemSupportProps, plNumberOfFileSystems) {
        result := ComCall(5, this, "uint", ullOffset, "ptr*", ppFileSystemSupportProps, "int*", plNumberOfFileSystems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullOffset 
     * @param {PWSTR} pwszFileSystemTypeName 
     * @param {Integer} usFileSystemRevision 
     * @param {Integer} ulDesiredUnitAllocationSize 
     * @param {PWSTR} pwszLabel 
     * @param {BOOL} bForce 
     * @param {BOOL} bQuickFormat 
     * @param {BOOL} bEnableCompression 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsdiskpartitionmf-formatpartitionex
     */
    FormatPartitionEx(ullOffset, pwszFileSystemTypeName, usFileSystemRevision, ulDesiredUnitAllocationSize, pwszLabel, bForce, bQuickFormat, bEnableCompression, ppAsync) {
        pwszFileSystemTypeName := pwszFileSystemTypeName is String ? StrPtr(pwszFileSystemTypeName) : pwszFileSystemTypeName
        pwszLabel := pwszLabel is String ? StrPtr(pwszLabel) : pwszLabel

        result := ComCall(6, this, "uint", ullOffset, "ptr", pwszFileSystemTypeName, "ushort", usFileSystemRevision, "uint", ulDesiredUnitAllocationSize, "ptr", pwszLabel, "int", bForce, "int", bQuickFormat, "int", bEnableCompression, "ptr*", ppAsync, "HRESULT")
        return result
    }
}
