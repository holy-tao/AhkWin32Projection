#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLDialog extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLDialog
     * @type {Guid}
     */
    static IID => Guid("{3050f216-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLDialog
     * @type {Guid}
     */
    static CLSID => Guid("{3050f28a-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_dialogTop", "get_dialogTop", "put_dialogLeft", "get_dialogLeft", "put_dialogWidth", "get_dialogWidth", "put_dialogHeight", "get_dialogHeight", "get_dialogArguments", "get_menuArguments", "put_returnValue", "get_returnValue", "close", "toString"]

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
        result := ComCall(7, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_dialogTop() {
        p := VARIANT()
        result := ComCall(8, this, "ptr", p, "int")
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
    put_dialogLeft(v) {
        result := ComCall(9, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_dialogLeft() {
        p := VARIANT()
        result := ComCall(10, this, "ptr", p, "int")
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
    put_dialogWidth(v) {
        result := ComCall(11, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_dialogWidth() {
        p := VARIANT()
        result := ComCall(12, this, "ptr", p, "int")
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
    put_dialogHeight(v) {
        result := ComCall(13, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_dialogHeight() {
        p := VARIANT()
        result := ComCall(14, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_dialogArguments() {
        p := VARIANT()
        result := ComCall(15, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_menuArguments() {
        p := VARIANT()
        result := ComCall(16, this, "ptr", p, "int")
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
    put_returnValue(v) {
        result := ComCall(17, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_returnValue() {
        p := VARIANT()
        result := ComCall(18, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/Multimedia/close
     */
    close() {
        result := ComCall(19, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * toString Method (DateTimeOffset)
     * @remarks
     * The string has the format `YYYY-MM-DD HH:mm:ss[.fffffff] [+|-]HH:mm`.  
     *   
     *  The fractional seconds of the returned string are zero padded to the declared precision. For example, a **datetimeoffset(6)** with a value of "2010-03-10 12:34:56.78 -08:00" will be formatted by DateTimeOffset.toString as "2010-03-10 12:34:56.780000 -08:00".
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/tostring-method-datetimeoffset
     */
    toString() {
        String_ := BSTR()
        result := ComCall(20, this, "ptr", String_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return String_
    }
}
