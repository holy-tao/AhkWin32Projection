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
     * 
     * @param {Pointer<VDS_FILE_SYSTEM_PROP>} pFileSystemProp 
     * @returns {HRESULT} 
     */
    GetFileSystemProperties(pFileSystemProp) {
        result := ComCall(3, this, "ptr", pFileSystemProp, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    Format(type, pwszLabel, dwUnitAllocationSize, bForce, bQuickFormat, bEnableCompression, ppAsync) {
        pwszLabel := pwszLabel is String ? StrPtr(pwszLabel) : pwszLabel

        result := ComCall(4, this, "int", type, "ptr", pwszLabel, "uint", dwUnitAllocationSize, "int", bForce, "int", bQuickFormat, "int", bEnableCompression, "ptr", ppAsync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszPath 
     * @returns {HRESULT} 
     */
    AddAccessPath(pwszPath) {
        pwszPath := pwszPath is String ? StrPtr(pwszPath) : pwszPath

        result := ComCall(5, this, "ptr", pwszPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pwszPathArray 
     * @param {Pointer<Int32>} plNumberOfAccessPaths 
     * @returns {HRESULT} 
     */
    QueryAccessPaths(pwszPathArray, plNumberOfAccessPaths) {
        result := ComCall(6, this, "ptr", pwszPathArray, "int*", plNumberOfAccessPaths, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VDS_REPARSE_POINT_PROP>} ppReparsePointProps 
     * @param {Pointer<Int32>} plNumberOfReparsePointProps 
     * @returns {HRESULT} 
     */
    QueryReparsePoints(ppReparsePointProps, plNumberOfReparsePointProps) {
        result := ComCall(7, this, "ptr", ppReparsePointProps, "int*", plNumberOfReparsePointProps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszPath 
     * @param {BOOL} bForce 
     * @returns {HRESULT} 
     */
    DeleteAccessPath(pwszPath, bForce) {
        pwszPath := pwszPath is String ? StrPtr(pwszPath) : pwszPath

        result := ComCall(8, this, "ptr", pwszPath, "int", bForce, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Mount() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bForce 
     * @param {BOOL} bPermanent 
     * @returns {HRESULT} 
     */
    Dismount(bForce, bPermanent) {
        result := ComCall(10, this, "int", bForce, "int", bPermanent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    SetFileSystemFlags(ulFlags) {
        result := ComCall(11, this, "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    ClearFileSystemFlags(ulFlags) {
        result := ComCall(12, this, "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
