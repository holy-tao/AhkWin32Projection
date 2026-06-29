#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IShellUIHelper3.ahk" { IShellUIHelper3 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellUIHelper4 extends IShellUIHelper3 {
    /**
     * The interface identifier for IShellUIHelper4
     * @type {Guid}
     */
    static IID := Guid("{b36e6a53-8073-499e-824c-d776330a333e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellUIHelper4 interfaces
    */
    struct Vtbl extends IShellUIHelper3.Vtbl {
        msIsSiteMode                   : IntPtr
        msSiteModeShowThumbBar         : IntPtr
        msSiteModeAddThumbBarButton    : IntPtr
        msSiteModeUpdateThumbBarButton : IntPtr
        msSiteModeSetIconOverlay       : IntPtr
        msSiteModeClearIconOverlay     : IntPtr
        msAddSiteMode                  : IntPtr
        msSiteModeCreateJumpList       : IntPtr
        msSiteModeAddJumpListItem      : IntPtr
        msSiteModeClearJumpList        : IntPtr
        msSiteModeShowJumpList         : IntPtr
        msSiteModeAddButtonStyle       : IntPtr
        msSiteModeShowButtonStyle      : IntPtr
        msSiteModeActivate             : IntPtr
        msIsSiteModeFirstRun           : IntPtr
        msAddTrackingProtectionList    : IntPtr
        msTrackingProtectionEnabled    : IntPtr
        msActiveXFilteringEnabled      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellUIHelper4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    msIsSiteMode() {
        result := ComCall(49, this, VARIANT_BOOL.Ptr, &pfSiteMode := 0, "HRESULT")
        return pfSiteMode
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
     * @returns {VARIANT} 
     */
    msSiteModeAddThumbBarButton(bstrIconURL, bstrTooltip) {
        bstrIconURL := bstrIconURL is String ? BSTR.Alloc(bstrIconURL).Value : bstrIconURL
        bstrTooltip := bstrTooltip is String ? BSTR.Alloc(bstrTooltip).Value : bstrTooltip

        pvarButtonID := VARIANT()
        result := ComCall(51, this, BSTR, bstrIconURL, BSTR, bstrTooltip, VARIANT.Ptr, pvarButtonID, "HRESULT")
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
        result := ComCall(52, this, VARIANT, ButtonID, VARIANT_BOOL, fEnabled, VARIANT_BOOL, fVisible, "HRESULT")
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

        result := ComCall(53, this, BSTR, IconUrl, VARIANT.Ptr, pvarDescription, "HRESULT")
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

        result := ComCall(56, this, BSTR, bstrHeader, "HRESULT")
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

        result := ComCall(57, this, BSTR, bstrName, BSTR, bstrActionUri, BSTR, bstrIconUri, VARIANT.Ptr, pvarWindowType, "HRESULT")
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
     * @returns {VARIANT} 
     */
    msSiteModeAddButtonStyle(uiButtonID, bstrIconUrl, bstrTooltip) {
        bstrIconUrl := bstrIconUrl is String ? BSTR.Alloc(bstrIconUrl).Value : bstrIconUrl
        bstrTooltip := bstrTooltip is String ? BSTR.Alloc(bstrTooltip).Value : bstrTooltip

        pvarStyleID := VARIANT()
        result := ComCall(60, this, VARIANT, uiButtonID, BSTR, bstrIconUrl, BSTR, bstrTooltip, VARIANT.Ptr, pvarStyleID, "HRESULT")
        return pvarStyleID
    }

    /**
     * 
     * @param {VARIANT} uiButtonID 
     * @param {VARIANT} uiStyleID 
     * @returns {HRESULT} 
     */
    msSiteModeShowButtonStyle(uiButtonID, uiStyleID) {
        result := ComCall(61, this, VARIANT, uiButtonID, VARIANT, uiStyleID, "HRESULT")
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
     * @returns {VARIANT} 
     */
    msIsSiteModeFirstRun(fPreserveState) {
        puiFirstRun := VARIANT()
        result := ComCall(63, this, VARIANT_BOOL, fPreserveState, VARIANT.Ptr, puiFirstRun, "HRESULT")
        return puiFirstRun
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

        result := ComCall(64, this, BSTR, URL, BSTR, bstrFilterName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    msTrackingProtectionEnabled() {
        result := ComCall(65, this, VARIANT_BOOL.Ptr, &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    msActiveXFilteringEnabled() {
        result := ComCall(66, this, VARIANT_BOOL.Ptr, &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    Query(iid) {
        if (IShellUIHelper4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.msIsSiteMode := CallbackCreate(GetMethod(implObj, "msIsSiteMode"), flags, 2)
        this.vtbl.msSiteModeShowThumbBar := CallbackCreate(GetMethod(implObj, "msSiteModeShowThumbBar"), flags, 1)
        this.vtbl.msSiteModeAddThumbBarButton := CallbackCreate(GetMethod(implObj, "msSiteModeAddThumbBarButton"), flags, 4)
        this.vtbl.msSiteModeUpdateThumbBarButton := CallbackCreate(GetMethod(implObj, "msSiteModeUpdateThumbBarButton"), flags, 4)
        this.vtbl.msSiteModeSetIconOverlay := CallbackCreate(GetMethod(implObj, "msSiteModeSetIconOverlay"), flags, 3)
        this.vtbl.msSiteModeClearIconOverlay := CallbackCreate(GetMethod(implObj, "msSiteModeClearIconOverlay"), flags, 1)
        this.vtbl.msAddSiteMode := CallbackCreate(GetMethod(implObj, "msAddSiteMode"), flags, 1)
        this.vtbl.msSiteModeCreateJumpList := CallbackCreate(GetMethod(implObj, "msSiteModeCreateJumpList"), flags, 2)
        this.vtbl.msSiteModeAddJumpListItem := CallbackCreate(GetMethod(implObj, "msSiteModeAddJumpListItem"), flags, 5)
        this.vtbl.msSiteModeClearJumpList := CallbackCreate(GetMethod(implObj, "msSiteModeClearJumpList"), flags, 1)
        this.vtbl.msSiteModeShowJumpList := CallbackCreate(GetMethod(implObj, "msSiteModeShowJumpList"), flags, 1)
        this.vtbl.msSiteModeAddButtonStyle := CallbackCreate(GetMethod(implObj, "msSiteModeAddButtonStyle"), flags, 5)
        this.vtbl.msSiteModeShowButtonStyle := CallbackCreate(GetMethod(implObj, "msSiteModeShowButtonStyle"), flags, 3)
        this.vtbl.msSiteModeActivate := CallbackCreate(GetMethod(implObj, "msSiteModeActivate"), flags, 1)
        this.vtbl.msIsSiteModeFirstRun := CallbackCreate(GetMethod(implObj, "msIsSiteModeFirstRun"), flags, 3)
        this.vtbl.msAddTrackingProtectionList := CallbackCreate(GetMethod(implObj, "msAddTrackingProtectionList"), flags, 3)
        this.vtbl.msTrackingProtectionEnabled := CallbackCreate(GetMethod(implObj, "msTrackingProtectionEnabled"), flags, 2)
        this.vtbl.msActiveXFilteringEnabled := CallbackCreate(GetMethod(implObj, "msActiveXFilteringEnabled"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.msIsSiteMode)
        CallbackFree(this.vtbl.msSiteModeShowThumbBar)
        CallbackFree(this.vtbl.msSiteModeAddThumbBarButton)
        CallbackFree(this.vtbl.msSiteModeUpdateThumbBarButton)
        CallbackFree(this.vtbl.msSiteModeSetIconOverlay)
        CallbackFree(this.vtbl.msSiteModeClearIconOverlay)
        CallbackFree(this.vtbl.msAddSiteMode)
        CallbackFree(this.vtbl.msSiteModeCreateJumpList)
        CallbackFree(this.vtbl.msSiteModeAddJumpListItem)
        CallbackFree(this.vtbl.msSiteModeClearJumpList)
        CallbackFree(this.vtbl.msSiteModeShowJumpList)
        CallbackFree(this.vtbl.msSiteModeAddButtonStyle)
        CallbackFree(this.vtbl.msSiteModeShowButtonStyle)
        CallbackFree(this.vtbl.msSiteModeActivate)
        CallbackFree(this.vtbl.msIsSiteModeFirstRun)
        CallbackFree(this.vtbl.msAddTrackingProtectionList)
        CallbackFree(this.vtbl.msTrackingProtectionEnabled)
        CallbackFree(this.vtbl.msActiveXFilteringEnabled)
    }
}
