#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequestevents-interface
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class IWinHttpRequestEvents extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnResponseStart", "OnResponseDataAvailable", "OnResponseFinished", "OnError"]

    /**
     * 
     * @param {Integer} Status 
     * @param {BSTR} ContentType 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequestevents-onresponsestart
     */
    OnResponseStart(Status, ContentType) {
        ContentType := ContentType is String ? BSTR.Alloc(ContentType).Value : ContentType

        ComCall(3, this, "int", Status, "ptr", ContentType)
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} Data 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequestevents-onresponsedataavailable
     */
    OnResponseDataAvailable(Data) {
        ComCall(4, this, "ptr*", Data)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequestevents-onresponsefinished
     */
    OnResponseFinished() {
        ComCall(5, this)
    }

    /**
     * 
     * @param {Integer} ErrorNumber 
     * @param {BSTR} ErrorDescription 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequestevents-onerror
     */
    OnError(ErrorNumber, ErrorDescription) {
        ErrorDescription := ErrorDescription is String ? BSTR.Alloc(ErrorDescription).Value : ErrorDescription

        ComCall(6, this, "int", ErrorNumber, "ptr", ErrorDescription)
    }
}
