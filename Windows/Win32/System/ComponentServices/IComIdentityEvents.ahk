#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber about an activity that is part of an Internet Information Services (IIS) Active Server Pages (ASP) page. For example, if a COM+ object is invoked in an ASP page, the user would be notified of this activity.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icomidentityevents
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComIdentityEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComIdentityEvents
     * @type {Guid}
     */
    static IID => Guid("{683130b1-2e50-11d2-98a5-00c04f8ee1c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnIISRequestInfo"]

    /**
     * Generated when an activity is part of an ASP page.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} ObjId The unique identifier for this object.
     * @param {PWSTR} pszClientIP The Internet Protocol (IP) address of the IIS client.
     * @param {PWSTR} pszServerIP The IP address of the IIS server.
     * @param {PWSTR} pszURL The URL on IIS server generating object reference.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomidentityevents-oniisrequestinfo
     */
    OnIISRequestInfo(pInfo, ObjId, pszClientIP, pszServerIP, pszURL) {
        pszClientIP := pszClientIP is String ? StrPtr(pszClientIP) : pszClientIP
        pszServerIP := pszServerIP is String ? StrPtr(pszServerIP) : pszServerIP
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(3, this, "ptr", pInfo, "uint", ObjId, "ptr", pszClientIP, "ptr", pszServerIP, "ptr", pszURL, "HRESULT")
        return result
    }
}
