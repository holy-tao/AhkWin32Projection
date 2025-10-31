#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IShellUIHelper3.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellUIHelper4 extends IShellUIHelper3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellUIHelper4
     * @type {Guid}
     */
    static IID => Guid("{b36e6a53-8073-499e-824c-d776330a333e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 49

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["msIsSiteMode", "msSiteModeShowThumbBar", "msSiteModeAddThumbBarButton", "msSiteModeUpdateThumbBarButton", "msSiteModeSetIconOverlay", "msSiteModeClearIconOverlay", "msAddSiteMode", "msSiteModeCreateJumpList", "msSiteModeAddJumpListItem", "msSiteModeClearJumpList", "msSiteModeShowJumpList", "msSiteModeAddButtonStyle", "msSiteModeShowButtonStyle", "msSiteModeActivate", "msIsSiteModeFirstRun", "msAddTrackingProtectionList", "msTrackingProtectionEnabled", "msActiveXFilteringEnabled"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfSiteMode 
     * @returns {HRESULT} 
     */
    msIsSiteMode(pfSiteMode) {
        result := ComCall(49, this, "ptr", pfSiteMode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    msSiteModeShowThumbBar() {
        result := ComCall(50, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrIconURL 
     * @param {BSTR} bstrTooltip 
     * @param {Pointer<VARIANT>} pvarButtonID 
     * @returns {HRESULT} 
     */
    msSiteModeAddThumbBarButton(bstrIconURL, bstrTooltip, pvarButtonID) {
        bstrIconURL := bstrIconURL is String ? BSTR.Alloc(bstrIconURL).Value : bstrIconURL
        bstrTooltip := bstrTooltip is String ? BSTR.Alloc(bstrTooltip).Value : bstrTooltip

        result := ComCall(51, this, "ptr", bstrIconURL, "ptr", bstrTooltip, "ptr", pvarButtonID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} ButtonID 
     * @param {VARIANT_BOOL} fEnabled 
     * @param {VARIANT_BOOL} fVisible 
     * @returns {HRESULT} 
     */
    msSiteModeUpdateThumbBarButton(ButtonID, fEnabled, fVisible) {
        result := ComCall(52, this, "ptr", ButtonID, "short", fEnabled, "short", fVisible, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} IconUrl 
     * @param {Pointer<VARIANT>} pvarDescription 
     * @returns {HRESULT} 
     */
    msSiteModeSetIconOverlay(IconUrl, pvarDescription) {
        IconUrl := IconUrl is String ? BSTR.Alloc(IconUrl).Value : IconUrl

        result := ComCall(53, this, "ptr", IconUrl, "ptr", pvarDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    msSiteModeClearIconOverlay() {
        result := ComCall(54, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    msAddSiteMode() {
        result := ComCall(55, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrHeader 
     * @returns {HRESULT} 
     */
    msSiteModeCreateJumpList(bstrHeader) {
        bstrHeader := bstrHeader is String ? BSTR.Alloc(bstrHeader).Value : bstrHeader

        result := ComCall(56, this, "ptr", bstrHeader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrActionUri 
     * @param {BSTR} bstrIconUri 
     * @param {Pointer<VARIANT>} pvarWindowType 
     * @returns {HRESULT} 
     */
    msSiteModeAddJumpListItem(bstrName, bstrActionUri, bstrIconUri, pvarWindowType) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrActionUri := bstrActionUri is String ? BSTR.Alloc(bstrActionUri).Value : bstrActionUri
        bstrIconUri := bstrIconUri is String ? BSTR.Alloc(bstrIconUri).Value : bstrIconUri

        result := ComCall(57, this, "ptr", bstrName, "ptr", bstrActionUri, "ptr", bstrIconUri, "ptr", pvarWindowType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    msSiteModeClearJumpList() {
        result := ComCall(58, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    msSiteModeShowJumpList() {
        result := ComCall(59, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} uiButtonID 
     * @param {BSTR} bstrIconUrl 
     * @param {BSTR} bstrTooltip 
     * @param {Pointer<VARIANT>} pvarStyleID 
     * @returns {HRESULT} 
     */
    msSiteModeAddButtonStyle(uiButtonID, bstrIconUrl, bstrTooltip, pvarStyleID) {
        bstrIconUrl := bstrIconUrl is String ? BSTR.Alloc(bstrIconUrl).Value : bstrIconUrl
        bstrTooltip := bstrTooltip is String ? BSTR.Alloc(bstrTooltip).Value : bstrTooltip

        result := ComCall(60, this, "ptr", uiButtonID, "ptr", bstrIconUrl, "ptr", bstrTooltip, "ptr", pvarStyleID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} uiButtonID 
     * @param {VARIANT} uiStyleID 
     * @returns {HRESULT} 
     */
    msSiteModeShowButtonStyle(uiButtonID, uiStyleID) {
        result := ComCall(61, this, "ptr", uiButtonID, "ptr", uiStyleID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    msSiteModeActivate() {
        result := ComCall(62, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fPreserveState 
     * @param {Pointer<VARIANT>} puiFirstRun 
     * @returns {HRESULT} 
     */
    msIsSiteModeFirstRun(fPreserveState, puiFirstRun) {
        result := ComCall(63, this, "short", fPreserveState, "ptr", puiFirstRun, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} URL 
     * @param {BSTR} bstrFilterName 
     * @returns {HRESULT} 
     */
    msAddTrackingProtectionList(URL, bstrFilterName) {
        URL := URL is String ? BSTR.Alloc(URL).Value : URL
        bstrFilterName := bstrFilterName is String ? BSTR.Alloc(bstrFilterName).Value : bstrFilterName

        result := ComCall(64, this, "ptr", URL, "ptr", bstrFilterName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfEnabled 
     * @returns {HRESULT} 
     */
    msTrackingProtectionEnabled(pfEnabled) {
        result := ComCall(65, this, "ptr", pfEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfEnabled 
     * @returns {HRESULT} 
     */
    msActiveXFilteringEnabled(pfEnabled) {
        result := ComCall(66, this, "ptr", pfEnabled, "HRESULT")
        return result
    }
}
