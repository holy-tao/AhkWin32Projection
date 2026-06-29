#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLDialog extends IDispatch {
    /**
     * The interface identifier for IHTMLDialog
     * @type {Guid}
     */
    static IID := Guid("{3050f216-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLDialog
     * @type {Guid}
     */
    static CLSID := Guid("{3050f28a-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLDialog interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_dialogTop       : IntPtr
        get_dialogTop       : IntPtr
        put_dialogLeft      : IntPtr
        get_dialogLeft      : IntPtr
        put_dialogWidth     : IntPtr
        get_dialogWidth     : IntPtr
        put_dialogHeight    : IntPtr
        get_dialogHeight    : IntPtr
        get_dialogArguments : IntPtr
        get_menuArguments   : IntPtr
        put_returnValue     : IntPtr
        get_returnValue     : IntPtr
        close               : IntPtr
        toString            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLDialog.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    dialogTop {
        get => this.get_dialogTop()
        set => this.put_dialogTop(value)
    }

    /**
     * @type {VARIANT} 
     */
    dialogLeft {
        get => this.get_dialogLeft()
        set => this.put_dialogLeft(value)
    }

    /**
     * @type {VARIANT} 
     */
    dialogWidth {
        get => this.get_dialogWidth()
        set => this.put_dialogWidth(value)
    }

    /**
     * @type {VARIANT} 
     */
    dialogHeight {
        get => this.get_dialogHeight()
        set => this.put_dialogHeight(value)
    }

    /**
     * @type {VARIANT} 
     */
    dialogArguments {
        get => this.get_dialogArguments()
    }

    /**
     * @type {VARIANT} 
     */
    menuArguments {
        get => this.get_menuArguments()
    }

    /**
     * @type {VARIANT} 
     */
    returnValue {
        get => this.get_returnValue()
        set => this.put_returnValue(value)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_dialogTop(v) {
        result := ComCall(7, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_dialogTop() {
        p := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_dialogLeft(v) {
        result := ComCall(9, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_dialogLeft() {
        p := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_dialogWidth(v) {
        result := ComCall(11, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_dialogWidth() {
        p := VARIANT()
        result := ComCall(12, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_dialogHeight(v) {
        result := ComCall(13, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_dialogHeight() {
        p := VARIANT()
        result := ComCall(14, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_dialogArguments() {
        p := VARIANT()
        result := ComCall(15, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_menuArguments() {
        p := VARIANT()
        result := ComCall(16, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_returnValue(v) {
        result := ComCall(17, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_returnValue() {
        p := VARIANT()
        result := ComCall(18, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * The close command closes the device or file and any associated resources. MCI unloads a device when all instances of the device or all files are closed. All MCI devices recognize this command.
     * @remarks
     * To close all devices opened by your application, specify the "all" device identifier for the *lpszDeviceID* parameter.
     * 
     * Closing the **cdaudio** device stops audio playback.
     * 
     * **Windows 2000/XP:** If the **cdaudio** device is playing, closing the **cdaudio** device does not cause the audio to stop playing. Send the [stop](stop.md) command first.
     * @returns {HRESULT} <span id="lpszDeviceID"></span><span id="lpszdeviceid"></span><span id="LPSZDEVICEID"></span>*lpszDeviceID*
     * 
     * Identifier of an MCI device. This identifier or alias is assigned when the device is opened.
     * 
     * 
     * <span id="lpszFlags"></span><span id="lpszflags"></span><span id="LPSZFLAGS"></span>*lpszFlags*
     * 
     * Can be "wait", "notify", or both. For more information about these flags, see [The Wait, Notify, and Test Flags](the-wait-notify-and-test-flags.md).
     * 
     * 
     * 
     * Returns zero if successful or an error otherwise.
     * @see https://learn.microsoft.com/windows/win32/Multimedia/close
     */
    close() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    toString() {
        _String := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, _String, "HRESULT")
        return _String
    }

    Query(iid) {
        if (IHTMLDialog.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_dialogTop := CallbackCreate(GetMethod(implObj, "put_dialogTop"), flags, 2)
        this.vtbl.get_dialogTop := CallbackCreate(GetMethod(implObj, "get_dialogTop"), flags, 2)
        this.vtbl.put_dialogLeft := CallbackCreate(GetMethod(implObj, "put_dialogLeft"), flags, 2)
        this.vtbl.get_dialogLeft := CallbackCreate(GetMethod(implObj, "get_dialogLeft"), flags, 2)
        this.vtbl.put_dialogWidth := CallbackCreate(GetMethod(implObj, "put_dialogWidth"), flags, 2)
        this.vtbl.get_dialogWidth := CallbackCreate(GetMethod(implObj, "get_dialogWidth"), flags, 2)
        this.vtbl.put_dialogHeight := CallbackCreate(GetMethod(implObj, "put_dialogHeight"), flags, 2)
        this.vtbl.get_dialogHeight := CallbackCreate(GetMethod(implObj, "get_dialogHeight"), flags, 2)
        this.vtbl.get_dialogArguments := CallbackCreate(GetMethod(implObj, "get_dialogArguments"), flags, 2)
        this.vtbl.get_menuArguments := CallbackCreate(GetMethod(implObj, "get_menuArguments"), flags, 2)
        this.vtbl.put_returnValue := CallbackCreate(GetMethod(implObj, "put_returnValue"), flags, 2)
        this.vtbl.get_returnValue := CallbackCreate(GetMethod(implObj, "get_returnValue"), flags, 2)
        this.vtbl.close := CallbackCreate(GetMethod(implObj, "close"), flags, 1)
        this.vtbl.toString := CallbackCreate(GetMethod(implObj, "toString"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_dialogTop)
        CallbackFree(this.vtbl.get_dialogTop)
        CallbackFree(this.vtbl.put_dialogLeft)
        CallbackFree(this.vtbl.get_dialogLeft)
        CallbackFree(this.vtbl.put_dialogWidth)
        CallbackFree(this.vtbl.get_dialogWidth)
        CallbackFree(this.vtbl.put_dialogHeight)
        CallbackFree(this.vtbl.get_dialogHeight)
        CallbackFree(this.vtbl.get_dialogArguments)
        CallbackFree(this.vtbl.get_menuArguments)
        CallbackFree(this.vtbl.put_returnValue)
        CallbackFree(this.vtbl.get_returnValue)
        CallbackFree(this.vtbl.close)
        CallbackFree(this.vtbl.toString)
    }
}
