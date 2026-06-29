#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IOmHistory.ahk" { IOmHistory }
#Import ".\IHTMLDocument2.ahk" { IHTMLDocument2 }
#Import ".\IOmNavigator.ahk" { IOmNavigator }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLFramesCollection2.ahk" { IHTMLFramesCollection2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLLocation.ahk" { IHTMLLocation }
#Import ".\IHTMLScreen.ahk" { IHTMLScreen }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IHTMLEventObj.ahk" { IHTMLEventObj }
#Import ".\IHTMLImageElementFactory.ahk" { IHTMLImageElementFactory }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IHTMLOptionElementFactory.ahk" { IHTMLOptionElementFactory }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLWindow2 extends IHTMLFramesCollection2 {
    /**
     * The interface identifier for IHTMLWindow2
     * @type {Guid}
     */
    static IID := Guid("{332c4427-26cb-11d0-b483-00c04fd90119}")

    /**
     * The class identifier for HTMLWindow2
     * @type {Guid}
     */
    static CLSID := Guid("{d48a6ec6-6a4a-11cf-94a7-444553540000}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLWindow2 interfaces
    */
    struct Vtbl extends IHTMLFramesCollection2.Vtbl {
        get_frames             : IntPtr
        put_defaultStatus      : IntPtr
        get_defaultStatus      : IntPtr
        put_status             : IntPtr
        get_status             : IntPtr
        setTimeout             : IntPtr
        clearTimeout           : IntPtr
        alert                  : IntPtr
        confirm                : IntPtr
        prompt                 : IntPtr
        get_Image              : IntPtr
        get_location           : IntPtr
        get_history            : IntPtr
        close                  : IntPtr
        put_opener             : IntPtr
        get_opener             : IntPtr
        get_navigator          : IntPtr
        put_name               : IntPtr
        get_name               : IntPtr
        get_parent             : IntPtr
        open                   : IntPtr
        get_self               : IntPtr
        get_top                : IntPtr
        get_window             : IntPtr
        navigate               : IntPtr
        put_onfocus            : IntPtr
        get_onfocus            : IntPtr
        put_onblur             : IntPtr
        get_onblur             : IntPtr
        put_onload             : IntPtr
        get_onload             : IntPtr
        put_onbeforeunload     : IntPtr
        get_onbeforeunload     : IntPtr
        put_onunload           : IntPtr
        get_onunload           : IntPtr
        put_onhelp             : IntPtr
        get_onhelp             : IntPtr
        put_onerror            : IntPtr
        get_onerror            : IntPtr
        put_onresize           : IntPtr
        get_onresize           : IntPtr
        put_onscroll           : IntPtr
        get_onscroll           : IntPtr
        get_document           : IntPtr
        get_event              : IntPtr
        get__newEnum           : IntPtr
        showModalDialog        : IntPtr
        showHelp               : IntPtr
        get_screen             : IntPtr
        get_Option             : IntPtr
        focus                  : IntPtr
        get_closed             : IntPtr
        blur                   : IntPtr
        scroll                 : IntPtr
        get_clientInformation  : IntPtr
        setInterval            : IntPtr
        clearInterval          : IntPtr
        put_offscreenBuffering : IntPtr
        get_offscreenBuffering : IntPtr
        execScript             : IntPtr
        toString               : IntPtr
        scrollBy               : IntPtr
        scrollTo               : IntPtr
        moveTo                 : IntPtr
        moveBy                 : IntPtr
        resizeTo               : IntPtr
        resizeBy               : IntPtr
        get_external           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLWindow2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLFramesCollection2(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_defaultStatus(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(10, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_defaultStatus() {
        p := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_status(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(12, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_status() {
        p := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, p, "HRESULT")
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
        expression := expression is String ? BSTR.Alloc(expression).Value : expression

        result := ComCall(14, this, BSTR, expression, "int", msec, VARIANT.Ptr, language, "int*", &timerID := 0, "HRESULT")
        return timerID
    }

    /**
     * 
     * @param {Integer} timerID 
     * @returns {HRESULT} 
     */
    clearTimeout(timerID) {
        result := ComCall(15, this, "int", timerID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} message 
     * @returns {HRESULT} 
     */
    alert(message) {
        message := message is String ? BSTR.Alloc(message).Value : message

        result := ComCall(16, this, BSTR, message, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} message 
     * @returns {VARIANT_BOOL} 
     */
    confirm(message) {
        message := message is String ? BSTR.Alloc(message).Value : message

        result := ComCall(17, this, BSTR, message, VARIANT_BOOL.Ptr, &confirmed := 0, "HRESULT")
        return confirmed
    }

    /**
     * 
     * @param {BSTR} message 
     * @param {BSTR} defstr 
     * @returns {VARIANT} 
     */
    prompt(message, defstr) {
        message := message is String ? BSTR.Alloc(message).Value : message
        defstr := defstr is String ? BSTR.Alloc(defstr).Value : defstr

        textdata := VARIANT()
        result := ComCall(18, this, BSTR, message, BSTR, defstr, VARIANT.Ptr, textdata, "HRESULT")
        return textdata
    }

    /**
     * 
     * @returns {IHTMLImageElementFactory} 
     */
    get_Image() {
        result := ComCall(19, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLImageElementFactory(p)
    }

    /**
     * 
     * @returns {IHTMLLocation} 
     */
    get_location() {
        result := ComCall(20, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLLocation(p)
    }

    /**
     * 
     * @returns {IOmHistory} 
     */
    get_history() {
        result := ComCall(21, this, "ptr*", &p := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/Multimedia/close
     */
    close() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_opener(v) {
        result := ComCall(23, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_opener() {
        p := VARIANT()
        result := ComCall(24, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IOmNavigator} 
     */
    get_navigator() {
        result := ComCall(25, this, "ptr*", &p := 0, "HRESULT")
        return IOmNavigator(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_name(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(26, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR.Owned()
        result := ComCall(27, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLWindow2} 
     */
    get_parent() {
        result := ComCall(28, this, "ptr*", &p := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/Multimedia/open
     */
    open(url, name, features, replace) {
        url := url is String ? BSTR.Alloc(url).Value : url
        name := name is String ? BSTR.Alloc(name).Value : name
        features := features is String ? BSTR.Alloc(features).Value : features

        result := ComCall(29, this, BSTR, url, BSTR, name, BSTR, features, VARIANT_BOOL, replace, "ptr*", &pomWindowResult := 0, "HRESULT")
        return IHTMLWindow2(pomWindowResult)
    }

    /**
     * 
     * @returns {IHTMLWindow2} 
     */
    get_self() {
        result := ComCall(30, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLWindow2(p)
    }

    /**
     * 
     * @returns {IHTMLWindow2} 
     */
    get_top() {
        result := ComCall(31, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLWindow2(p)
    }

    /**
     * 
     * @returns {IHTMLWindow2} 
     */
    get_window() {
        result := ComCall(32, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLWindow2(p)
    }

    /**
     * 
     * @param {BSTR} url 
     * @returns {HRESULT} 
     */
    navigate(url) {
        url := url is String ? BSTR.Alloc(url).Value : url

        result := ComCall(33, this, BSTR, url, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onfocus(v) {
        result := ComCall(34, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onfocus() {
        p := VARIANT()
        result := ComCall(35, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onblur(v) {
        result := ComCall(36, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onblur() {
        p := VARIANT()
        result := ComCall(37, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onload(v) {
        result := ComCall(38, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onload() {
        p := VARIANT()
        result := ComCall(39, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforeunload(v) {
        result := ComCall(40, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onbeforeunload() {
        p := VARIANT()
        result := ComCall(41, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onunload(v) {
        result := ComCall(42, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onunload() {
        p := VARIANT()
        result := ComCall(43, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onhelp(v) {
        result := ComCall(44, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onhelp() {
        p := VARIANT()
        result := ComCall(45, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onerror(v) {
        result := ComCall(46, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onerror() {
        p := VARIANT()
        result := ComCall(47, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onresize(v) {
        result := ComCall(48, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onresize() {
        p := VARIANT()
        result := ComCall(49, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onscroll(v) {
        result := ComCall(50, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onscroll() {
        p := VARIANT()
        result := ComCall(51, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLDocument2} 
     */
    get_document() {
        result := ComCall(52, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDocument2(p)
    }

    /**
     * 
     * @returns {IHTMLEventObj} 
     */
    get_event() {
        result := ComCall(53, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLEventObj(p)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__newEnum() {
        result := ComCall(54, this, "ptr*", &p := 0, "HRESULT")
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
        dialog := dialog is String ? BSTR.Alloc(dialog).Value : dialog

        varArgOut := VARIANT()
        result := ComCall(55, this, BSTR, dialog, VARIANT.Ptr, varArgIn, VARIANT.Ptr, varOptions, VARIANT.Ptr, varArgOut, "HRESULT")
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
        helpURL := helpURL is String ? BSTR.Alloc(helpURL).Value : helpURL
        features := features is String ? BSTR.Alloc(features).Value : features

        result := ComCall(56, this, BSTR, helpURL, VARIANT, helpArg, BSTR, features, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLScreen} 
     */
    get_screen() {
        result := ComCall(57, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLScreen(p)
    }

    /**
     * 
     * @returns {IHTMLOptionElementFactory} 
     */
    get_Option() {
        result := ComCall(58, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLOptionElementFactory(p)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    focus() {
        result := ComCall(59, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_closed() {
        result := ComCall(60, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    blur() {
        result := ComCall(61, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    scroll(x, y) {
        result := ComCall(62, this, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IOmNavigator} 
     */
    get_clientInformation() {
        result := ComCall(63, this, "ptr*", &p := 0, "HRESULT")
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
        expression := expression is String ? BSTR.Alloc(expression).Value : expression

        result := ComCall(64, this, BSTR, expression, "int", msec, VARIANT.Ptr, language, "int*", &timerID := 0, "HRESULT")
        return timerID
    }

    /**
     * 
     * @param {Integer} timerID 
     * @returns {HRESULT} 
     */
    clearInterval(timerID) {
        result := ComCall(65, this, "int", timerID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_offscreenBuffering(v) {
        result := ComCall(66, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_offscreenBuffering() {
        p := VARIANT()
        result := ComCall(67, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} code 
     * @param {BSTR} language 
     * @returns {VARIANT} 
     */
    execScript(code, language) {
        code := code is String ? BSTR.Alloc(code).Value : code
        language := language is String ? BSTR.Alloc(language).Value : language

        pvarRet := VARIANT()
        result := ComCall(68, this, BSTR, code, BSTR, language, VARIANT.Ptr, pvarRet, "HRESULT")
        return pvarRet
    }

    /**
     * 
     * @returns {BSTR} 
     */
    toString() {
        _String := BSTR.Owned()
        result := ComCall(69, this, BSTR.Ptr, _String, "HRESULT")
        return _String
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    scrollBy(x, y) {
        result := ComCall(70, this, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    scrollTo(x, y) {
        result := ComCall(71, this, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    moveTo(x, y) {
        result := ComCall(72, this, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    moveBy(x, y) {
        result := ComCall(73, this, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    resizeTo(x, y) {
        result := ComCall(74, this, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    resizeBy(x, y) {
        result := ComCall(75, this, "int", x, "int", y, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_external() {
        result := ComCall(76, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    Query(iid) {
        if (IHTMLWindow2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_frames := CallbackCreate(GetMethod(implObj, "get_frames"), flags, 2)
        this.vtbl.put_defaultStatus := CallbackCreate(GetMethod(implObj, "put_defaultStatus"), flags, 2)
        this.vtbl.get_defaultStatus := CallbackCreate(GetMethod(implObj, "get_defaultStatus"), flags, 2)
        this.vtbl.put_status := CallbackCreate(GetMethod(implObj, "put_status"), flags, 2)
        this.vtbl.get_status := CallbackCreate(GetMethod(implObj, "get_status"), flags, 2)
        this.vtbl.setTimeout := CallbackCreate(GetMethod(implObj, "setTimeout"), flags, 5)
        this.vtbl.clearTimeout := CallbackCreate(GetMethod(implObj, "clearTimeout"), flags, 2)
        this.vtbl.alert := CallbackCreate(GetMethod(implObj, "alert"), flags, 2)
        this.vtbl.confirm := CallbackCreate(GetMethod(implObj, "confirm"), flags, 3)
        this.vtbl.prompt := CallbackCreate(GetMethod(implObj, "prompt"), flags, 4)
        this.vtbl.get_Image := CallbackCreate(GetMethod(implObj, "get_Image"), flags, 2)
        this.vtbl.get_location := CallbackCreate(GetMethod(implObj, "get_location"), flags, 2)
        this.vtbl.get_history := CallbackCreate(GetMethod(implObj, "get_history"), flags, 2)
        this.vtbl.close := CallbackCreate(GetMethod(implObj, "close"), flags, 1)
        this.vtbl.put_opener := CallbackCreate(GetMethod(implObj, "put_opener"), flags, 2)
        this.vtbl.get_opener := CallbackCreate(GetMethod(implObj, "get_opener"), flags, 2)
        this.vtbl.get_navigator := CallbackCreate(GetMethod(implObj, "get_navigator"), flags, 2)
        this.vtbl.put_name := CallbackCreate(GetMethod(implObj, "put_name"), flags, 2)
        this.vtbl.get_name := CallbackCreate(GetMethod(implObj, "get_name"), flags, 2)
        this.vtbl.get_parent := CallbackCreate(GetMethod(implObj, "get_parent"), flags, 2)
        this.vtbl.open := CallbackCreate(GetMethod(implObj, "open"), flags, 6)
        this.vtbl.get_self := CallbackCreate(GetMethod(implObj, "get_self"), flags, 2)
        this.vtbl.get_top := CallbackCreate(GetMethod(implObj, "get_top"), flags, 2)
        this.vtbl.get_window := CallbackCreate(GetMethod(implObj, "get_window"), flags, 2)
        this.vtbl.navigate := CallbackCreate(GetMethod(implObj, "navigate"), flags, 2)
        this.vtbl.put_onfocus := CallbackCreate(GetMethod(implObj, "put_onfocus"), flags, 2)
        this.vtbl.get_onfocus := CallbackCreate(GetMethod(implObj, "get_onfocus"), flags, 2)
        this.vtbl.put_onblur := CallbackCreate(GetMethod(implObj, "put_onblur"), flags, 2)
        this.vtbl.get_onblur := CallbackCreate(GetMethod(implObj, "get_onblur"), flags, 2)
        this.vtbl.put_onload := CallbackCreate(GetMethod(implObj, "put_onload"), flags, 2)
        this.vtbl.get_onload := CallbackCreate(GetMethod(implObj, "get_onload"), flags, 2)
        this.vtbl.put_onbeforeunload := CallbackCreate(GetMethod(implObj, "put_onbeforeunload"), flags, 2)
        this.vtbl.get_onbeforeunload := CallbackCreate(GetMethod(implObj, "get_onbeforeunload"), flags, 2)
        this.vtbl.put_onunload := CallbackCreate(GetMethod(implObj, "put_onunload"), flags, 2)
        this.vtbl.get_onunload := CallbackCreate(GetMethod(implObj, "get_onunload"), flags, 2)
        this.vtbl.put_onhelp := CallbackCreate(GetMethod(implObj, "put_onhelp"), flags, 2)
        this.vtbl.get_onhelp := CallbackCreate(GetMethod(implObj, "get_onhelp"), flags, 2)
        this.vtbl.put_onerror := CallbackCreate(GetMethod(implObj, "put_onerror"), flags, 2)
        this.vtbl.get_onerror := CallbackCreate(GetMethod(implObj, "get_onerror"), flags, 2)
        this.vtbl.put_onresize := CallbackCreate(GetMethod(implObj, "put_onresize"), flags, 2)
        this.vtbl.get_onresize := CallbackCreate(GetMethod(implObj, "get_onresize"), flags, 2)
        this.vtbl.put_onscroll := CallbackCreate(GetMethod(implObj, "put_onscroll"), flags, 2)
        this.vtbl.get_onscroll := CallbackCreate(GetMethod(implObj, "get_onscroll"), flags, 2)
        this.vtbl.get_document := CallbackCreate(GetMethod(implObj, "get_document"), flags, 2)
        this.vtbl.get_event := CallbackCreate(GetMethod(implObj, "get_event"), flags, 2)
        this.vtbl.get__newEnum := CallbackCreate(GetMethod(implObj, "get__newEnum"), flags, 2)
        this.vtbl.showModalDialog := CallbackCreate(GetMethod(implObj, "showModalDialog"), flags, 5)
        this.vtbl.showHelp := CallbackCreate(GetMethod(implObj, "showHelp"), flags, 4)
        this.vtbl.get_screen := CallbackCreate(GetMethod(implObj, "get_screen"), flags, 2)
        this.vtbl.get_Option := CallbackCreate(GetMethod(implObj, "get_Option"), flags, 2)
        this.vtbl.focus := CallbackCreate(GetMethod(implObj, "focus"), flags, 1)
        this.vtbl.get_closed := CallbackCreate(GetMethod(implObj, "get_closed"), flags, 2)
        this.vtbl.blur := CallbackCreate(GetMethod(implObj, "blur"), flags, 1)
        this.vtbl.scroll := CallbackCreate(GetMethod(implObj, "scroll"), flags, 3)
        this.vtbl.get_clientInformation := CallbackCreate(GetMethod(implObj, "get_clientInformation"), flags, 2)
        this.vtbl.setInterval := CallbackCreate(GetMethod(implObj, "setInterval"), flags, 5)
        this.vtbl.clearInterval := CallbackCreate(GetMethod(implObj, "clearInterval"), flags, 2)
        this.vtbl.put_offscreenBuffering := CallbackCreate(GetMethod(implObj, "put_offscreenBuffering"), flags, 2)
        this.vtbl.get_offscreenBuffering := CallbackCreate(GetMethod(implObj, "get_offscreenBuffering"), flags, 2)
        this.vtbl.execScript := CallbackCreate(GetMethod(implObj, "execScript"), flags, 4)
        this.vtbl.toString := CallbackCreate(GetMethod(implObj, "toString"), flags, 2)
        this.vtbl.scrollBy := CallbackCreate(GetMethod(implObj, "scrollBy"), flags, 3)
        this.vtbl.scrollTo := CallbackCreate(GetMethod(implObj, "scrollTo"), flags, 3)
        this.vtbl.moveTo := CallbackCreate(GetMethod(implObj, "moveTo"), flags, 3)
        this.vtbl.moveBy := CallbackCreate(GetMethod(implObj, "moveBy"), flags, 3)
        this.vtbl.resizeTo := CallbackCreate(GetMethod(implObj, "resizeTo"), flags, 3)
        this.vtbl.resizeBy := CallbackCreate(GetMethod(implObj, "resizeBy"), flags, 3)
        this.vtbl.get_external := CallbackCreate(GetMethod(implObj, "get_external"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_frames)
        CallbackFree(this.vtbl.put_defaultStatus)
        CallbackFree(this.vtbl.get_defaultStatus)
        CallbackFree(this.vtbl.put_status)
        CallbackFree(this.vtbl.get_status)
        CallbackFree(this.vtbl.setTimeout)
        CallbackFree(this.vtbl.clearTimeout)
        CallbackFree(this.vtbl.alert)
        CallbackFree(this.vtbl.confirm)
        CallbackFree(this.vtbl.prompt)
        CallbackFree(this.vtbl.get_Image)
        CallbackFree(this.vtbl.get_location)
        CallbackFree(this.vtbl.get_history)
        CallbackFree(this.vtbl.close)
        CallbackFree(this.vtbl.put_opener)
        CallbackFree(this.vtbl.get_opener)
        CallbackFree(this.vtbl.get_navigator)
        CallbackFree(this.vtbl.put_name)
        CallbackFree(this.vtbl.get_name)
        CallbackFree(this.vtbl.get_parent)
        CallbackFree(this.vtbl.open)
        CallbackFree(this.vtbl.get_self)
        CallbackFree(this.vtbl.get_top)
        CallbackFree(this.vtbl.get_window)
        CallbackFree(this.vtbl.navigate)
        CallbackFree(this.vtbl.put_onfocus)
        CallbackFree(this.vtbl.get_onfocus)
        CallbackFree(this.vtbl.put_onblur)
        CallbackFree(this.vtbl.get_onblur)
        CallbackFree(this.vtbl.put_onload)
        CallbackFree(this.vtbl.get_onload)
        CallbackFree(this.vtbl.put_onbeforeunload)
        CallbackFree(this.vtbl.get_onbeforeunload)
        CallbackFree(this.vtbl.put_onunload)
        CallbackFree(this.vtbl.get_onunload)
        CallbackFree(this.vtbl.put_onhelp)
        CallbackFree(this.vtbl.get_onhelp)
        CallbackFree(this.vtbl.put_onerror)
        CallbackFree(this.vtbl.get_onerror)
        CallbackFree(this.vtbl.put_onresize)
        CallbackFree(this.vtbl.get_onresize)
        CallbackFree(this.vtbl.put_onscroll)
        CallbackFree(this.vtbl.get_onscroll)
        CallbackFree(this.vtbl.get_document)
        CallbackFree(this.vtbl.get_event)
        CallbackFree(this.vtbl.get__newEnum)
        CallbackFree(this.vtbl.showModalDialog)
        CallbackFree(this.vtbl.showHelp)
        CallbackFree(this.vtbl.get_screen)
        CallbackFree(this.vtbl.get_Option)
        CallbackFree(this.vtbl.focus)
        CallbackFree(this.vtbl.get_closed)
        CallbackFree(this.vtbl.blur)
        CallbackFree(this.vtbl.scroll)
        CallbackFree(this.vtbl.get_clientInformation)
        CallbackFree(this.vtbl.setInterval)
        CallbackFree(this.vtbl.clearInterval)
        CallbackFree(this.vtbl.put_offscreenBuffering)
        CallbackFree(this.vtbl.get_offscreenBuffering)
        CallbackFree(this.vtbl.execScript)
        CallbackFree(this.vtbl.toString)
        CallbackFree(this.vtbl.scrollBy)
        CallbackFree(this.vtbl.scrollTo)
        CallbackFree(this.vtbl.moveTo)
        CallbackFree(this.vtbl.moveBy)
        CallbackFree(this.vtbl.resizeTo)
        CallbackFree(this.vtbl.resizeBy)
        CallbackFree(this.vtbl.get_external)
    }
}
