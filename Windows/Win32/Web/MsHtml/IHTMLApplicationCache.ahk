#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLApplicationCache extends IDispatch {
    /**
     * The interface identifier for IHTMLApplicationCache
     * @type {Guid}
     */
    static IID := Guid("{30510828-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLApplicationCache interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_status        : IntPtr
        put_onchecking    : IntPtr
        get_onchecking    : IntPtr
        put_onerror       : IntPtr
        get_onerror       : IntPtr
        put_onnoupdate    : IntPtr
        get_onnoupdate    : IntPtr
        put_ondownloading : IntPtr
        get_ondownloading : IntPtr
        put_onprogress    : IntPtr
        get_onprogress    : IntPtr
        put_onupdateready : IntPtr
        get_onupdateready : IntPtr
        put_oncached      : IntPtr
        get_oncached      : IntPtr
        put_onobsolete    : IntPtr
        get_onobsolete    : IntPtr
        update            : IntPtr
        swapCache         : IntPtr
        abort             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLApplicationCache.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    status {
        get => this.get_status()
    }

    /**
     * @type {VARIANT} 
     */
    onchecking {
        get => this.get_onchecking()
        set => this.put_onchecking(value)
    }

    /**
     * @type {VARIANT} 
     */
    onerror {
        get => this.get_onerror()
        set => this.put_onerror(value)
    }

    /**
     * @type {VARIANT} 
     */
    onnoupdate {
        get => this.get_onnoupdate()
        set => this.put_onnoupdate(value)
    }

    /**
     * @type {VARIANT} 
     */
    ondownloading {
        get => this.get_ondownloading()
        set => this.put_ondownloading(value)
    }

    /**
     * @type {VARIANT} 
     */
    onprogress {
        get => this.get_onprogress()
        set => this.put_onprogress(value)
    }

    /**
     * @type {VARIANT} 
     */
    onupdateready {
        get => this.get_onupdateready()
        set => this.put_onupdateready(value)
    }

    /**
     * @type {VARIANT} 
     */
    oncached {
        get => this.get_oncached()
        set => this.put_oncached(value)
    }

    /**
     * @type {VARIANT} 
     */
    onobsolete {
        get => this.get_onobsolete()
        set => this.put_onobsolete(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_status() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onchecking(v) {
        result := ComCall(8, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onchecking() {
        p := VARIANT()
        result := ComCall(9, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onerror(v) {
        result := ComCall(10, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onerror() {
        p := VARIANT()
        result := ComCall(11, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onnoupdate(v) {
        result := ComCall(12, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onnoupdate() {
        p := VARIANT()
        result := ComCall(13, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondownloading(v) {
        result := ComCall(14, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondownloading() {
        p := VARIANT()
        result := ComCall(15, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onprogress(v) {
        result := ComCall(16, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onprogress() {
        p := VARIANT()
        result := ComCall(17, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onupdateready(v) {
        result := ComCall(18, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onupdateready() {
        p := VARIANT()
        result := ComCall(19, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncached(v) {
        result := ComCall(20, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oncached() {
        p := VARIANT()
        result := ComCall(21, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onobsolete(v) {
        result := ComCall(22, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onobsolete() {
        p := VARIANT()
        result := ComCall(23, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * The update command repaints the current frame into the specified device context (DC). Digital-video devices recognize this command.
     * @returns {HRESULT} <span id="lpszDeviceID"></span><span id="lpszdeviceid"></span><span id="LPSZDEVICEID"></span>*lpszDeviceID*
     * 
     * Identifier of an MCI device. This identifier or alias is assigned when the device is opened.
     * 
     * 
     * <span id="lpszHDC"></span><span id="lpszhdc"></span><span id="LPSZHDC"></span>*lpszHDC*
     * 
     * Handle of a DC. The following table lists device types that recognize the **update** command and the flags used by each type.
     * 
     * 
     * 
     * | Value        | Meaning                       | Meaning         |
     * |--------------|-------------------------------|-----------------|
     * | digitalvideo | hdc *hdc* hdc *hdc* at *rect* | paint hdc *hdc* |
     * 
     * 
     * 
     *  
     * 
     * The following table lists the flags that can be specified in the **lpszHDC** parameter and their meanings.
     * 
     * 
     * 
     * | Value               | Meaning                                                                                                |
     * |---------------------|--------------------------------------------------------------------------------------------------------|
     * | hdc *hdc*           | Specifies the handle of the DC to paint.                                                               |
     * | hdc *hdc* at *rect* | Specifies the clipping rectangle relative to the client rectangle.                                     |
     * | paint hdc *hdc*     | Paints the DC when the application receives a [**WM\_PAINT**](/windows/desktop/gdi/wm-paint) message intended for a DC. |
     * 
     * 
     * 
     *  
     * 
     * To specify the handle of the DC, use the string "hdc" followed by an ASCII representation of the handle. The rectangle is specified as**X1 Y1 X2 Y2**. The coordinates**X1 Y1**specify the upper left corner of the rectangle, and the coordinates**X2 Y2**specify the width and height.
     * 
     * 
     * <span id="lpszFlags"></span><span id="lpszflags"></span><span id="LPSZFLAGS"></span>*lpszFlags*
     * 
     * Can be "wait", "notify", or both. For digital-video devices, "test" can also be specified. For more information about these flags, see [The Wait, Notify, and Test Flags](the-wait-notify-and-test-flags.md).
     * 
     * 
     * 
     * Returns zero if successful or an error otherwise.
     * @see https://learn.microsoft.com/windows/win32/Multimedia/update
     */
    update() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    swapCache() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    /**
     * Submits an error message to the information queue and terminates the current draw or dispatch call being executed.
     * @remarks
     * This operation does nothing on rasterizers that do not support it.
     * @returns {HRESULT} None
     * 
     * 
     * 
     * This function does not return a value.
     * @see https://learn.microsoft.com/windows/win32/direct3dhlsl/abort
     */
    abort() {
        result := ComCall(26, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLApplicationCache.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_status := CallbackCreate(GetMethod(implObj, "get_status"), flags, 2)
        this.vtbl.put_onchecking := CallbackCreate(GetMethod(implObj, "put_onchecking"), flags, 2)
        this.vtbl.get_onchecking := CallbackCreate(GetMethod(implObj, "get_onchecking"), flags, 2)
        this.vtbl.put_onerror := CallbackCreate(GetMethod(implObj, "put_onerror"), flags, 2)
        this.vtbl.get_onerror := CallbackCreate(GetMethod(implObj, "get_onerror"), flags, 2)
        this.vtbl.put_onnoupdate := CallbackCreate(GetMethod(implObj, "put_onnoupdate"), flags, 2)
        this.vtbl.get_onnoupdate := CallbackCreate(GetMethod(implObj, "get_onnoupdate"), flags, 2)
        this.vtbl.put_ondownloading := CallbackCreate(GetMethod(implObj, "put_ondownloading"), flags, 2)
        this.vtbl.get_ondownloading := CallbackCreate(GetMethod(implObj, "get_ondownloading"), flags, 2)
        this.vtbl.put_onprogress := CallbackCreate(GetMethod(implObj, "put_onprogress"), flags, 2)
        this.vtbl.get_onprogress := CallbackCreate(GetMethod(implObj, "get_onprogress"), flags, 2)
        this.vtbl.put_onupdateready := CallbackCreate(GetMethod(implObj, "put_onupdateready"), flags, 2)
        this.vtbl.get_onupdateready := CallbackCreate(GetMethod(implObj, "get_onupdateready"), flags, 2)
        this.vtbl.put_oncached := CallbackCreate(GetMethod(implObj, "put_oncached"), flags, 2)
        this.vtbl.get_oncached := CallbackCreate(GetMethod(implObj, "get_oncached"), flags, 2)
        this.vtbl.put_onobsolete := CallbackCreate(GetMethod(implObj, "put_onobsolete"), flags, 2)
        this.vtbl.get_onobsolete := CallbackCreate(GetMethod(implObj, "get_onobsolete"), flags, 2)
        this.vtbl.update := CallbackCreate(GetMethod(implObj, "update"), flags, 1)
        this.vtbl.swapCache := CallbackCreate(GetMethod(implObj, "swapCache"), flags, 1)
        this.vtbl.abort := CallbackCreate(GetMethod(implObj, "abort"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_status)
        CallbackFree(this.vtbl.put_onchecking)
        CallbackFree(this.vtbl.get_onchecking)
        CallbackFree(this.vtbl.put_onerror)
        CallbackFree(this.vtbl.get_onerror)
        CallbackFree(this.vtbl.put_onnoupdate)
        CallbackFree(this.vtbl.get_onnoupdate)
        CallbackFree(this.vtbl.put_ondownloading)
        CallbackFree(this.vtbl.get_ondownloading)
        CallbackFree(this.vtbl.put_onprogress)
        CallbackFree(this.vtbl.get_onprogress)
        CallbackFree(this.vtbl.put_onupdateready)
        CallbackFree(this.vtbl.get_onupdateready)
        CallbackFree(this.vtbl.put_oncached)
        CallbackFree(this.vtbl.get_oncached)
        CallbackFree(this.vtbl.put_onobsolete)
        CallbackFree(this.vtbl.get_onobsolete)
        CallbackFree(this.vtbl.update)
        CallbackFree(this.vtbl.swapCache)
        CallbackFree(this.vtbl.abort)
    }
}
