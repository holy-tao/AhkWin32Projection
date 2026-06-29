#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLMarqueeElement extends IDispatch {
    /**
     * The interface identifier for IHTMLMarqueeElement
     * @type {Guid}
     */
    static IID := Guid("{3050f2b5-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLMarqueeElement
     * @type {Guid}
     */
    static CLSID := Guid("{3050f2b9-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLMarqueeElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_bgColor      : IntPtr
        get_bgColor      : IntPtr
        put_scrollDelay  : IntPtr
        get_scrollDelay  : IntPtr
        put_direction    : IntPtr
        get_direction    : IntPtr
        put_behavior     : IntPtr
        get_behavior     : IntPtr
        put_scrollAmount : IntPtr
        get_scrollAmount : IntPtr
        put_loop         : IntPtr
        get_loop         : IntPtr
        put_vspace       : IntPtr
        get_vspace       : IntPtr
        put_hspace       : IntPtr
        get_hspace       : IntPtr
        put_onfinish     : IntPtr
        get_onfinish     : IntPtr
        put_onstart      : IntPtr
        get_onstart      : IntPtr
        put_onbounce     : IntPtr
        get_onbounce     : IntPtr
        put_width        : IntPtr
        get_width        : IntPtr
        put_height       : IntPtr
        get_height       : IntPtr
        put_trueSpeed    : IntPtr
        get_trueSpeed    : IntPtr
        start            : IntPtr
        stop             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLMarqueeElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    bgColor {
        get => this.get_bgColor()
        set => this.put_bgColor(value)
    }

    /**
     * @type {Integer} 
     */
    scrollDelay {
        get => this.get_scrollDelay()
        set => this.put_scrollDelay(value)
    }

    /**
     * @type {BSTR} 
     */
    direction {
        get => this.get_direction()
        set => this.put_direction(value)
    }

    /**
     * @type {BSTR} 
     */
    behavior {
        get => this.get_behavior()
        set => this.put_behavior(value)
    }

    /**
     * @type {Integer} 
     */
    scrollAmount {
        get => this.get_scrollAmount()
        set => this.put_scrollAmount(value)
    }

    /**
     * @type {Integer} 
     */
    loop {
        get => this.get_loop()
        set => this.put_loop(value)
    }

    /**
     * @type {Integer} 
     */
    vspace {
        get => this.get_vspace()
        set => this.put_vspace(value)
    }

    /**
     * @type {Integer} 
     */
    hspace {
        get => this.get_hspace()
        set => this.put_hspace(value)
    }

    /**
     * @type {VARIANT} 
     */
    onfinish {
        get => this.get_onfinish()
        set => this.put_onfinish(value)
    }

    /**
     * @type {VARIANT} 
     */
    onstart {
        get => this.get_onstart()
        set => this.put_onstart(value)
    }

    /**
     * @type {VARIANT} 
     */
    onbounce {
        get => this.get_onbounce()
        set => this.put_onbounce(value)
    }

    /**
     * @type {VARIANT} 
     */
    width {
        get => this.get_width()
        set => this.put_width(value)
    }

    /**
     * @type {VARIANT} 
     */
    height {
        get => this.get_height()
        set => this.put_height(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    trueSpeed {
        get => this.get_trueSpeed()
        set => this.put_trueSpeed(value)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_bgColor(v) {
        result := ComCall(7, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_bgColor() {
        p := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_scrollDelay(v) {
        result := ComCall(9, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_scrollDelay() {
        result := ComCall(10, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_direction(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_direction() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_behavior(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_behavior() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_scrollAmount(v) {
        result := ComCall(15, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_scrollAmount() {
        result := ComCall(16, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_loop(v) {
        result := ComCall(17, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_loop() {
        result := ComCall(18, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_vspace(v) {
        result := ComCall(19, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_vspace() {
        result := ComCall(20, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_hspace(v) {
        result := ComCall(21, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_hspace() {
        result := ComCall(22, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onfinish(v) {
        result := ComCall(23, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onfinish() {
        p := VARIANT()
        result := ComCall(24, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onstart(v) {
        result := ComCall(25, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onstart() {
        p := VARIANT()
        result := ComCall(26, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbounce(v) {
        result := ComCall(27, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onbounce() {
        p := VARIANT()
        result := ComCall(28, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_width(v) {
        result := ComCall(29, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_width() {
        p := VARIANT()
        result := ComCall(30, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_height(v) {
        result := ComCall(31, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_height() {
        p := VARIANT()
        result := ComCall(32, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_trueSpeed(v) {
        result := ComCall(33, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_trueSpeed() {
        result := ComCall(34, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    start() {
        result := ComCall(35, this, "HRESULT")
        return result
    }

    /**
     * The stop command stops playback or recording. CD audio, digital-video, MIDI sequencer, videodisc, VCR, and waveform-audio devices recognize this command.
     * @remarks
     * For CD audio devices, the stop command stops playback and resets the current track position to zero.
     * @returns {HRESULT} <span id="lpszDeviceID"></span><span id="lpszdeviceid"></span><span id="LPSZDEVICEID"></span>*lpszDeviceID*
     * 
     * Identifier of an MCI device. This identifier or alias is assigned when the device is opened.
     * 
     * 
     * <span id="lpszStopFlags"></span><span id="lpszstopflags"></span><span id="LPSZSTOPFLAGS"></span>*lpszStopFlags*
     * 
     * For digital-video devices, it can be the following flag.
     * 
     * 
     * 
     * | Value | Meaning                                                                                                                                                                                      |
     * |-------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | hold  | Prevents the release of resources required to redraw a still image on the screen. The frame buffer remains available for use in updating the display when, for example, the window is moved. |
     * 
     * 
     * 
     *  
     * 
     * 
     * <span id="lpszFlags"></span><span id="lpszflags"></span><span id="LPSZFLAGS"></span>*lpszFlags*
     * 
     * Can be "wait", "notify", or both. For digital-video and VCR devices, "test" can also be specified. For more information about these flags, see [The Wait, Notify, and Test Flags](the-wait-notify-and-test-flags.md).
     * 
     * 
     * 
     * Returns zero if successful or an error otherwise.
     * @see https://learn.microsoft.com/windows/win32/Multimedia/stop
     */
    stop() {
        result := ComCall(36, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLMarqueeElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_bgColor := CallbackCreate(GetMethod(implObj, "put_bgColor"), flags, 2)
        this.vtbl.get_bgColor := CallbackCreate(GetMethod(implObj, "get_bgColor"), flags, 2)
        this.vtbl.put_scrollDelay := CallbackCreate(GetMethod(implObj, "put_scrollDelay"), flags, 2)
        this.vtbl.get_scrollDelay := CallbackCreate(GetMethod(implObj, "get_scrollDelay"), flags, 2)
        this.vtbl.put_direction := CallbackCreate(GetMethod(implObj, "put_direction"), flags, 2)
        this.vtbl.get_direction := CallbackCreate(GetMethod(implObj, "get_direction"), flags, 2)
        this.vtbl.put_behavior := CallbackCreate(GetMethod(implObj, "put_behavior"), flags, 2)
        this.vtbl.get_behavior := CallbackCreate(GetMethod(implObj, "get_behavior"), flags, 2)
        this.vtbl.put_scrollAmount := CallbackCreate(GetMethod(implObj, "put_scrollAmount"), flags, 2)
        this.vtbl.get_scrollAmount := CallbackCreate(GetMethod(implObj, "get_scrollAmount"), flags, 2)
        this.vtbl.put_loop := CallbackCreate(GetMethod(implObj, "put_loop"), flags, 2)
        this.vtbl.get_loop := CallbackCreate(GetMethod(implObj, "get_loop"), flags, 2)
        this.vtbl.put_vspace := CallbackCreate(GetMethod(implObj, "put_vspace"), flags, 2)
        this.vtbl.get_vspace := CallbackCreate(GetMethod(implObj, "get_vspace"), flags, 2)
        this.vtbl.put_hspace := CallbackCreate(GetMethod(implObj, "put_hspace"), flags, 2)
        this.vtbl.get_hspace := CallbackCreate(GetMethod(implObj, "get_hspace"), flags, 2)
        this.vtbl.put_onfinish := CallbackCreate(GetMethod(implObj, "put_onfinish"), flags, 2)
        this.vtbl.get_onfinish := CallbackCreate(GetMethod(implObj, "get_onfinish"), flags, 2)
        this.vtbl.put_onstart := CallbackCreate(GetMethod(implObj, "put_onstart"), flags, 2)
        this.vtbl.get_onstart := CallbackCreate(GetMethod(implObj, "get_onstart"), flags, 2)
        this.vtbl.put_onbounce := CallbackCreate(GetMethod(implObj, "put_onbounce"), flags, 2)
        this.vtbl.get_onbounce := CallbackCreate(GetMethod(implObj, "get_onbounce"), flags, 2)
        this.vtbl.put_width := CallbackCreate(GetMethod(implObj, "put_width"), flags, 2)
        this.vtbl.get_width := CallbackCreate(GetMethod(implObj, "get_width"), flags, 2)
        this.vtbl.put_height := CallbackCreate(GetMethod(implObj, "put_height"), flags, 2)
        this.vtbl.get_height := CallbackCreate(GetMethod(implObj, "get_height"), flags, 2)
        this.vtbl.put_trueSpeed := CallbackCreate(GetMethod(implObj, "put_trueSpeed"), flags, 2)
        this.vtbl.get_trueSpeed := CallbackCreate(GetMethod(implObj, "get_trueSpeed"), flags, 2)
        this.vtbl.start := CallbackCreate(GetMethod(implObj, "start"), flags, 1)
        this.vtbl.stop := CallbackCreate(GetMethod(implObj, "stop"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_bgColor)
        CallbackFree(this.vtbl.get_bgColor)
        CallbackFree(this.vtbl.put_scrollDelay)
        CallbackFree(this.vtbl.get_scrollDelay)
        CallbackFree(this.vtbl.put_direction)
        CallbackFree(this.vtbl.get_direction)
        CallbackFree(this.vtbl.put_behavior)
        CallbackFree(this.vtbl.get_behavior)
        CallbackFree(this.vtbl.put_scrollAmount)
        CallbackFree(this.vtbl.get_scrollAmount)
        CallbackFree(this.vtbl.put_loop)
        CallbackFree(this.vtbl.get_loop)
        CallbackFree(this.vtbl.put_vspace)
        CallbackFree(this.vtbl.get_vspace)
        CallbackFree(this.vtbl.put_hspace)
        CallbackFree(this.vtbl.get_hspace)
        CallbackFree(this.vtbl.put_onfinish)
        CallbackFree(this.vtbl.get_onfinish)
        CallbackFree(this.vtbl.put_onstart)
        CallbackFree(this.vtbl.get_onstart)
        CallbackFree(this.vtbl.put_onbounce)
        CallbackFree(this.vtbl.get_onbounce)
        CallbackFree(this.vtbl.put_width)
        CallbackFree(this.vtbl.get_width)
        CallbackFree(this.vtbl.put_height)
        CallbackFree(this.vtbl.get_height)
        CallbackFree(this.vtbl.put_trueSpeed)
        CallbackFree(this.vtbl.get_trueSpeed)
        CallbackFree(this.vtbl.start)
        CallbackFree(this.vtbl.stop)
    }
}
