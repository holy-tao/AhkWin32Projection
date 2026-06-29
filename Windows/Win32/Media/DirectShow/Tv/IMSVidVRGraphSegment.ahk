#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSVidGraphSegment.ahk" { IMSVidGraphSegment }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Graphics\Gdi\HDC.ahk" { HDC }
#Import "..\..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidVRGraphSegment extends IMSVidGraphSegment {
    /**
     * The interface identifier for IMSVidVRGraphSegment
     * @type {Guid}
     */
    static IID := Guid("{dd47de3f-9874-4f7b-8b22-7cb2688461e7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidVRGraphSegment interfaces
    */
    struct Vtbl extends IMSVidGraphSegment.Vtbl {
        put__VMRendererMode     : IntPtr
        put_Owner               : IntPtr
        get_Owner               : IntPtr
        get_UseOverlay          : IntPtr
        put_UseOverlay          : IntPtr
        get_Visible             : IntPtr
        put_Visible             : IntPtr
        get_ColorKey            : IntPtr
        put_ColorKey            : IntPtr
        get_Source              : IntPtr
        put_Source              : IntPtr
        get_Destination         : IntPtr
        put_Destination         : IntPtr
        get_NativeSize          : IntPtr
        get_BorderColor         : IntPtr
        put_BorderColor         : IntPtr
        get_MaintainAspectRatio : IntPtr
        put_MaintainAspectRatio : IntPtr
        Refresh                 : IntPtr
        DisplayChange           : IntPtr
        RePaint                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidVRGraphSegment.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    _VMRendererMode {
        set => this.put__VMRendererMode(value)
    }

    /**
     * @type {HWND} 
     */
    Owner {
        get => this.get_Owner()
        set => this.put_Owner(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    UseOverlay {
        get => this.get_UseOverlay()
        set => this.put_UseOverlay(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Visible {
        get => this.get_Visible()
        set => this.put_Visible(value)
    }

    /**
     * @type {Integer} 
     */
    ColorKey {
        get => this.get_ColorKey()
        set => this.put_ColorKey(value)
    }

    /**
     * @type {RECT} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * @type {RECT} 
     */
    Destination {
        get => this.get_Destination()
        set => this.put_Destination(value)
    }

    /**
     * @type {Integer} 
     */
    BorderColor {
        get => this.get_BorderColor()
        set => this.put_BorderColor(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    MaintainAspectRatio {
        get => this.get_MaintainAspectRatio()
        set => this.put_MaintainAspectRatio(value)
    }

    /**
     * 
     * @param {Integer} dwMode 
     * @returns {HRESULT} 
     */
    put__VMRendererMode(dwMode) {
        result := ComCall(19, this, "int", dwMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} Window 
     * @returns {HRESULT} 
     */
    put_Owner(Window) {
        result := ComCall(20, this, HWND, Window, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HWND} 
     */
    get_Owner() {
        Window := HWND()
        result := ComCall(21, this, HWND.Ptr, Window, "HRESULT")
        return Window
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_UseOverlay() {
        result := ComCall(22, this, VARIANT_BOOL.Ptr, &UseOverlayVal := 0, "HRESULT")
        return UseOverlayVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} UseOverlayVal 
     * @returns {HRESULT} 
     */
    put_UseOverlay(UseOverlayVal) {
        result := ComCall(23, this, VARIANT_BOOL, UseOverlayVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Visible() {
        result := ComCall(24, this, VARIANT_BOOL.Ptr, &Visible := 0, "HRESULT")
        return Visible
    }

    /**
     * 
     * @param {VARIANT_BOOL} Visible 
     * @returns {HRESULT} 
     */
    put_Visible(Visible) {
        result := ComCall(25, this, VARIANT_BOOL, Visible, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColorKey() {
        result := ComCall(26, this, "uint*", &_ColorKey := 0, "HRESULT")
        return _ColorKey
    }

    /**
     * 
     * @param {Integer} _ColorKey 
     * @returns {HRESULT} 
     */
    put_ColorKey(_ColorKey) {
        result := ComCall(27, this, "uint", _ColorKey, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_Source() {
        r := RECT()
        result := ComCall(28, this, RECT.Ptr, r, "HRESULT")
        return r
    }

    /**
     * 
     * @param {RECT} r 
     * @returns {HRESULT} 
     */
    put_Source(r) {
        result := ComCall(29, this, RECT, r, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_Destination() {
        r := RECT()
        result := ComCall(30, this, RECT.Ptr, r, "HRESULT")
        return r
    }

    /**
     * 
     * @param {RECT} r 
     * @returns {HRESULT} 
     */
    put_Destination(r) {
        result := ComCall(31, this, RECT, r, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SIZE>} sizeval 
     * @param {Pointer<SIZE>} aspectratio 
     * @returns {HRESULT} 
     */
    get_NativeSize(sizeval, aspectratio) {
        result := ComCall(32, this, SIZE.Ptr, sizeval, SIZE.Ptr, aspectratio, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BorderColor() {
        result := ComCall(33, this, "uint*", &_color := 0, "HRESULT")
        return _color
    }

    /**
     * 
     * @param {Integer} _color 
     * @returns {HRESULT} 
     */
    put_BorderColor(_color) {
        result := ComCall(34, this, "uint", _color, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_MaintainAspectRatio() {
        result := ComCall(35, this, VARIANT_BOOL.Ptr, &fMaintain := 0, "HRESULT")
        return fMaintain
    }

    /**
     * 
     * @param {VARIANT_BOOL} fMaintain 
     * @returns {HRESULT} 
     */
    put_MaintainAspectRatio(fMaintain) {
        result := ComCall(36, this, VARIANT_BOOL, fMaintain, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(37, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisplayChange() {
        result := ComCall(38, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HDC} _hdc 
     * @returns {HRESULT} 
     */
    RePaint(_hdc) {
        result := ComCall(39, this, HDC, _hdc, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidVRGraphSegment.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put__VMRendererMode := CallbackCreate(GetMethod(implObj, "put__VMRendererMode"), flags, 2)
        this.vtbl.put_Owner := CallbackCreate(GetMethod(implObj, "put_Owner"), flags, 2)
        this.vtbl.get_Owner := CallbackCreate(GetMethod(implObj, "get_Owner"), flags, 2)
        this.vtbl.get_UseOverlay := CallbackCreate(GetMethod(implObj, "get_UseOverlay"), flags, 2)
        this.vtbl.put_UseOverlay := CallbackCreate(GetMethod(implObj, "put_UseOverlay"), flags, 2)
        this.vtbl.get_Visible := CallbackCreate(GetMethod(implObj, "get_Visible"), flags, 2)
        this.vtbl.put_Visible := CallbackCreate(GetMethod(implObj, "put_Visible"), flags, 2)
        this.vtbl.get_ColorKey := CallbackCreate(GetMethod(implObj, "get_ColorKey"), flags, 2)
        this.vtbl.put_ColorKey := CallbackCreate(GetMethod(implObj, "put_ColorKey"), flags, 2)
        this.vtbl.get_Source := CallbackCreate(GetMethod(implObj, "get_Source"), flags, 2)
        this.vtbl.put_Source := CallbackCreate(GetMethod(implObj, "put_Source"), flags, 2)
        this.vtbl.get_Destination := CallbackCreate(GetMethod(implObj, "get_Destination"), flags, 2)
        this.vtbl.put_Destination := CallbackCreate(GetMethod(implObj, "put_Destination"), flags, 2)
        this.vtbl.get_NativeSize := CallbackCreate(GetMethod(implObj, "get_NativeSize"), flags, 3)
        this.vtbl.get_BorderColor := CallbackCreate(GetMethod(implObj, "get_BorderColor"), flags, 2)
        this.vtbl.put_BorderColor := CallbackCreate(GetMethod(implObj, "put_BorderColor"), flags, 2)
        this.vtbl.get_MaintainAspectRatio := CallbackCreate(GetMethod(implObj, "get_MaintainAspectRatio"), flags, 2)
        this.vtbl.put_MaintainAspectRatio := CallbackCreate(GetMethod(implObj, "put_MaintainAspectRatio"), flags, 2)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 1)
        this.vtbl.DisplayChange := CallbackCreate(GetMethod(implObj, "DisplayChange"), flags, 1)
        this.vtbl.RePaint := CallbackCreate(GetMethod(implObj, "RePaint"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put__VMRendererMode)
        CallbackFree(this.vtbl.put_Owner)
        CallbackFree(this.vtbl.get_Owner)
        CallbackFree(this.vtbl.get_UseOverlay)
        CallbackFree(this.vtbl.put_UseOverlay)
        CallbackFree(this.vtbl.get_Visible)
        CallbackFree(this.vtbl.put_Visible)
        CallbackFree(this.vtbl.get_ColorKey)
        CallbackFree(this.vtbl.put_ColorKey)
        CallbackFree(this.vtbl.get_Source)
        CallbackFree(this.vtbl.put_Source)
        CallbackFree(this.vtbl.get_Destination)
        CallbackFree(this.vtbl.put_Destination)
        CallbackFree(this.vtbl.get_NativeSize)
        CallbackFree(this.vtbl.get_BorderColor)
        CallbackFree(this.vtbl.put_BorderColor)
        CallbackFree(this.vtbl.get_MaintainAspectRatio)
        CallbackFree(this.vtbl.put_MaintainAspectRatio)
        CallbackFree(this.vtbl.Refresh)
        CallbackFree(this.vtbl.DisplayChange)
        CallbackFree(this.vtbl.RePaint)
    }
}
