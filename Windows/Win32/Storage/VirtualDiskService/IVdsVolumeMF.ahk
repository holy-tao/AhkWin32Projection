#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to perform access-path and file-system activities on the volume object.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsvolumemf
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsVolumeMF extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsVolumeMF
     * @type {Guid}
     */
    static IID => Guid("{ee2d5ded-6236-4169-931d-b9778ce03dc6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFileSystemProperties", "Format", "AddAccessPath", "QueryAccessPaths", "QueryReparsePoints", "DeleteAccessPath", "Mount", "Dismount", "SetFileSystemFlags", "ClearFileSystemFlags"]

    /**
     * 
     * @param {Pointer<VDS_FILE_SYSTEM_PROP>} pFileSystemProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumemf-getfilesystemproperties
     */
    GetFileSystemProperties(pFileSystemProp) {
        result := ComCall(3, this, "ptr", pFileSystemProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @param {PWSTR} pwszLabel 
     * @param {Integer} dwUnitAllocationSize 
     * @param {BOOL} bForce 
     * @param {BOOL} bQuickFormat 
     * @param {BOOL} bEnableCompression 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumemf-format
     */
    Format(type, pwszLabel, dwUnitAllocationSize, bForce, bQuickFormat, bEnableCompression, ppAsync) {
        pwszLabel := pwszLabel is String ? StrPtr(pwszLabel) : pwszLabel

        result := ComCall(4, this, "int", type, "ptr", pwszLabel, "uint", dwUnitAllocationSize, "int", bForce, "int", bQuickFormat, "int", bEnableCompression, "ptr*", ppAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumemf-addaccesspath
     */
    AddAccessPath(pwszPath) {
        pwszPath := pwszPath is String ? StrPtr(pwszPath) : pwszPath

        result := ComCall(5, this, "ptr", pwszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<PWSTR>>} pwszPathArray 
     * @param {Pointer<Integer>} plNumberOfAccessPaths 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumemf-queryaccesspaths
     */
    QueryAccessPaths(pwszPathArray, plNumberOfAccessPaths) {
        result := ComCall(6, this, "ptr*", pwszPathArray, "int*", plNumberOfAccessPaths, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<VDS_REPARSE_POINT_PROP>>} ppReparsePointProps 
     * @param {Pointer<Integer>} plNumberOfReparsePointProps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumemf-queryreparsepoints
     */
    QueryReparsePoints(ppReparsePointProps, plNumberOfReparsePointProps) {
        result := ComCall(7, this, "ptr*", ppReparsePointProps, "int*", plNumberOfReparsePointProps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszPath 
     * @param {BOOL} bForce 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumemf-deleteaccesspath
     */
    DeleteAccessPath(pwszPath, bForce) {
        pwszPath := pwszPath is String ? StrPtr(pwszPath) : pwszPath

        result := ComCall(8, this, "ptr", pwszPath, "int", bForce, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumemf-mount
     */
    Mount() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bForce 
     * @param {BOOL} bPermanent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumemf-dismount
     */
    Dismount(bForce, bPermanent) {
        result := ComCall(10, this, "int", bForce, "int", bPermanent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumemf-setfilesystemflags
     */
    SetFileSystemFlags(ulFlags) {
        result := ComCall(11, this, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumemf-clearfilesystemflags
     */
    ClearFileSystemFlags(ulFlags) {
        result := ComCall(12, this, "uint", ulFlags, "HRESULT")
        return result
    }
}
