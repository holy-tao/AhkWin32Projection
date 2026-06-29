#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWMPCore2.ahk" { IWMPCore2 }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IWMPPlayer3 interface provides methods for modifying the basic behavior of the control user interface. These methods supplement the IWMPCore2 interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpplayer3
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPPlayer3 extends IWMPCore2 {
    /**
     * The interface identifier for IWMPPlayer3
     * @type {Guid}
     */
    static IID := Guid("{54062b68-052a-4c25-a39f-8b63346511d4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPPlayer3 interfaces
    */
    struct Vtbl extends IWMPCore2.Vtbl {
        get_enabled           : IntPtr
        put_enabled           : IntPtr
        get_fullScreen        : IntPtr
        put_fullScreen        : IntPtr
        get_enableContextMenu : IntPtr
        put_enableContextMenu : IntPtr
        put_uiMode            : IntPtr
        get_uiMode            : IntPtr
        get_stretchToFit      : IntPtr
        put_stretchToFit      : IntPtr
        get_windowlessVideo   : IntPtr
        put_windowlessVideo   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPPlayer3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    enabled {
        get => this.get_enabled()
        set => this.put_enabled(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    fullScreen {
        get => this.get_fullScreen()
        set => this.put_fullScreen(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    enableContextMenu {
        get => this.get_enableContextMenu()
        set => this.put_enableContextMenu(value)
    }

    /**
     * @type {BSTR} 
     */
    uiMode {
        get => this.get_uiMode()
        set => this.put_uiMode(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    stretchToFit {
        get => this.get_stretchToFit()
        set => this.put_stretchToFit(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    windowlessVideo {
        get => this.get_windowlessVideo()
        set => this.put_windowlessVideo(value)
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnabled 
     * @returns {HRESULT} 
     */
    get_enabled(pbEnabled) {
        pbEnabledMarshal := pbEnabled is VarRef ? "short*" : "ptr"

        result := ComCall(29, this, pbEnabledMarshal, pbEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    put_enabled(bEnabled) {
        result := ComCall(30, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbFullScreen 
     * @returns {HRESULT} 
     */
    get_fullScreen(pbFullScreen) {
        pbFullScreenMarshal := pbFullScreen is VarRef ? "short*" : "ptr"

        result := ComCall(31, this, pbFullScreenMarshal, pbFullScreen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bFullScreen 
     * @returns {HRESULT} 
     */
    put_fullScreen(bFullScreen) {
        result := ComCall(32, this, VARIANT_BOOL, bFullScreen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnableContextMenu 
     * @returns {HRESULT} 
     */
    get_enableContextMenu(pbEnableContextMenu) {
        pbEnableContextMenuMarshal := pbEnableContextMenu is VarRef ? "short*" : "ptr"

        result := ComCall(33, this, pbEnableContextMenuMarshal, pbEnableContextMenu, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnableContextMenu 
     * @returns {HRESULT} 
     */
    put_enableContextMenu(bEnableContextMenu) {
        result := ComCall(34, this, VARIANT_BOOL, bEnableContextMenu, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrMode 
     * @returns {HRESULT} 
     */
    put_uiMode(bstrMode) {
        bstrMode := bstrMode is String ? BSTR.Alloc(bstrMode).Value : bstrMode

        result := ComCall(35, this, BSTR, bstrMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrMode 
     * @returns {HRESULT} 
     */
    get_uiMode(pbstrMode) {
        result := ComCall(36, this, BSTR.Ptr, pbstrMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnabled 
     * @returns {HRESULT} 
     */
    get_stretchToFit(pbEnabled) {
        pbEnabledMarshal := pbEnabled is VarRef ? "short*" : "ptr"

        result := ComCall(37, this, pbEnabledMarshal, pbEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    put_stretchToFit(bEnabled) {
        result := ComCall(38, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnabled 
     * @returns {HRESULT} 
     */
    get_windowlessVideo(pbEnabled) {
        pbEnabledMarshal := pbEnabled is VarRef ? "short*" : "ptr"

        result := ComCall(39, this, pbEnabledMarshal, pbEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    put_windowlessVideo(bEnabled) {
        result := ComCall(40, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPPlayer3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_enabled := CallbackCreate(GetMethod(implObj, "get_enabled"), flags, 2)
        this.vtbl.put_enabled := CallbackCreate(GetMethod(implObj, "put_enabled"), flags, 2)
        this.vtbl.get_fullScreen := CallbackCreate(GetMethod(implObj, "get_fullScreen"), flags, 2)
        this.vtbl.put_fullScreen := CallbackCreate(GetMethod(implObj, "put_fullScreen"), flags, 2)
        this.vtbl.get_enableContextMenu := CallbackCreate(GetMethod(implObj, "get_enableContextMenu"), flags, 2)
        this.vtbl.put_enableContextMenu := CallbackCreate(GetMethod(implObj, "put_enableContextMenu"), flags, 2)
        this.vtbl.put_uiMode := CallbackCreate(GetMethod(implObj, "put_uiMode"), flags, 2)
        this.vtbl.get_uiMode := CallbackCreate(GetMethod(implObj, "get_uiMode"), flags, 2)
        this.vtbl.get_stretchToFit := CallbackCreate(GetMethod(implObj, "get_stretchToFit"), flags, 2)
        this.vtbl.put_stretchToFit := CallbackCreate(GetMethod(implObj, "put_stretchToFit"), flags, 2)
        this.vtbl.get_windowlessVideo := CallbackCreate(GetMethod(implObj, "get_windowlessVideo"), flags, 2)
        this.vtbl.put_windowlessVideo := CallbackCreate(GetMethod(implObj, "put_windowlessVideo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_enabled)
        CallbackFree(this.vtbl.put_enabled)
        CallbackFree(this.vtbl.get_fullScreen)
        CallbackFree(this.vtbl.put_fullScreen)
        CallbackFree(this.vtbl.get_enableContextMenu)
        CallbackFree(this.vtbl.put_enableContextMenu)
        CallbackFree(this.vtbl.put_uiMode)
        CallbackFree(this.vtbl.get_uiMode)
        CallbackFree(this.vtbl.get_stretchToFit)
        CallbackFree(this.vtbl.put_stretchToFit)
        CallbackFree(this.vtbl.get_windowlessVideo)
        CallbackFree(this.vtbl.put_windowlessVideo)
    }
}
