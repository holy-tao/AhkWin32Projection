#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
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
     * @returns {VARIANT_BOOL} 
     */
    msIsSiteMode() {
        result := ComCall(49, this, "short*", &pfSiteMode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfSiteMode
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    msSiteModeShowThumbBar() {
        result := ComCall(50, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrIconURL 
     * @param {BSTR} bstrTooltip 
     * @returns {VARIANT} 
     */
    msSiteModeAddThumbBarButton(bstrIconURL, bstrTooltip) {
        if(bstrIconURL is String) {
            pin := BSTR.Alloc(bstrIconURL)
            bstrIconURL := pin.Value
        }
        if(bstrTooltip is String) {
            pin := BSTR.Alloc(bstrTooltip)
            bstrTooltip := pin.Value
        }

        pvarButtonID := VARIANT()
        result := ComCall(51, this, "ptr", bstrIconURL, "ptr", bstrTooltip, "ptr", pvarButtonID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarButtonID
    }

    /**
     * 
     * @param {VARIANT} ButtonID 
     * @param {VARIANT_BOOL} fEnabled 
     * @param {VARIANT_BOOL} fVisible 
     * @returns {HRESULT} 
     */
    msSiteModeUpdateThumbBarButton(ButtonID, fEnabled, fVisible) {
        result := ComCall(52, this, "ptr", ButtonID, "short", fEnabled, "short", fVisible, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} IconUrl 
     * @param {Pointer<VARIANT>} pvarDescription 
     * @returns {HRESULT} 
     */
    msSiteModeSetIconOverlay(IconUrl, pvarDescription) {
        if(IconUrl is String) {
            pin := BSTR.Alloc(IconUrl)
            IconUrl := pin.Value
        }

        result := ComCall(53, this, "ptr", IconUrl, "ptr", pvarDescription, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    msSiteModeClearIconOverlay() {
        result := ComCall(54, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    msAddSiteMode() {
        result := ComCall(55, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrHeader 
     * @returns {HRESULT} 
     */
    msSiteModeCreateJumpList(bstrHeader) {
        if(bstrHeader is String) {
            pin := BSTR.Alloc(bstrHeader)
            bstrHeader := pin.Value
        }

        result := ComCall(56, this, "ptr", bstrHeader, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }
        if(bstrActionUri is String) {
            pin := BSTR.Alloc(bstrActionUri)
            bstrActionUri := pin.Value
        }
        if(bstrIconUri is String) {
            pin := BSTR.Alloc(bstrIconUri)
            bstrIconUri := pin.Value
        }

        result := ComCall(57, this, "ptr", bstrName, "ptr", bstrActionUri, "ptr", bstrIconUri, "ptr", pvarWindowType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    msSiteModeClearJumpList() {
        result := ComCall(58, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    msSiteModeShowJumpList() {
        result := ComCall(59, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VARIANT} uiButtonID 
     * @param {BSTR} bstrIconUrl 
     * @param {BSTR} bstrTooltip 
     * @returns {VARIANT} 
     */
    msSiteModeAddButtonStyle(uiButtonID, bstrIconUrl, bstrTooltip) {
        if(bstrIconUrl is String) {
            pin := BSTR.Alloc(bstrIconUrl)
            bstrIconUrl := pin.Value
        }
        if(bstrTooltip is String) {
            pin := BSTR.Alloc(bstrTooltip)
            bstrTooltip := pin.Value
        }

        pvarStyleID := VARIANT()
        result := ComCall(60, this, "ptr", uiButtonID, "ptr", bstrIconUrl, "ptr", bstrTooltip, "ptr", pvarStyleID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarStyleID
    }

    /**
     * 
     * @param {VARIANT} uiButtonID 
     * @param {VARIANT} uiStyleID 
     * @returns {HRESULT} 
     */
    msSiteModeShowButtonStyle(uiButtonID, uiStyleID) {
        result := ComCall(61, this, "ptr", uiButtonID, "ptr", uiStyleID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    msSiteModeActivate() {
        result := ComCall(62, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fPreserveState 
     * @returns {VARIANT} 
     */
    msIsSiteModeFirstRun(fPreserveState) {
        puiFirstRun := VARIANT()
        result := ComCall(63, this, "short", fPreserveState, "ptr", puiFirstRun, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return puiFirstRun
    }

    /**
     * 
     * @param {BSTR} URL 
     * @param {BSTR} bstrFilterName 
     * @returns {HRESULT} 
     */
    msAddTrackingProtectionList(URL, bstrFilterName) {
        if(URL is String) {
            pin := BSTR.Alloc(URL)
            URL := pin.Value
        }
        if(bstrFilterName is String) {
            pin := BSTR.Alloc(bstrFilterName)
            bstrFilterName := pin.Value
        }

        result := ComCall(64, this, "ptr", URL, "ptr", bstrFilterName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    msTrackingProtectionEnabled() {
        result := ComCall(65, this, "short*", &pfEnabled := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfEnabled
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    msActiveXFilteringEnabled() {
        result := ComCall(66, this, "short*", &pfEnabled := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfEnabled
    }
}
