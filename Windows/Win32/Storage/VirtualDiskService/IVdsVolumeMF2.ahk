#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to perform additional file system management operations on the volume object.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsvolumemf2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsVolumeMF2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsVolumeMF2
     * @type {Guid}
     */
    static IID => Guid("{4dbcee9a-6343-4651-b85f-5e75d74d983c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFileSystemTypeName", "QueryFileSystemFormatSupport", "FormatEx"]

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszFileSystemTypeName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumemf2-getfilesystemtypename
     */
    GetFileSystemTypeName(ppwszFileSystemTypeName) {
        result := ComCall(3, this, "ptr", ppwszFileSystemTypeName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<VDS_FILE_SYSTEM_FORMAT_SUPPORT_PROP>>} ppFileSystemSupportProps 
     * @param {Pointer<Integer>} plNumberOfFileSystems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumemf2-queryfilesystemformatsupport
     */
    QueryFileSystemFormatSupport(ppFileSystemSupportProps, plNumberOfFileSystems) {
        ppFileSystemSupportPropsMarshal := ppFileSystemSupportProps is VarRef ? "ptr*" : "ptr"
        plNumberOfFileSystemsMarshal := plNumberOfFileSystems is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, ppFileSystemSupportPropsMarshal, ppFileSystemSupportProps, plNumberOfFileSystemsMarshal, plNumberOfFileSystems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszFileSystemTypeName 
     * @param {Integer} usFileSystemRevision 
     * @param {Integer} ulDesiredUnitAllocationSize 
     * @param {PWSTR} pwszLabel 
     * @param {BOOL} bForce 
     * @param {BOOL} bQuickFormat 
     * @param {BOOL} bEnableCompression 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumemf2-formatex
     */
    FormatEx(pwszFileSystemTypeName, usFileSystemRevision, ulDesiredUnitAllocationSize, pwszLabel, bForce, bQuickFormat, bEnableCompression, ppAsync) {
        pwszFileSystemTypeName := pwszFileSystemTypeName is String ? StrPtr(pwszFileSystemTypeName) : pwszFileSystemTypeName
        pwszLabel := pwszLabel is String ? StrPtr(pwszLabel) : pwszLabel

        result := ComCall(5, this, "ptr", pwszFileSystemTypeName, "ushort", usFileSystemRevision, "uint", ulDesiredUnitAllocationSize, "ptr", pwszLabel, "int", bForce, "int", bQuickFormat, "int", bEnableCompression, "ptr*", ppAsync, "HRESULT")
        return result
    }
}
