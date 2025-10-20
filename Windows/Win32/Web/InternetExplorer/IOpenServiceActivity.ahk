#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOpenService.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IOpenServiceActivity extends IOpenService{
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
     * 
     * @param {Pointer<IOpenServiceActivityInput>} pInput 
     * @param {Pointer<IOpenServiceActivityOutputContext>} pOutput 
     * @returns {HRESULT} 
     */
    Execute(pInput, pOutput) {
        result := ComCall(6, this, "ptr", pInput, "ptr", pOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpenServiceActivityInput>} pInput 
     * @param {Pointer<IOpenServiceActivityOutputContext>} pOutput 
     * @param {Pointer<BOOL>} pfCanExecute 
     * @returns {HRESULT} 
     */
    CanExecute(pInput, pOutput, pfCanExecute) {
        result := ComCall(7, this, "ptr", pInput, "ptr", pOutput, "ptr", pfCanExecute, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @param {Pointer<BOOL>} pfCanExecute 
     * @returns {HRESULT} 
     */
    CanExecuteType(type, pfCanExecute) {
        result := ComCall(8, this, "int", type, "ptr", pfCanExecute, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpenServiceActivityInput>} pInput 
     * @param {Pointer<IOpenServiceActivityOutputContext>} pOutput 
     * @returns {HRESULT} 
     */
    Preview(pInput, pOutput) {
        result := ComCall(9, this, "ptr", pInput, "ptr", pOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpenServiceActivityInput>} pInput 
     * @param {Pointer<IOpenServiceActivityOutputContext>} pOutput 
     * @param {Pointer<BOOL>} pfCanPreview 
     * @returns {HRESULT} 
     */
    CanPreview(pInput, pOutput, pfCanPreview) {
        result := ComCall(10, this, "ptr", pInput, "ptr", pOutput, "ptr", pfCanPreview, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @param {Pointer<BOOL>} pfCanPreview 
     * @returns {HRESULT} 
     */
    CanPreviewType(type, pfCanPreview) {
        result := ComCall(11, this, "int", type, "ptr", pfCanPreview, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpenServiceActivityInput>} pInput 
     * @param {Pointer<BSTR>} pbstrStatusText 
     * @returns {HRESULT} 
     */
    GetStatusText(pInput, pbstrStatusText) {
        result := ComCall(12, this, "ptr", pInput, "ptr", pbstrStatusText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrHomepageUrl 
     * @returns {HRESULT} 
     */
    GetHomepageUrl(pbstrHomepageUrl) {
        result := ComCall(13, this, "ptr", pbstrHomepageUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDisplayName 
     * @returns {HRESULT} 
     */
    GetDisplayName(pbstrDisplayName) {
        result := ComCall(14, this, "ptr", pbstrDisplayName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDescription 
     * @returns {HRESULT} 
     */
    GetDescription(pbstrDescription) {
        result := ComCall(15, this, "ptr", pbstrDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCategoryName 
     * @returns {HRESULT} 
     */
    GetCategoryName(pbstrCategoryName) {
        result := ComCall(16, this, "ptr", pbstrCategoryName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrIconPath 
     * @returns {HRESULT} 
     */
    GetIconPath(pbstrIconPath) {
        result := ComCall(17, this, "ptr", pbstrIconPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fSmallIcon 
     * @param {Pointer<HICON>} phIcon 
     * @returns {HRESULT} 
     */
    GetIcon(fSmallIcon, phIcon) {
        result := ComCall(18, this, "int", fSmallIcon, "ptr", phIcon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrXmlPath 
     * @returns {HRESULT} 
     */
    GetDescriptionFilePath(pbstrXmlPath) {
        result := ComCall(19, this, "ptr", pbstrXmlPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrXmlUri 
     * @returns {HRESULT} 
     */
    GetDownloadUrl(pbstrXmlUri) {
        result := ComCall(20, this, "ptr", pbstrXmlUri, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrInstallUri 
     * @returns {HRESULT} 
     */
    GetInstallUrl(pbstrInstallUri) {
        result := ComCall(21, this, "ptr", pbstrInstallUri, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfIsEnabled 
     * @returns {HRESULT} 
     */
    IsEnabled(pfIsEnabled) {
        result := ComCall(22, this, "ptr", pfIsEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    SetEnabled(fEnable) {
        result := ComCall(23, this, "int", fEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
