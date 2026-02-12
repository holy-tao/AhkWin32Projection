#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLApplicationCache extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLApplicationCache
     * @type {Guid}
     */
    static IID => Guid("{30510828-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_status", "put_onchecking", "get_onchecking", "put_onerror", "get_onerror", "put_onnoupdate", "get_onnoupdate", "put_ondownloading", "get_ondownloading", "put_onprogress", "get_onprogress", "put_onupdateready", "get_onupdateready", "put_oncached", "get_oncached", "put_onobsolete", "get_onobsolete", "update", "swapCache", "abort"]

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
        result := ComCall(7, this, "int*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onchecking(v) {
        result := ComCall(8, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onchecking() {
        p := VARIANT()
        result := ComCall(9, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onerror(v) {
        result := ComCall(10, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onerror() {
        p := VARIANT()
        result := ComCall(11, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onnoupdate(v) {
        result := ComCall(12, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onnoupdate() {
        p := VARIANT()
        result := ComCall(13, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondownloading(v) {
        result := ComCall(14, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondownloading() {
        p := VARIANT()
        result := ComCall(15, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onprogress(v) {
        result := ComCall(16, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onprogress() {
        p := VARIANT()
        result := ComCall(17, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onupdateready(v) {
        result := ComCall(18, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onupdateready() {
        p := VARIANT()
        result := ComCall(19, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_oncached(v) {
        result := ComCall(20, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_oncached() {
        p := VARIANT()
        result := ComCall(21, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onobsolete(v) {
        result := ComCall(22, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onobsolete() {
        p := VARIANT()
        result := ComCall(23, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/Multimedia/update
     */
    update() {
        result := ComCall(24, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    swapCache() {
        result := ComCall(25, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/direct3dhlsl/abort
     */
    abort() {
        result := ComCall(26, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
