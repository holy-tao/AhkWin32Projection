#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\FH_DEVICE_VALIDATION_RESULT.ahk" { FH_DEVICE_VALIDATION_RESULT }

/**
 * This interface allows client applications to reassociate a File History configuration from a File History target with the current user.
 * @see https://learn.microsoft.com/windows/win32/api/fhcfg/nn-fhcfg-ifhreassociation
 * @namespace Windows.Win32.Storage.FileHistory
 */
export default struct IFhReassociation extends IUnknown {
    /**
     * The interface identifier for IFhReassociation
     * @type {Guid}
     */
    static IID := Guid("{6544a28a-f68d-47ac-91ef-16b2b36aa3ee}")

    /**
     * The class identifier for FhReassociation
     * @type {Guid}
     */
    static CLSID := Guid("{4d728e35-16fa-4320-9e8b-bfd7100a8846}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFhReassociation interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ValidateTarget              : IntPtr
        ScanTargetForConfigurations : IntPtr
        GetConfigurationDetails     : IntPtr
        SelectConfiguration         : IntPtr
        PerformReassociation        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFhReassociation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This method checks whether a certain storage device or network share can be used as a File History default target and, thus, whether reassociation is possible at all or not.
     * @remarks
     * For local disks, the <i>TargetUrl</i> parameter contains the drive letter. This path must end with a trailing backslash (for example, "X:\\").
     * 
     * For network shares, the <i>TargetUrl</i> parameter contains the full path of the share.  This path must end with a trailing backslash (for example, "\\\\myserver\myshare\\").
     * @param {BSTR} TargetUrl Specifies the storage device or network share to be validated.
     * @returns {FH_DEVICE_VALIDATION_RESULT} On return, contains a value specifying the result of the device validation. See  the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/ne-fhcfg-fh_device_validation_result">FH_DEVICE_VALIDATION_RESULT</a> enumeration for a detailed description of supported device validation results.
     * @see https://learn.microsoft.com/windows/win32/api/fhcfg/nf-fhcfg-ifhreassociation-validatetarget
     */
    ValidateTarget(TargetUrl) {
        TargetUrl := TargetUrl is String ? BSTR.Alloc(TargetUrl).Value : TargetUrl

        result := ComCall(3, this, BSTR, TargetUrl, "int*", &ValidationResult := 0, "HRESULT")
        return ValidationResult
    }

    /**
     * Scans the namespace on a specified storage device or network share for File History configurations that can be reassociated with and continued to be used on the current computer.
     * @remarks
     * For local disks, the <i>TargetUrl</i> parameter contains the drive letter. This path must end with a trailing backslash (for example, "X:\\").
     * 
     * For network shares, the <i>TargetUrl</i> parameter contains the full path of the share.  This path must end with a trailing backslash (for example, "\\\\myserver\myshare\\").
     * @param {BSTR} TargetUrl Specifies the storage device or network share to be scanned.
     * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * 
     * If no File History configurations were found on the specified storage device or network share, the <c>HRESULT_FROM_WIN32(ERROR_NOT_FOUND)</c> error code is returned.
     * @see https://learn.microsoft.com/windows/win32/api/fhcfg/nf-fhcfg-ifhreassociation-scantargetforconfigurations
     */
    ScanTargetForConfigurations(TargetUrl) {
        TargetUrl := TargetUrl is String ? BSTR.Alloc(TargetUrl).Value : TargetUrl

        result := ComCall(4, this, BSTR, TargetUrl, "HRESULT")
        return result
    }

    /**
     * This method enumerates File History configurations that were discovered on a storage device or network share by the IFhReassociation::ScanTargetForConfigurations method and returns additional information about each of the discovered configurations.
     * @remarks
     * The caller is responsible for releasing the memory allocated for <i>UserName</i> and <i>PcName</i> by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> on each of them.
     * 
     * In order to perform reassociation, one of the configurations enumerated by this method must be selected using the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhreassociation-selectconfiguration">IFhReassociation::SelectConfiguration</a> method and then the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhreassociation-performreassociation">IFhReassociation::PerformReassociation</a> method needs to be called.
     * @param {Integer} Index Zero-based index of a discovered configuration.
     * @param {Pointer<BSTR>} UserName On return, contains a pointer to a string allocated with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> containing the name of the user account under which the configuration was last backed up to.
     * @param {Pointer<BSTR>} PcName On return, contains a pointer to a string allocated with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> containing the name of the computer from which the configuration was last backed up.
     * @param {Pointer<FILETIME>} BackupTime On return, contains the date and time when the configuration was last backed up.
     * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * 
     * If there is no File History configuration with the specified index, the <c>HRESULT_FROM_WIN32(ERROR_NOT_FOUND)</c> error code is returned.
     * @see https://learn.microsoft.com/windows/win32/api/fhcfg/nf-fhcfg-ifhreassociation-getconfigurationdetails
     */
    GetConfigurationDetails(Index, UserName, PcName, BackupTime) {
        result := ComCall(5, this, "uint", Index, BSTR.Ptr, UserName, BSTR.Ptr, PcName, FILETIME.Ptr, BackupTime, "HRESULT")
        return result
    }

    /**
     * Selects one of the File History configurations discovered on a storage device or network share by the IFhReassociation::ScanTargetForConfigurations method for subsequent reassociation.
     * @param {Integer} Index Zero-based index of a discovered configuration.
     * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * 
     * If there is no File History configuration with the specified index, the <c>HRESULT_FROM_WIN32(ERROR_NOT_FOUND)</c> error code is returned.
     * @see https://learn.microsoft.com/windows/win32/api/fhcfg/nf-fhcfg-ifhreassociation-selectconfiguration
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
     * @see https://learn.microsoft.com/windows/win32/api/fhcfg/nf-fhcfg-ifhreassociation-performreassociation
     */
    PerformReassociation(OverwriteIfExists) {
        result := ComCall(7, this, BOOL, OverwriteIfExists, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFhReassociation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ValidateTarget := CallbackCreate(GetMethod(implObj, "ValidateTarget"), flags, 3)
        this.vtbl.ScanTargetForConfigurations := CallbackCreate(GetMethod(implObj, "ScanTargetForConfigurations"), flags, 2)
        this.vtbl.GetConfigurationDetails := CallbackCreate(GetMethod(implObj, "GetConfigurationDetails"), flags, 5)
        this.vtbl.SelectConfiguration := CallbackCreate(GetMethod(implObj, "SelectConfiguration"), flags, 2)
        this.vtbl.PerformReassociation := CallbackCreate(GetMethod(implObj, "PerformReassociation"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ValidateTarget)
        CallbackFree(this.vtbl.ScanTargetForConfigurations)
        CallbackFree(this.vtbl.GetConfigurationDetails)
        CallbackFree(this.vtbl.SelectConfiguration)
        CallbackFree(this.vtbl.PerformReassociation)
    }
}
