#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber when an unhandled exception occurs in the user's code.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icomexceptionevents
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComExceptionEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComExceptionEvents
     * @type {Guid}
     */
    static IID => Guid("{683130b3-2e50-11d2-98a5-00c04f8ee1c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnExceptionUser"]

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} code 
     * @param {Integer} address 
     * @param {PWSTR} pszStackTrace 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomexceptionevents-onexceptionuser
     */
    OnExceptionUser(pInfo, code, address, pszStackTrace) {
        pszStackTrace := pszStackTrace is String ? StrPtr(pszStackTrace) : pszStackTrace

        result := ComCall(3, this, "ptr", pInfo, "uint", code, "uint", address, "ptr", pszStackTrace, "HRESULT")
        return result
    }
}
