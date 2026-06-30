#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IOpenServiceActivityInput.ahk
#Include ..\..\UI\WindowsAndMessaging\HICON.ahk
#Include .\OpenServiceActivityContentType.ahk
#Include .\IOpenService.ahk
#Include .\IOpenServiceActivityOutputContext.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
class IOpenServiceActivity extends IOpenService {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpenServiceActivity
     * @type {Guid}
     */
    static IID => Guid("{13645c88-221a-4905-8ed1-4f5112cfc108}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Execute", "CanExecute", "CanExecuteType", "Preview", "CanPreview", "CanPreviewType", "GetStatusText", "GetHomepageUrl", "GetDisplayName", "GetDescription", "GetCategoryName", "GetIconPath", "GetIcon", "GetDescriptionFilePath", "GetDownloadUrl", "GetInstallUrl", "IsEnabled", "SetEnabled"]

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
        result := ComCall(7, this, "ptr", pInput, "ptr", pOutput, "int*", &pfCanExecute := 0, "HRESULT")
        return pfCanExecute
    }

    /**
     * 
     * @param {OpenServiceActivityContentType} type 
     * @returns {BOOL} 
     */
    CanExecuteType(type) {
        result := ComCall(8, this, "int", type, "int*", &pfCanExecute := 0, "HRESULT")
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
        result := ComCall(10, this, "ptr", pInput, "ptr", pOutput, "int*", &pfCanPreview := 0, "HRESULT")
        return pfCanPreview
    }

    /**
     * 
     * @param {OpenServiceActivityContentType} type 
     * @returns {BOOL} 
     */
    CanPreviewType(type) {
        result := ComCall(11, this, "int", type, "int*", &pfCanPreview := 0, "HRESULT")
        return pfCanPreview
    }

    /**
     * 
     * @param {IOpenServiceActivityInput} pInput 
     * @returns {BSTR} 
     */
    GetStatusText(pInput) {
        pbstrStatusText := BSTR({Value: 0}, True)
        result := ComCall(12, this, "ptr", pInput, "ptr", pbstrStatusText, "HRESULT")
        return pbstrStatusText
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetHomepageUrl() {
        pbstrHomepageUrl := BSTR({Value: 0}, True)
        result := ComCall(13, this, "ptr", pbstrHomepageUrl, "HRESULT")
        return pbstrHomepageUrl
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetDisplayName() {
        pbstrDisplayName := BSTR({Value: 0}, True)
        result := ComCall(14, this, "ptr", pbstrDisplayName, "HRESULT")
        return pbstrDisplayName
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetDescription
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecstrings-getdescription
     */
    GetDescription() {
        pbstrDescription := BSTR({Value: 0}, True)
        result := ComCall(15, this, "ptr", pbstrDescription, "HRESULT")
        return pbstrDescription
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetCategoryName() {
        pbstrCategoryName := BSTR({Value: 0}, True)
        result := ComCall(16, this, "ptr", pbstrCategoryName, "HRESULT")
        return pbstrCategoryName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetIconPath() {
        pbstrIconPath := BSTR({Value: 0}, True)
        result := ComCall(17, this, "ptr", pbstrIconPath, "HRESULT")
        return pbstrIconPath
    }

    /**
     * 
     * @param {BOOL} fSmallIcon 
     * @returns {HICON} 
     */
    GetIcon(fSmallIcon) {
        phIcon := HICON({Value: 0}, True)
        result := ComCall(18, this, "int", fSmallIcon, "ptr", phIcon, "HRESULT")
        return phIcon
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetDescriptionFilePath() {
        pbstrXmlPath := BSTR({Value: 0}, True)
        result := ComCall(19, this, "ptr", pbstrXmlPath, "HRESULT")
        return pbstrXmlPath
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetDownloadUrl() {
        pbstrXmlUri := BSTR({Value: 0}, True)
        result := ComCall(20, this, "ptr", pbstrXmlUri, "HRESULT")
        return pbstrXmlUri
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetInstallUrl() {
        pbstrInstallUri := BSTR({Value: 0}, True)
        result := ComCall(21, this, "ptr", pbstrInstallUri, "HRESULT")
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
        result := ComCall(22, this, "int*", &pfIsEnabled := 0, "HRESULT")
        return pfIsEnabled
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    SetEnabled(fEnable) {
        result := ComCall(23, this, "int", fEnable, "HRESULT")
        return result
    }
}
