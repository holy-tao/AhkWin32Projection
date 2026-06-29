#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLAppBehavior extends IDispatch {
    /**
     * The interface identifier for IHTMLAppBehavior
     * @type {Guid}
     */
    static IID := Guid("{3050f5ca-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLAppBehavior
     * @type {Guid}
     */
    static CLSID := Guid("{3050f5cb-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLAppBehavior interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_applicationName : IntPtr
        get_applicationName : IntPtr
        put_version         : IntPtr
        get_version         : IntPtr
        put_icon            : IntPtr
        get_icon            : IntPtr
        put_singleInstance  : IntPtr
        get_singleInstance  : IntPtr
        put_minimizeButton  : IntPtr
        get_minimizeButton  : IntPtr
        put_maximizeButton  : IntPtr
        get_maximizeButton  : IntPtr
        put_border          : IntPtr
        get_border          : IntPtr
        put_borderStyle     : IntPtr
        get_borderStyle     : IntPtr
        put_sysMenu         : IntPtr
        get_sysMenu         : IntPtr
        put_caption         : IntPtr
        get_caption         : IntPtr
        put_windowState     : IntPtr
        get_windowState     : IntPtr
        put_showInTaskBar   : IntPtr
        get_showInTaskBar   : IntPtr
        get_commandLine     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLAppBehavior.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    applicationName {
        get => this.get_applicationName()
        set => this.put_applicationName(value)
    }

    /**
     * @type {BSTR} 
     */
    version {
        get => this.get_version()
        set => this.put_version(value)
    }

    /**
     * @type {BSTR} 
     */
    icon {
        get => this.get_icon()
        set => this.put_icon(value)
    }

    /**
     * @type {BSTR} 
     */
    singleInstance {
        get => this.get_singleInstance()
        set => this.put_singleInstance(value)
    }

    /**
     * @type {BSTR} 
     */
    minimizeButton {
        get => this.get_minimizeButton()
        set => this.put_minimizeButton(value)
    }

    /**
     * @type {BSTR} 
     */
    maximizeButton {
        get => this.get_maximizeButton()
        set => this.put_maximizeButton(value)
    }

    /**
     * @type {BSTR} 
     */
    border {
        get => this.get_border()
        set => this.put_border(value)
    }

    /**
     * @type {BSTR} 
     */
    borderStyle {
        get => this.get_borderStyle()
        set => this.put_borderStyle(value)
    }

    /**
     * @type {BSTR} 
     */
    sysMenu {
        get => this.get_sysMenu()
        set => this.put_sysMenu(value)
    }

    /**
     * @type {BSTR} 
     */
    caption {
        get => this.get_caption()
        set => this.put_caption(value)
    }

    /**
     * @type {BSTR} 
     */
    windowState {
        get => this.get_windowState()
        set => this.put_windowState(value)
    }

    /**
     * @type {BSTR} 
     */
    showInTaskBar {
        get => this.get_showInTaskBar()
        set => this.put_showInTaskBar(value)
    }

    /**
     * @type {BSTR} 
     */
    commandLine {
        get => this.get_commandLine()
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_applicationName(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_applicationName() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_version(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_version() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_icon(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_icon() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_singleInstance(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_singleInstance() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_minimizeButton(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(15, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_minimizeButton() {
        p := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_maximizeButton(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(17, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_maximizeButton() {
        p := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_border(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(19, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_border() {
        p := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(21, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderStyle() {
        p := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_sysMenu(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(23, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_sysMenu() {
        p := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_caption(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(25, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_caption() {
        p := BSTR.Owned()
        result := ComCall(26, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_windowState(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(27, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_windowState() {
        p := BSTR.Owned()
        result := ComCall(28, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_showInTaskBar(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(29, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_showInTaskBar() {
        p := BSTR.Owned()
        result := ComCall(30, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_commandLine() {
        p := BSTR.Owned()
        result := ComCall(31, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLAppBehavior.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_applicationName := CallbackCreate(GetMethod(implObj, "put_applicationName"), flags, 2)
        this.vtbl.get_applicationName := CallbackCreate(GetMethod(implObj, "get_applicationName"), flags, 2)
        this.vtbl.put_version := CallbackCreate(GetMethod(implObj, "put_version"), flags, 2)
        this.vtbl.get_version := CallbackCreate(GetMethod(implObj, "get_version"), flags, 2)
        this.vtbl.put_icon := CallbackCreate(GetMethod(implObj, "put_icon"), flags, 2)
        this.vtbl.get_icon := CallbackCreate(GetMethod(implObj, "get_icon"), flags, 2)
        this.vtbl.put_singleInstance := CallbackCreate(GetMethod(implObj, "put_singleInstance"), flags, 2)
        this.vtbl.get_singleInstance := CallbackCreate(GetMethod(implObj, "get_singleInstance"), flags, 2)
        this.vtbl.put_minimizeButton := CallbackCreate(GetMethod(implObj, "put_minimizeButton"), flags, 2)
        this.vtbl.get_minimizeButton := CallbackCreate(GetMethod(implObj, "get_minimizeButton"), flags, 2)
        this.vtbl.put_maximizeButton := CallbackCreate(GetMethod(implObj, "put_maximizeButton"), flags, 2)
        this.vtbl.get_maximizeButton := CallbackCreate(GetMethod(implObj, "get_maximizeButton"), flags, 2)
        this.vtbl.put_border := CallbackCreate(GetMethod(implObj, "put_border"), flags, 2)
        this.vtbl.get_border := CallbackCreate(GetMethod(implObj, "get_border"), flags, 2)
        this.vtbl.put_borderStyle := CallbackCreate(GetMethod(implObj, "put_borderStyle"), flags, 2)
        this.vtbl.get_borderStyle := CallbackCreate(GetMethod(implObj, "get_borderStyle"), flags, 2)
        this.vtbl.put_sysMenu := CallbackCreate(GetMethod(implObj, "put_sysMenu"), flags, 2)
        this.vtbl.get_sysMenu := CallbackCreate(GetMethod(implObj, "get_sysMenu"), flags, 2)
        this.vtbl.put_caption := CallbackCreate(GetMethod(implObj, "put_caption"), flags, 2)
        this.vtbl.get_caption := CallbackCreate(GetMethod(implObj, "get_caption"), flags, 2)
        this.vtbl.put_windowState := CallbackCreate(GetMethod(implObj, "put_windowState"), flags, 2)
        this.vtbl.get_windowState := CallbackCreate(GetMethod(implObj, "get_windowState"), flags, 2)
        this.vtbl.put_showInTaskBar := CallbackCreate(GetMethod(implObj, "put_showInTaskBar"), flags, 2)
        this.vtbl.get_showInTaskBar := CallbackCreate(GetMethod(implObj, "get_showInTaskBar"), flags, 2)
        this.vtbl.get_commandLine := CallbackCreate(GetMethod(implObj, "get_commandLine"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_applicationName)
        CallbackFree(this.vtbl.get_applicationName)
        CallbackFree(this.vtbl.put_version)
        CallbackFree(this.vtbl.get_version)
        CallbackFree(this.vtbl.put_icon)
        CallbackFree(this.vtbl.get_icon)
        CallbackFree(this.vtbl.put_singleInstance)
        CallbackFree(this.vtbl.get_singleInstance)
        CallbackFree(this.vtbl.put_minimizeButton)
        CallbackFree(this.vtbl.get_minimizeButton)
        CallbackFree(this.vtbl.put_maximizeButton)
        CallbackFree(this.vtbl.get_maximizeButton)
        CallbackFree(this.vtbl.put_border)
        CallbackFree(this.vtbl.get_border)
        CallbackFree(this.vtbl.put_borderStyle)
        CallbackFree(this.vtbl.get_borderStyle)
        CallbackFree(this.vtbl.put_sysMenu)
        CallbackFree(this.vtbl.get_sysMenu)
        CallbackFree(this.vtbl.put_caption)
        CallbackFree(this.vtbl.get_caption)
        CallbackFree(this.vtbl.put_windowState)
        CallbackFree(this.vtbl.get_windowState)
        CallbackFree(this.vtbl.put_showInTaskBar)
        CallbackFree(this.vtbl.get_showInTaskBar)
        CallbackFree(this.vtbl.get_commandLine)
    }
}
