#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface allows client applications to reassociate a File History configuration from a File History target with the current user.
 * @see https://docs.microsoft.com/windows/win32/api//fhcfg/nn-fhcfg-ifhreassociation
 * @namespace Windows.Win32.Storage.FileHistory
 * @version v4.0.30319
 */
class IFhReassociation extends IUnknown{
    /**
     * The interface identifier for IFhReassociation
     * @type {Guid}
     */
    static IID => Guid("{6544a28a-f68d-47ac-91ef-16b2b36aa3ee}")

    /**
     * The class identifier for FhReassociation
     * @type {Guid}
     */
    static CLSID => Guid("{4d728e35-16fa-4320-9e8b-bfd7100a8846}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BSTR} TargetUrl 
     * @param {Pointer<Int32>} ValidationResult 
     * @returns {HRESULT} 
     */
    ValidateTarget(TargetUrl, ValidationResult) {
        TargetUrl := TargetUrl is String ? BSTR.Alloc(TargetUrl).Value : TargetUrl

        result := ComCall(3, this, "ptr", TargetUrl, "int*", ValidationResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} TargetUrl 
     * @returns {HRESULT} 
     */
    ScanTargetForConfigurations(TargetUrl) {
        TargetUrl := TargetUrl is String ? BSTR.Alloc(TargetUrl).Value : TargetUrl

        result := ComCall(4, this, "ptr", TargetUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<BSTR>} UserName 
     * @param {Pointer<BSTR>} PcName 
     * @param {Pointer<FILETIME>} BackupTime 
     * @returns {HRESULT} 
     */
    GetConfigurationDetails(Index, UserName, PcName, BackupTime) {
        result := ComCall(5, this, "uint", Index, "ptr", UserName, "ptr", PcName, "ptr", BackupTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {HRESULT} 
     */
    SelectConfiguration(Index) {
        result := ComCall(6, this, "uint", Index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} OverwriteIfExists 
     * @returns {HRESULT} 
     */
    PerformReassociation(OverwriteIfExists) {
        result := ComCall(7, this, "int", OverwriteIfExists, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
