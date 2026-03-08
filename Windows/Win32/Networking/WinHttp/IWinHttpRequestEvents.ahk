#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides events for Microsoft Windows HTTP Services (WinHTTP).
 * @remarks
 * The **IWinHttpRequestEvents** interface inherits from the [**IUnknown**](/windows/desktop/api/unknwn/nn-unknwn-iunknown) interface. **IWinHttpRequestEvents** also has these types of members:
 * 
 * -   [Methods](#methods)
 * 
 * 
 * The following procedure describes how to register for notifications.
 * 
 * 1.  Get an [IConnectionPointContainer](/windows/win32/api/ocidl/nn-ocidl-iconnectionpointcontainer) interface by calling **QueryInterface** on an [**IWinHttpRequest**](iwinhttprequest-interface.md) object.
 * 2.  Call [FindConnectionPoint](/windows/win32/api/ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint) on the returned interface and pass **IID\_IWinHttpRequestEvents** to *riid*.
 * 3.  Call [Advise](/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-advise) on the returned connection point and pass a pointer to an **IUnknown** interface on an object that implements **IWinHttpRequestEvents** to *pUnk*.
 * 
 * Notifications can be terminated by calling [Unadvise](/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-unadvise) on the connection point returned in step 2.
 * 
 * To view some code that registers for COM notifications, see the Client section of the [COM Connection Points](/archive/msdn-magazine/2007/september/clr-inside-out-com-connection-points) article.
 * 
 * > [!Note]  
 * > For Windows XP and Windows 2000, see the [Run-Time Requirements](winhttp-start-page.md) section of the WinHTTP Start Page.
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
     * Occurs when the response data starts to be received.
     * @remarks
     * For this event to occur, use [**Open**](iwinhttprequest-open.md) to send an HTTP connection in asynchronous mode and use [**Send**](iwinhttprequest-send.md) to send a data request to an Internet server.
     * 
     * This is the first WinHTTP event to occur after the [**Send**](iwinhttprequest-send.md).
     * 
     * > [!Note]  
     * > For Windows XP and Windows 2000, see the [Run-Time Requirements](winhttp-start-page.md) section of the WinHTTP Start Page.
     * @param {Integer} Status Receives the standard status code returned with the response data. Status codes are defined in [RFC 2616](https://www.ietf.org/rfc/rfc2616.txt).
     * @param {BSTR} ContentType Specifies the type of content received, such as "text/html" or "image/gif".
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequestevents-onresponsestart
     */
    OnResponseStart(Status, ContentType) {
        ContentType := ContentType is String ? BSTR.Alloc(ContentType).Value : ContentType

        ComCall(3, this, "int", Status, "ptr", ContentType)
    }

    /**
     * Occurs when data is available from the response.
     * @remarks
     * Because data is in bytes, it must be converted to wide characters when placed in a wide character (Unicode) string.
     * 
     * > [!Note]  
     * > For Windows XP and Windows 2000, see the [Run-Time Requirements](winhttp-start-page.md) section of the WinHTTP Start Page.
     * @param {Pointer<Pointer<SAFEARRAY>>} Data A zero-based array of bytes that receives the response data received by Microsoft Windows HTTP Services (WinHTTP) up to the point that this event occurs. This is a **VARIANT** of type VT\_ARRAY \| VT\_UI1.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequestevents-onresponsedataavailable
     */
    OnResponseDataAvailable(Data) {
        DataMarshal := Data is VarRef ? "ptr*" : "ptr"

        ComCall(4, this, DataMarshal, Data)
    }

    /**
     * Occurs when the response data is complete.
     * @remarks
     * This event signals that all of the response data that pertains to the most recent request has been received. [**OnResponseDataAvailable**](iwinhttprequestevents-onresponsedataavailable.md) does not occur again until the next request.
     * 
     * > [!Note]  
     * > For Windows XP and Windows 2000, see the [Run-Time Requirements](winhttp-start-page.md) section of the WinHTTP Start Page.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequestevents-onresponsefinished
     */
    OnResponseFinished() {
        ComCall(5, this)
    }

    /**
     * Occurs when there is a run-time error in the application.
     * @remarks
     * > [!Note]  
     * > For Windows XP and Windows 2000, see the [Run-Time Requirements](winhttp-start-page.md) section of the WinHTTP Start Page.
     * @param {Integer} ErrorNumber Receives the numerical value of the error. The lower 16 bits of this error number corresponds to one of the errors listed in [**Error Messages**](error-messages.md).
     * @param {BSTR} ErrorDescription Specifies a short description of the error which occurred.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequestevents-onerror
     */
    OnError(ErrorNumber, ErrorDescription) {
        ErrorDescription := ErrorDescription is String ? BSTR.Alloc(ErrorDescription).Value : ErrorDescription

        ComCall(6, this, "int", ErrorNumber, "ptr", ErrorDescription)
    }
}
