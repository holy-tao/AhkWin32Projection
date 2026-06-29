#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IOpenService.ahk" { IOpenService }
#Import "..\..\UI\WindowsAndMessaging\HICON.ahk" { HICON }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IOpenServiceActivityInput.ahk" { IOpenServiceActivityInput }
#Import ".\IOpenServiceActivityOutputContext.ahk" { IOpenServiceActivityOutputContext }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\OpenServiceActivityContentType.ahk" { OpenServiceActivityContentType }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IOpenServiceActivity extends IOpenService {
    /**
     * The interface identifier for IOpenServiceActivity
     * @type {Guid}
     */
    static IID := Guid("{13645c88-221a-4905-8ed1-4f5112cfc108}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOpenServiceActivity interfaces
    */
    struct Vtbl extends IOpenService.Vtbl {
        Execute                : IntPtr
        CanExecute             : IntPtr
        CanExecuteType         : IntPtr
        Preview                : IntPtr
        CanPreview             : IntPtr
        CanPreviewType         : IntPtr
        GetStatusText          : IntPtr
        GetHomepageUrl         : IntPtr
        GetDisplayName         : IntPtr
        GetDescription         : IntPtr
        GetCategoryName        : IntPtr
        GetIconPath            : IntPtr
        GetIcon                : IntPtr
        GetDescriptionFilePath : IntPtr
        GetDownloadUrl         : IntPtr
        GetInstallUrl          : IntPtr
        IsEnabled              : IntPtr
        SetEnabled             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOpenServiceActivity.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IOpenServiceActivityInput} pInput 
     * @param {IOpenServiceActivityOutputContext} pOutput 
     * @returns {HRESULT} 
     */
    Execute(pInput, pOutput) {
        result := ComCall(6, this, "ptr", pInput, "ptr", pOutput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOpenServiceActivityInput} pInput 
     * @param {IOpenServiceActivityOutputContext} pOutput 
     * @returns {BOOL} 
     */
    CanExecute(pInput, pOutput) {
        result := ComCall(7, this, "ptr", pInput, "ptr", pOutput, BOOL.Ptr, &pfCanExecute := 0, "HRESULT")
        return pfCanExecute
    }

    /**
     * 
     * @param {OpenServiceActivityContentType} type 
     * @returns {BOOL} 
     */
    CanExecuteType(type) {
        result := ComCall(8, this, OpenServiceActivityContentType, type, BOOL.Ptr, &pfCanExecute := 0, "HRESULT")
        return pfCanExecute
    }

    /**
     * 
     * @param {IOpenServiceActivityInput} pInput 
     * @param {IOpenServiceActivityOutputContext} pOutput 
     * @returns {HRESULT} 
     */
    Preview(pInput, pOutput) {
        result := ComCall(9, this, "ptr", pInput, "ptr", pOutput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOpenServiceActivityInput} pInput 
     * @param {IOpenServiceActivityOutputContext} pOutput 
     * @returns {BOOL} 
     */
    CanPreview(pInput, pOutput) {
        result := ComCall(10, this, "ptr", pInput, "ptr", pOutput, BOOL.Ptr, &pfCanPreview := 0, "HRESULT")
        return pfCanPreview
    }

    /**
     * 
     * @param {OpenServiceActivityContentType} type 
     * @returns {BOOL} 
     */
    CanPreviewType(type) {
        result := ComCall(11, this, OpenServiceActivityContentType, type, BOOL.Ptr, &pfCanPreview := 0, "HRESULT")
        return pfCanPreview
    }

    /**
     * 
     * @param {IOpenServiceActivityInput} pInput 
     * @returns {BSTR} 
     */
    GetStatusText(pInput) {
        pbstrStatusText := BSTR.Owned()
        result := ComCall(12, this, "ptr", pInput, BSTR.Ptr, pbstrStatusText, "HRESULT")
        return pbstrStatusText
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetHomepageUrl() {
        pbstrHomepageUrl := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, pbstrHomepageUrl, "HRESULT")
        return pbstrHomepageUrl
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetDisplayName() {
        pbstrDisplayName := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, pbstrDisplayName, "HRESULT")
        return pbstrDisplayName
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetDescription
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecstrings-getdescription
     */
    GetDescription() {
        pbstrDescription := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, pbstrDescription, "HRESULT")
        return pbstrDescription
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetCategoryName() {
        pbstrCategoryName := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, pbstrCategoryName, "HRESULT")
        return pbstrCategoryName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetIconPath() {
        pbstrIconPath := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, pbstrIconPath, "HRESULT")
        return pbstrIconPath
    }

    /**
     * 
     * @param {BOOL} fSmallIcon 
     * @returns {HICON} 
     */
    GetIcon(fSmallIcon) {
        phIcon := HICON.Owned()
        result := ComCall(18, this, BOOL, fSmallIcon, HICON.Ptr, phIcon, "HRESULT")
        return phIcon
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetDescriptionFilePath() {
        pbstrXmlPath := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, pbstrXmlPath, "HRESULT")
        return pbstrXmlPath
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetDownloadUrl() {
        pbstrXmlUri := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, pbstrXmlUri, "HRESULT")
        return pbstrXmlUri
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetInstallUrl() {
        pbstrInstallUri := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, pbstrInstallUri, "HRESULT")
        return pbstrInstallUri
    }

    /**
     * The IsEnabled method of the Win32\_Tpm class indicates whether the device is enabled. This value can be changed by the Enable and Disable methods.
     * @remarks
     * According to the Trusted Computing Group (TCG) v1.2 specification only the following commands are available when the device is in a deactivated state.
     * 
     * -   TPM\_ContinueSelfTest
     * -   TPM\_DSAP
     * -   TPM\_FlushSpecific
     * -   TPM\_GetCapability
     * -   TPM\_GetTestResult
     * -   TPM\_Init
     * -   TPM\_OIAP
     * -   TPM\_OSAP
     * -   TPM\_OwnerSetDisable
     * -   TPM\_PCR\_Reset
     * -   TPM\_PhysicalDisable
     * -   TPM\_PhysicalEnable
     * -   TPM\_PhysicalSetDeactivated
     * -   TPM\_Reset
     * -   TPM\_SaveState
     * -   TPM\_SelfTestFull
     * -   TPM\_SetCapability
     * -   TPM\_SHA1Complete
     * -   TPM\_SHA1Start
     * -   TPM\_SHA1Update
     * -   TPM\_Startup
     * -   TPM\_TakeOwnership
     * -   TPM\_Terminate\_Handle
     * 
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/SecProv/isenabled-win32-tpm
     */
    IsEnabled() {
        result := ComCall(22, this, BOOL.Ptr, &pfIsEnabled := 0, "HRESULT")
        return pfIsEnabled
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    SetEnabled(fEnable) {
        result := ComCall(23, this, BOOL, fEnable, "HRESULT")
        return result
    }

    Query(iid) {
        if (IOpenServiceActivity.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Execute := CallbackCreate(GetMethod(implObj, "Execute"), flags, 3)
        this.vtbl.CanExecute := CallbackCreate(GetMethod(implObj, "CanExecute"), flags, 4)
        this.vtbl.CanExecuteType := CallbackCreate(GetMethod(implObj, "CanExecuteType"), flags, 3)
        this.vtbl.Preview := CallbackCreate(GetMethod(implObj, "Preview"), flags, 3)
        this.vtbl.CanPreview := CallbackCreate(GetMethod(implObj, "CanPreview"), flags, 4)
        this.vtbl.CanPreviewType := CallbackCreate(GetMethod(implObj, "CanPreviewType"), flags, 3)
        this.vtbl.GetStatusText := CallbackCreate(GetMethod(implObj, "GetStatusText"), flags, 3)
        this.vtbl.GetHomepageUrl := CallbackCreate(GetMethod(implObj, "GetHomepageUrl"), flags, 2)
        this.vtbl.GetDisplayName := CallbackCreate(GetMethod(implObj, "GetDisplayName"), flags, 2)
        this.vtbl.GetDescription := CallbackCreate(GetMethod(implObj, "GetDescription"), flags, 2)
        this.vtbl.GetCategoryName := CallbackCreate(GetMethod(implObj, "GetCategoryName"), flags, 2)
        this.vtbl.GetIconPath := CallbackCreate(GetMethod(implObj, "GetIconPath"), flags, 2)
        this.vtbl.GetIcon := CallbackCreate(GetMethod(implObj, "GetIcon"), flags, 3)
        this.vtbl.GetDescriptionFilePath := CallbackCreate(GetMethod(implObj, "GetDescriptionFilePath"), flags, 2)
        this.vtbl.GetDownloadUrl := CallbackCreate(GetMethod(implObj, "GetDownloadUrl"), flags, 2)
        this.vtbl.GetInstallUrl := CallbackCreate(GetMethod(implObj, "GetInstallUrl"), flags, 2)
        this.vtbl.IsEnabled := CallbackCreate(GetMethod(implObj, "IsEnabled"), flags, 2)
        this.vtbl.SetEnabled := CallbackCreate(GetMethod(implObj, "SetEnabled"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Execute)
        CallbackFree(this.vtbl.CanExecute)
        CallbackFree(this.vtbl.CanExecuteType)
        CallbackFree(this.vtbl.Preview)
        CallbackFree(this.vtbl.CanPreview)
        CallbackFree(this.vtbl.CanPreviewType)
        CallbackFree(this.vtbl.GetStatusText)
        CallbackFree(this.vtbl.GetHomepageUrl)
        CallbackFree(this.vtbl.GetDisplayName)
        CallbackFree(this.vtbl.GetDescription)
        CallbackFree(this.vtbl.GetCategoryName)
        CallbackFree(this.vtbl.GetIconPath)
        CallbackFree(this.vtbl.GetIcon)
        CallbackFree(this.vtbl.GetDescriptionFilePath)
        CallbackFree(this.vtbl.GetDownloadUrl)
        CallbackFree(this.vtbl.GetInstallUrl)
        CallbackFree(this.vtbl.IsEnabled)
        CallbackFree(this.vtbl.SetEnabled)
    }
}
