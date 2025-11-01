#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxLoggingOptions interface is used by a fax client application to access and configure the event logging categories and the activity logging options that the fax service is using.
 * @remarks
 * 
  * To create a <b>FaxLoggingOptions</b> object in C++, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxserver-loggingoptions">LoggingOptions</a> method.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxloggingoptions
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxLoggingOptions extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxLoggingOptions
     * @type {Guid}
     */
    static IID => Guid("{34e64fb9-6b31-4d32-8b27-d286c0c33606}")

    /**
     * The class identifier for FaxLoggingOptions
     * @type {Guid}
     */
    static CLSID => Guid("{1bf9eea6-ece0-4785-a18b-de56e9eef96a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EventLogging", "get_ActivityLogging"]

    /**
     * 
     * @param {Pointer<IFaxEventLogging>} pFaxEventLogging 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxloggingoptions-get_eventlogging
     */
    get_EventLogging(pFaxEventLogging) {
        result := ComCall(7, this, "ptr*", pFaxEventLogging, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFaxActivityLogging>} pFaxActivityLogging 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxloggingoptions-get_activitylogging
     */
    get_ActivityLogging(pFaxActivityLogging) {
        result := ComCall(8, this, "ptr*", pFaxActivityLogging, "HRESULT")
        return result
    }
}
