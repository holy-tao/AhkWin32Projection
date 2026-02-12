#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLFramesCollection2.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IHTMLImageElementFactory.ahk
#Include .\IHTMLLocation.ahk
#Include .\IOmHistory.ahk
#Include .\IOmNavigator.ahk
#Include .\IHTMLWindow2.ahk
#Include .\IHTMLDocument2.ahk
#Include .\IHTMLEventObj.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IHTMLScreen.ahk
#Include .\IHTMLOptionElementFactory.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLWindow2 extends IHTMLFramesCollection2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLWindow2
     * @type {Guid}
     */
    static IID => Guid("{332c4427-26cb-11d0-b483-00c04fd90119}")

    /**
     * The class identifier for HTMLWindow2
     * @type {Guid}
     */
    static CLSID => Guid("{d48a6ec6-6a4a-11cf-94a7-444553540000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_frames", "put_defaultStatus", "get_defaultStatus", "put_status", "get_status", "setTimeout", "clearTimeout", "alert", "confirm", "prompt", "get_Image", "get_location", "get_history", "close", "put_opener", "get_opener", "get_navigator", "put_name", "get_name", "get_parent", "open", "get_self", "get_top", "get_window", "navigate", "put_onfocus", "get_onfocus", "put_onblur", "get_onblur", "put_onload", "get_onload", "put_onbeforeunload", "get_onbeforeunload", "put_onunload", "get_onunload", "put_onhelp", "get_onhelp", "put_onerror", "get_onerror", "put_onresize", "get_onresize", "put_onscroll", "get_onscroll", "get_document", "get_event", "get__newEnum", "showModalDialog", "showHelp", "get_screen", "get_Option", "focus", "get_closed", "blur", "scroll", "get_clientInformation", "setInterval", "clearInterval", "put_offscreenBuffering", "get_offscreenBuffering", "execScript", "toString", "scrollBy", "scrollTo", "moveTo", "moveBy", "resizeTo", "resizeBy", "get_external"]

    /**
     * @type {IHTMLFramesCollection2} 
     */
    frames {
        get => this.get_frames()
    }

    /**
     * @type {BSTR} 
     */
    defaultStatus {
        get => this.get_defaultStatus()
        set => this.put_defaultStatus(value)
    }

    /**
     * @type {BSTR} 
     */
    status {
        get => this.get_status()
        set => this.put_status(value)
    }

    /**
     * @type {IHTMLImageElementFactory} 
     */
    Image {
        get => this.get_Image()
    }

    /**
     * @type {IHTMLLocation} 
     */
    location {
        get => this.get_location()
    }

    /**
     * @type {IOmHistory} 
     */
    history {
        get => this.get_history()
    }

    /**
     * @type {VARIANT} 
     */
    opener {
        get => this.get_opener()
        set => this.put_opener(value)
    }

    /**
     * @type {IOmNavigator} 
     */
    navigator {
        get => this.get_navigator()
    }

    /**
     * @type {BSTR} 
     */
    name {
        get => this.get_name()
        set => this.put_name(value)
    }

    /**
     * @type {IHTMLWindow2} 
     */
    parent {
        get => this.get_parent()
    }

    /**
     * @type {IHTMLWindow2} 
     */
    self {
        get => this.get_self()
    }

    /**
     * @type {IHTMLWindow2} 
     */
    top {
        get => this.get_top()
    }

    /**
     * @type {IHTMLWindow2} 
     */
    window {
        get => this.get_window()
    }

    /**
     * @type {VARIANT} 
     */
    onfocus {
        get => this.get_onfocus()
        set => this.put_onfocus(value)
    }

    /**
     * @type {VARIANT} 
     */
    onblur {
        get => this.get_onblur()
        set => this.put_onblur(value)
    }

    /**
     * @type {VARIANT} 
     */
    onload {
        get => this.get_onload()
        set => this.put_onload(value)
    }

    /**
     * @type {VARIANT} 
     */
    onbeforeunload {
        get => this.get_onbeforeunload()
        set => this.put_onbeforeunload(value)
    }

    /**
     * @type {VARIANT} 
     */
    onunload {
        get => this.get_onunload()
        set => this.put_onunload(value)
    }

    /**
     * @type {VARIANT} 
     */
    onhelp {
        get => this.get_onhelp()
        set => this.put_onhelp(value)
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
    onresize {
        get => this.get_onresize()
        set => this.put_onresize(value)
    }

    /**
     * @type {VARIANT} 
     */
    onscroll {
        get => this.get_onscroll()
        set => this.put_onscroll(value)
    }

    /**
     * @type {IHTMLDocument2} 
     */
    document {
        get => this.get_document()
    }

    /**
     * @type {IHTMLEventObj} 
     */
    event {
        get => this.get_event()
    }

    /**
     * @type {IUnknown} 
     */
    _newEnum {
        get => this.get__newEnum()
    }

    /**
     * @type {IHTMLScreen} 
     */
    screen {
        get => this.get_screen()
    }

    /**
     * @type {IHTMLOptionElementFactory} 
     */
    Option {
        get => this.get_Option()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    closed {
        get => this.get_closed()
    }

    /**
     * @type {IOmNavigator} 
     */
    clientInformation {
        get => this.get_clientInformation()
    }

    /**
     * @type {VARIANT} 
     */
    offscreenBuffering {
        get => this.get_offscreenBuffering()
        set => this.put_offscreenBuffering(value)
    }

    /**
     * @type {IDispatch} 
     */
    external {
        get => this.get_external()
    }

    /**
     * 
     * @returns {IHTMLFramesCollection2} 
     */
    get_frames() {
        result := ComCall(9, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLFramesCollection2(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_defaultStatus(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(10, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_defaultStatus() {
        p := BSTR()
        result := ComCall(11, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_status(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(12, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_status() {
        p := BSTR()
        result := ComCall(13, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} expression 
     * @param {Integer} msec 
     * @param {Pointer<VARIANT>} language 
     * @returns {Integer} 
     */
    setTimeout(expression, msec, language) {
        if(expression is String) {
            pin := BSTR.Alloc(expression)
            expression := pin.Value
        }

        result := ComCall(14, this, "ptr", expression, "int", msec, "ptr", language, "int*", &timerID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return timerID
    }

    /**
     * 
     * @param {Integer} timerID 
     * @returns {HRESULT} 
     */
    clearTimeout(timerID) {
        result := ComCall(15, this, "int", timerID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} message 
     * @returns {HRESULT} 
     */
    alert(message) {
        if(message is String) {
            pin := BSTR.Alloc(message)
            message := pin.Value
        }

        result := ComCall(16, this, "ptr", message, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} message 
     * @returns {VARIANT_BOOL} 
     */
    confirm(message) {
        if(message is String) {
            pin := BSTR.Alloc(message)
            message := pin.Value
        }

        result := ComCall(17, this, "ptr", message, "short*", &confirmed := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return confirmed
    }

    /**
     * 
     * @param {BSTR} message 
     * @param {BSTR} defstr 
     * @returns {VARIANT} 
     */
    prompt(message, defstr) {
        if(message is String) {
            pin := BSTR.Alloc(message)
            message := pin.Value
        }
        if(defstr is String) {
            pin := BSTR.Alloc(defstr)
            defstr := pin.Value
        }

        textdata := VARIANT()
        result := ComCall(18, this, "ptr", message, "ptr", defstr, "ptr", textdata, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return textdata
    }

    /**
     * 
     * @returns {IHTMLImageElementFactory} 
     */
    get_Image() {
        result := ComCall(19, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLImageElementFactory(p)
    }

    /**
     * 
     * @returns {IHTMLLocation} 
     */
    get_location() {
        result := ComCall(20, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLLocation(p)
    }

    /**
     * 
     * @returns {IOmHistory} 
     */
    get_history() {
        result := ComCall(21, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOmHistory(p)
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
        result := ComCall(22, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_opener(v) {
        result := ComCall(23, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_opener() {
        p := VARIANT()
        result := ComCall(24, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {IOmNavigator} 
     */
    get_navigator() {
        result := ComCall(25, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOmNavigator(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_name(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(26, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR()
        result := ComCall(27, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {IHTMLWindow2} 
     */
    get_parent() {
        result := ComCall(28, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLWindow2(p)
    }

    /**
     * The open command initializes a device. All MCI devices recognize this command.
     * @remarks
     * MCI reserves "cdaudio" for the CD audio device type, "videodisc" for the videodisc device type, "sequencer" for the MIDI sequencer device type, "AVIVideo" for the digital-video device type, and "waveaudio" for the waveform-audio device type.
     * 
     * As an alternative to the "type" flag, MCI can select the device based on the extension used by the file, as recorded in the registry or the \[mci extension\] section of the SYSTEM.INI file.
     * 
     * MCI can open AVI files by using a file-interface pointer or a stream-interface pointer. To open a file by using either type of interface pointer, specify an at sign (@) followed by the interface pointer in place of the file or device name for the *lpszDevice* parameter. For more information about the file and stream interfaces, see " [AVIFile Functions and Macros](avifile-functions-and-macros.md)."
     * 
     * The following command opens the "mysound" device.
     * 
     * ``` syntax
     * open new type waveaudio alias mysound buffer 6
     * ```
     * 
     * With device name "new", the waveform driver prepares a new waveform resource. The command assigns the device alias "mysound" and specifies a 6-second buffer.
     * 
     * You can eliminate the "type" flag if you combine the device name with the filename. MCI recognizes this combination when you use the following syntax:
     * 
     * *device\_name* ! *element\_name*
     * 
     * The exclamation point separates the device name from the filename. The exclamation point should not be delimited by white spaces.
     * 
     * The following example opens the RIGHT.WAV file using the "waveaudio" device.
     * 
     * ``` syntax
     * open waveaudio!right.wav
     * ```
     * 
     * The MCIWAVE driver requires an asynchronous waveform-audio device.
     * @param {BSTR} url 
     * @param {BSTR} name 
     * @param {BSTR} features 
     * @param {VARIANT_BOOL} replace 
     * @returns {IHTMLWindow2} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/Multimedia/open
     */
    open(url, name, features, replace) {
        if(url is String) {
            pin := BSTR.Alloc(url)
            url := pin.Value
        }
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }
        if(features is String) {
            pin := BSTR.Alloc(features)
            features := pin.Value
        }

        result := ComCall(29, this, "ptr", url, "ptr", name, "ptr", features, "short", replace, "ptr*", &pomWindowResult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLWindow2(pomWindowResult)
    }

    /**
     * 
     * @returns {IHTMLWindow2} 
     */
    get_self() {
        result := ComCall(30, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLWindow2(p)
    }

    /**
     * 
     * @returns {IHTMLWindow2} 
     */
    get_top() {
        result := ComCall(31, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLWindow2(p)
    }

    /**
     * 
     * @returns {IHTMLWindow2} 
     */
    get_window() {
        result := ComCall(32, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLWindow2(p)
    }

    /**
     * 
     * @param {BSTR} url 
     * @returns {HRESULT} 
     */
    navigate(url) {
        if(url is String) {
            pin := BSTR.Alloc(url)
            url := pin.Value
        }

        result := ComCall(33, this, "ptr", url, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onfocus(v) {
        result := ComCall(34, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onfocus() {
        p := VARIANT()
        result := ComCall(35, this, "ptr", p, "int")
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
    put_onblur(v) {
        result := ComCall(36, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onblur() {
        p := VARIANT()
        result := ComCall(37, this, "ptr", p, "int")
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
    put_onload(v) {
        result := ComCall(38, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onload() {
        p := VARIANT()
        result := ComCall(39, this, "ptr", p, "int")
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
    put_onbeforeunload(v) {
        result := ComCall(40, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onbeforeunload() {
        p := VARIANT()
        result := ComCall(41, this, "ptr", p, "int")
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
    put_onunload(v) {
        result := ComCall(42, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onunload() {
        p := VARIANT()
        result := ComCall(43, this, "ptr", p, "int")
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
    put_onhelp(v) {
        result := ComCall(44, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onhelp() {
        p := VARIANT()
        result := ComCall(45, this, "ptr", p, "int")
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
        result := ComCall(46, this, "ptr", v, "int")
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
        result := ComCall(47, this, "ptr", p, "int")
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
    put_onresize(v) {
        result := ComCall(48, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onresize() {
        p := VARIANT()
        result := ComCall(49, this, "ptr", p, "int")
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
    put_onscroll(v) {
        result := ComCall(50, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onscroll() {
        p := VARIANT()
        result := ComCall(51, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {IHTMLDocument2} 
     */
    get_document() {
        result := ComCall(52, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLDocument2(p)
    }

    /**
     * 
     * @returns {IHTMLEventObj} 
     */
    get_event() {
        result := ComCall(53, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLEventObj(p)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__newEnum() {
        result := ComCall(54, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(p)
    }

    /**
     * 
     * @param {BSTR} dialog 
     * @param {Pointer<VARIANT>} varArgIn 
     * @param {Pointer<VARIANT>} varOptions 
     * @returns {VARIANT} 
     */
    showModalDialog(dialog, varArgIn, varOptions) {
        if(dialog is String) {
            pin := BSTR.Alloc(dialog)
            dialog := pin.Value
        }

        varArgOut := VARIANT()
        result := ComCall(55, this, "ptr", dialog, "ptr", varArgIn, "ptr", varOptions, "ptr", varArgOut, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return varArgOut
    }

    /**
     * 
     * @param {BSTR} helpURL 
     * @param {VARIANT} helpArg 
     * @param {BSTR} features 
     * @returns {HRESULT} 
     */
    showHelp(helpURL, helpArg, features) {
        if(helpURL is String) {
            pin := BSTR.Alloc(helpURL)
            helpURL := pin.Value
        }
        if(features is String) {
            pin := BSTR.Alloc(features)
            features := pin.Value
        }

        result := ComCall(56, this, "ptr", helpURL, "ptr", helpArg, "ptr", features, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IHTMLScreen} 
     */
    get_screen() {
        result := ComCall(57, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLScreen(p)
    }

    /**
     * 
     * @returns {IHTMLOptionElementFactory} 
     */
    get_Option() {
        result := ComCall(58, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLOptionElementFactory(p)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    focus() {
        result := ComCall(59, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_closed() {
        result := ComCall(60, this, "short*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    blur() {
        result := ComCall(61, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    scroll(x, y) {
        result := ComCall(62, this, "int", x, "int", y, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IOmNavigator} 
     */
    get_clientInformation() {
        result := ComCall(63, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOmNavigator(p)
    }

    /**
     * 
     * @param {BSTR} expression 
     * @param {Integer} msec 
     * @param {Pointer<VARIANT>} language 
     * @returns {Integer} 
     */
    setInterval(expression, msec, language) {
        if(expression is String) {
            pin := BSTR.Alloc(expression)
            expression := pin.Value
        }

        result := ComCall(64, this, "ptr", expression, "int", msec, "ptr", language, "int*", &timerID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return timerID
    }

    /**
     * 
     * @param {Integer} timerID 
     * @returns {HRESULT} 
     */
    clearInterval(timerID) {
        result := ComCall(65, this, "int", timerID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_offscreenBuffering(v) {
        result := ComCall(66, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_offscreenBuffering() {
        p := VARIANT()
        result := ComCall(67, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} code 
     * @param {BSTR} language 
     * @returns {VARIANT} 
     */
    execScript(code, language) {
        if(code is String) {
            pin := BSTR.Alloc(code)
            code := pin.Value
        }
        if(language is String) {
            pin := BSTR.Alloc(language)
            language := pin.Value
        }

        pvarRet := VARIANT()
        result := ComCall(68, this, "ptr", code, "ptr", language, "ptr", pvarRet, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarRet
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
        result := ComCall(69, this, "ptr", String_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return String_
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    scrollBy(x, y) {
        result := ComCall(70, this, "int", x, "int", y, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    scrollTo(x, y) {
        result := ComCall(71, this, "int", x, "int", y, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * moveToCurrentRow Method (SQLServerResultSet)
     * @remarks
     * This moveToCurrentRow method is specified by the moveToCurrentRow method in the java.sql.ResultSet interface.  
     *   
     *  This method has no effect if the cursor is not on the insert row.
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/movetocurrentrow-method-sqlserverresultset
     */
    moveTo(x, y) {
        result := ComCall(72, this, "int", x, "int", y, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    moveBy(x, y) {
        result := ComCall(73, this, "int", x, "int", y, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    resizeTo(x, y) {
        result := ComCall(74, this, "int", x, "int", y, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    resizeBy(x, y) {
        result := ComCall(75, this, "int", x, "int", y, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_external() {
        result := ComCall(76, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(p)
    }
}
