#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\..\..\Foundation\RECT.ahk
#Include .\IMSVidGraphSegment.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidVRGraphSegment extends IMSVidGraphSegment{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidVRGraphSegment
     * @type {Guid}
     */
    static IID => Guid("{dd47de3f-9874-4f7b-8b22-7cb2688461e7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put__VMRendererMode", "put_Owner", "get_Owner", "get_UseOverlay", "put_UseOverlay", "get_Visible", "put_Visible", "get_ColorKey", "put_ColorKey", "get_Source", "put_Source", "get_Destination", "put_Destination", "get_NativeSize", "get_BorderColor", "put_BorderColor", "get_MaintainAspectRatio", "put_MaintainAspectRatio", "Refresh", "DisplayChange", "RePaint"]

    /**
     * @type {HRESULT} 
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
        result := ComCall(19, this, "int", dwMode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HWND} Window 
     * @returns {HRESULT} 
     */
    put_Owner(Window) {
        Window := Window is Win32Handle ? NumGet(Window, "ptr") : Window

        result := ComCall(20, this, "ptr", Window, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HWND} 
     */
    get_Owner() {
        Window := HWND()
        result := ComCall(21, this, "ptr", Window, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Window
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_UseOverlay() {
        result := ComCall(22, this, "short*", &UseOverlayVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UseOverlayVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} UseOverlayVal 
     * @returns {HRESULT} 
     */
    put_UseOverlay(UseOverlayVal) {
        result := ComCall(23, this, "short", UseOverlayVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Visible() {
        result := ComCall(24, this, "short*", &Visible := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Visible
    }

    /**
     * 
     * @param {VARIANT_BOOL} Visible 
     * @returns {HRESULT} 
     */
    put_Visible(Visible) {
        result := ComCall(25, this, "short", Visible, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColorKey() {
        result := ComCall(26, this, "uint*", &ColorKey_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ColorKey_
    }

    /**
     * 
     * @param {Integer} ColorKey_ 
     * @returns {HRESULT} 
     */
    put_ColorKey(ColorKey_) {
        result := ComCall(27, this, "uint", ColorKey_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_Source() {
        r := RECT()
        result := ComCall(28, this, "ptr", r, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return r
    }

    /**
     * 
     * @param {RECT} r 
     * @returns {HRESULT} 
     */
    put_Source(r) {
        result := ComCall(29, this, "ptr", r, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_Destination() {
        r := RECT()
        result := ComCall(30, this, "ptr", r, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return r
    }

    /**
     * 
     * @param {RECT} r 
     * @returns {HRESULT} 
     */
    put_Destination(r) {
        result := ComCall(31, this, "ptr", r, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<SIZE>} sizeval 
     * @param {Pointer<SIZE>} aspectratio 
     * @returns {HRESULT} 
     */
    get_NativeSize(sizeval, aspectratio) {
        result := ComCall(32, this, "ptr", sizeval, "ptr", aspectratio, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BorderColor() {
        result := ComCall(33, this, "uint*", &color_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return color_
    }

    /**
     * 
     * @param {Integer} color_ 
     * @returns {HRESULT} 
     */
    put_BorderColor(color_) {
        result := ComCall(34, this, "uint", color_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_MaintainAspectRatio() {
        result := ComCall(35, this, "short*", &fMaintain := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return fMaintain
    }

    /**
     * 
     * @param {VARIANT_BOOL} fMaintain 
     * @returns {HRESULT} 
     */
    put_MaintainAspectRatio(fMaintain) {
        result := ComCall(36, this, "short", fMaintain, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Refresh Method (RDS)
     * @remarks
     * You must set the [Connect](./connect-property-rds.md), [Server](./server-property-rds.md), and [SQL](./sql-property.md) properties before you use the **Refresh** method. All data-bound controls on the form associated with an **RDS.DataControl** object will reflect the new set of records. Any pre-existing [Recordset](../ado-api/recordset-object-ado.md) object is released, and any unsaved changes are discarded. The **Refresh** method automatically makes the first record the current record.  
     *   
     *  It is a good idea to call the **Refresh** method periodically when you work with data. If you retrieve data, and then leave it on a client computer for a while, it is likely to become out of date. It is possible that any changes that you make will fail, because someone else might have changed the record and submitted changes before you.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/rds-api/refresh-method-rds
     */
    Refresh() {
        result := ComCall(37, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisplayChange() {
        result := ComCall(38, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HDC} hdc_ 
     * @returns {HRESULT} 
     */
    RePaint(hdc_) {
        hdc_ := hdc_ is Win32Handle ? NumGet(hdc_, "ptr") : hdc_

        result := ComCall(39, this, "ptr", hdc_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
