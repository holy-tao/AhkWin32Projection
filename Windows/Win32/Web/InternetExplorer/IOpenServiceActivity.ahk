#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\UI\WindowsAndMessaging\HICON.ahk
#Include .\IOpenService.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IOpenServiceActivity extends IOpenService{

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
     * @param {Integer} type 
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
     * @param {Integer} type 
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
        pbstrStatusText := BSTR()
        result := ComCall(12, this, "ptr", pInput, "ptr", pbstrStatusText, "HRESULT")
        return pbstrStatusText
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetHomepageUrl() {
        pbstrHomepageUrl := BSTR()
        result := ComCall(13, this, "ptr", pbstrHomepageUrl, "HRESULT")
        return pbstrHomepageUrl
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetDisplayName() {
        pbstrDisplayName := BSTR()
        result := ComCall(14, this, "ptr", pbstrDisplayName, "HRESULT")
        return pbstrDisplayName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetDescription() {
        pbstrDescription := BSTR()
        result := ComCall(15, this, "ptr", pbstrDescription, "HRESULT")
        return pbstrDescription
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetCategoryName() {
        pbstrCategoryName := BSTR()
        result := ComCall(16, this, "ptr", pbstrCategoryName, "HRESULT")
        return pbstrCategoryName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetIconPath() {
        pbstrIconPath := BSTR()
        result := ComCall(17, this, "ptr", pbstrIconPath, "HRESULT")
        return pbstrIconPath
    }

    /**
     * 
     * @param {BOOL} fSmallIcon 
     * @returns {HICON} 
     */
    GetIcon(fSmallIcon) {
        phIcon := HICON()
        result := ComCall(18, this, "int", fSmallIcon, "ptr", phIcon, "HRESULT")
        return phIcon
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetDescriptionFilePath() {
        pbstrXmlPath := BSTR()
        result := ComCall(19, this, "ptr", pbstrXmlPath, "HRESULT")
        return pbstrXmlPath
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetDownloadUrl() {
        pbstrXmlUri := BSTR()
        result := ComCall(20, this, "ptr", pbstrXmlUri, "HRESULT")
        return pbstrXmlUri
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetInstallUrl() {
        pbstrInstallUri := BSTR()
        result := ComCall(21, this, "ptr", pbstrInstallUri, "HRESULT")
        return pbstrInstallUri
    }

    /**
     * 
     * @returns {BOOL} 
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
