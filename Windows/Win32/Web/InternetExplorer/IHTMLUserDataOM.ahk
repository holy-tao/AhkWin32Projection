#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\System\Variant\VARIANT.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IHTMLUserDataOM extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLUserDataOM
     * @type {Guid}
     */
    static IID => Guid("{3050f48f-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_XMLDocument", "save", "load", "getAttribute", "setAttribute", "removeAttribute", "put_expires", "get_expires"]

    /**
     * @type {IDispatch} 
     */
    XMLDocument {
        get => this.get_XMLDocument()
    }

    /**
     * @type {BSTR} 
     */
    expires {
        get => this.get_expires()
        set => this.put_expires(value)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_XMLDocument() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * The save command saves an MCI file. Video-overlay and waveform-audio devices recognize this command. Although digital-video devices and MIDI sequencers also recognize this command, the MCIAVI and MCISEQ drivers do not support it.
     * @remarks
     * The *filename* variable is required if the device was opened using the "new" device identifier.
     * @param {BSTR} strName 
     * @returns {HRESULT} <span id="lpszDeviceID"></span><span id="lpszdeviceid"></span><span id="LPSZDEVICEID"></span>*lpszDeviceID*
     * 
     * Identifier of an MCI device. This identifier or alias is assigned when the device is opened.
     * 
     * 
     * <span id="lpszFilename"></span><span id="lpszfilename"></span><span id="LPSZFILENAME"></span>*lpszFilename*
     * 
     * Flag specifying the name of the file being saved and, optionally, additional flags modifying the save operation. The following table lists device types that recognize the **save** command and the flags used by each type.
     * 
     * 
     * 
     * | Value        | Meaning              | Meaning               |
     * |--------------|----------------------|-----------------------|
     * | digitalvideo | abort at *rectangle* | *filename*keepreserve |
     * | overlay      | at *rectangle*       | *filename*            |
     * | sequencer    | *filename*           |                       |
     * | waveaudio    | *filename*           |                       |
     * 
     * 
     * 
     *  
     * 
     * The following table lists the flags that can be specified in the **lpszFilename** parameter and their meanings.
     * 
     * 
     * 
     * | Value          | Meaning                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
     * |----------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | abort          | Stops a **save** operation in progress. If used, this must be the only item present.                                                                                                                                                                                                                                                                                                                                                                                                                 |
     * | at *rectangle* | Specifies a rectangle relative to the frame buffer origin. The *rectangle* is specified as *X1 Y1 X2 Y2*. The coordinates *X1 Y1* specify the upper left corner and the coordinates *X2 Y2* specify the width and height.For digital-video devices, the [capture](capture.md) command is used to capture the contents of the frame buffer.<br/>                                                                                                                                               |
     * | *filename*     | Specifies the filename to assign to the data file. If a path is not specified, the file will be placed on the disk and in the directory previously specified on the explicit or implicit [reserve](reserve.md) command. If **reserve** has not been issued, the default drive and directory are those associated with the application's task. If a path is specified, the device might require it to be on the disk drive specified by the explicit or implicit **reserve**. This flag is required. |
     * | keepreserve    | Specifies that unused disk space left over from the original **reserve** command is not deallocated.                                                                                                                                                                                                                                                                                                                                                                                                 |
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
     * @see https://learn.microsoft.com/windows/win32/Multimedia/save
     */
    save(strName) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(8, this, "ptr", strName, "HRESULT")
        return result
    }

    /**
     * The load command loads a file in a device-specific format. Digital-video and video-overlay devices recognize this command.
     * @remarks
     * The "vidboard" device sends a notification message when the loading is completed.
     * @param {BSTR} strName 
     * @returns {HRESULT} <span id="lpszDeviceID"></span><span id="lpszdeviceid"></span><span id="LPSZDEVICEID"></span>*lpszDeviceID*
     * 
     * Identifier of an MCI device. This identifier or alias is assigned when the device is opened.
     * 
     * 
     * <span id="lpszFilePos"></span><span id="lpszfilepos"></span><span id="LPSZFILEPOS"></span>*lpszFilePos*
     * 
     * Path and filename to load. For video-overlay devices, this can also include a target rectangle for the data. To specify a target rectangle, specify "at" followed by **X1 Y1 X2 Y2**, where **X1 Y1** specify the upper left corner of the rectangle, and **X2 Y2** specify the width and height. The rectangle is relative to the video buffer origin.
     * 
     * 
     * <span id="lpszFlags"></span><span id="lpszflags"></span><span id="LPSZFLAGS"></span>*lpszFlags*
     * 
     * Can be "wait", "notify", or both. For digital-video devices, "test" can also be specified. For more information about these flags, see [The Wait, Notify, and Test Flags](the-wait-notify-and-test-flags.md).
     * 
     * 
     * 
     * Returns zero if successful or an error otherwise.
     * @see https://learn.microsoft.com/windows/win32/Multimedia/load
     */
    load(strName) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(9, this, "ptr", strName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {VARIANT} 
     */
    getAttribute(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        pValue := VARIANT()
        result := ComCall(10, this, "ptr", name, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {VARIANT} value 
     * @returns {HRESULT} 
     */
    setAttribute(name, value) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(11, this, "ptr", name, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     */
    removeAttribute(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(12, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _bstr 
     * @returns {HRESULT} 
     */
    put_expires(_bstr) {
        _bstr := _bstr is String ? BSTR.Alloc(_bstr).Value : _bstr

        result := ComCall(13, this, "ptr", _bstr, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_expires() {
        pbstr := BSTR()
        result := ComCall(14, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }
}
