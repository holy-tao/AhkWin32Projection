#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class IWinHttpRequestEvents extends IUnknown{
    /**
     * The interface identifier for IWinHttpRequestEvents
     * @type {Guid}
     */
    static IID => Guid("{f97f4e15-b787-4212-80d1-d380cbbf982e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} Status 
     * @param {BSTR} ContentType 
     * @returns {String} Nothing - always returns an empty string
     */
    OnResponseStart(Status, ContentType) {
        ContentType := ContentType is String ? BSTR.Alloc(ContentType).Value : ContentType

        ComCall(3, this, "int", Status, "ptr", ContentType)
        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} Data 
     * @returns {String} Nothing - always returns an empty string
     */
    OnResponseDataAvailable(Data) {
        ComCall(4, this, "ptr", Data)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    OnResponseFinished() {
        ComCall(5, this)
        return result
    }

    /**
     * 
     * @param {Integer} ErrorNumber 
     * @param {BSTR} ErrorDescription 
     * @returns {String} Nothing - always returns an empty string
     */
    OnError(ErrorNumber, ErrorDescription) {
        ErrorDescription := ErrorDescription is String ? BSTR.Alloc(ErrorDescription).Value : ErrorDescription

        ComCall(6, this, "int", ErrorNumber, "ptr", ErrorDescription)
        return result
    }
}
