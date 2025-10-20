#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IMFMediaKeySessionNotify.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaKeySessionNotify2 extends IMFMediaKeySessionNotify{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaKeySessionNotify2
     * @type {Guid}
     */
    static IID => Guid("{c3a9e92a-da88-46b0-a110-6cf953026cb9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["KeyMessage2", "KeyStatusChange"]

    /**
     * 
     * @param {Integer} eMessageType 
     * @param {BSTR} destinationURL 
     * @param {Pointer} pbMessage 
     * @param {Integer} cbMessage 
     * @returns {String} Nothing - always returns an empty string
     */
    KeyMessage2(eMessageType, destinationURL, pbMessage, cbMessage) {
        destinationURL := destinationURL is String ? BSTR.Alloc(destinationURL).Value : destinationURL

        ComCall(6, this, "int", eMessageType, "ptr", destinationURL, "ptr", pbMessage, "uint", cbMessage)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    KeyStatusChange() {
        ComCall(7, this)
    }
}
