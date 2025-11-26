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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ValidateTarget", "ScanTargetForConfigurations", "GetConfigurationDetails", "SelectConfiguration", "PerformReassociation"]

    /**
     * This method checks whether a certain storage device or network share can be used as a File History default target and, thus, whether reassociation is possible at all or not.
     * @param {BSTR} TargetUrl Specifies the storage device or network share to be validated.
     * @returns {Integer} On return, contains a value specifying the result of the device validation. See  the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/ne-fhcfg-fh_device_validation_result">FH_DEVICE_VALIDATION_RESULT</a> enumeration for a detailed description of supported device validation results.
     * @see https://docs.microsoft.com/windows/win32/api//fhcfg/nf-fhcfg-ifhreassociation-validatetarget
     */
    ValidateTarget(TargetUrl) {
        TargetUrl := TargetUrl is String ? BSTR.Alloc(TargetUrl).Value : TargetUrl

        result := ComCall(3, this, "ptr", TargetUrl, "int*", &ValidationResult := 0, "HRESULT")
        return ValidationResult
    }

    /**
     * Scans the namespace on a specified storage device or network share for File History configurations that can be reassociated with and continued to be used on the current computer.
     * @param {BSTR} TargetUrl Specifies the storage device or network share to be scanned.
     * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * 
     * If no File History configurations were found on the specified storage device or network share, the <code>HRESULT_FROM_WIN32(ERROR_NOT_FOUND)</code> error code is returned.
     * @see https://docs.microsoft.com/windows/win32/api//fhcfg/nf-fhcfg-ifhreassociation-scantargetforconfigurations
     */
    ScanTargetForConfigurations(TargetUrl) {
        TargetUrl := TargetUrl is String ? BSTR.Alloc(TargetUrl).Value : TargetUrl

        result := ComCall(4, this, "ptr", TargetUrl, "HRESULT")
        return result
    }

    /**
     * This method enumerates File History configurations that were discovered on a storage device or network share by the IFhReassociation::ScanTargetForConfigurations method and returns additional information about each of the discovered configurations.
     * @param {Integer} Index Zero-based index of a discovered configuration.
     * @param {Pointer<BSTR>} UserName On return, contains a pointer to a string allocated with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> containing the name of the user account under which the configuration was last backed up to.
     * @param {Pointer<BSTR>} PcName On return, contains a pointer to a string allocated with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> containing the name of the computer from which the configuration was last backed up.
     * @param {Pointer<FILETIME>} BackupTime On return, contains the date and time when the configuration was last backed up.
     * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * 
     * If there is no File History configuration with the specified index, the <code>HRESULT_FROM_WIN32(ERROR_NOT_FOUND)</code> error code is returned.
     * @see https://docs.microsoft.com/windows/win32/api//fhcfg/nf-fhcfg-ifhreassociation-getconfigurationdetails
     */
    GetConfigurationDetails(Index, UserName, PcName, BackupTime) {
        result := ComCall(5, this, "uint", Index, "ptr", UserName, "ptr", PcName, "ptr", BackupTime, "HRESULT")
        return result
    }

    /**
     * Selects one of the File History configurations discovered on a storage device or network share by the IFhReassociation::ScanTargetForConfigurations method for subsequent reassociation.
     * @param {Integer} Index Zero-based index of a discovered configuration.
     * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * 
     * If there is no File History configuration with the specified index, the <code>HRESULT_FROM_WIN32(ERROR_NOT_FOUND)</code> error code is returned.
     * @see https://docs.microsoft.com/windows/win32/api//fhcfg/nf-fhcfg-ifhreassociation-selectconfiguration
     */
    SelectConfiguration(Index) {
        result := ComCall(6, this, "uint", Index, "HRESULT")
        return result
    }

    /**
     * This method re-establishes relationship between the current user and the configuration selected previously via the IFhReassociation::SelectConfiguration method and prepares the target device for accepting backup data from the current computer.
     * @param {BOOL} OverwriteIfExists This parameter specifies how to handle the current File History configuration, if it already exists.
     * 
     * If this parameter is set to <b>FALSE</b> and File History is already configured for the current user, this method fails with the <b>FHCFG_E_CONFIG_ALREADY_EXISTS</b> error code and backups continue to be performed to the already configured target device.
     * 
     * If this parameter is set to <b>TRUE</b> and File History is already configured for the current user, the current configuration is replaced with the selected one and future backups after performed to the target device containing the selected configuration.
     * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * @see https://docs.microsoft.com/windows/win32/api//fhcfg/nf-fhcfg-ifhreassociation-performreassociation
     */
    PerformReassociation(OverwriteIfExists) {
        result := ComCall(7, this, "int", OverwriteIfExists, "HRESULT")
        return result
    }
}
