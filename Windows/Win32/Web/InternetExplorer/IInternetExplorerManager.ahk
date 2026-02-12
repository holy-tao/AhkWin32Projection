#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IInternetExplorerManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInternetExplorerManager
     * @type {Guid}
     */
    static IID => Guid("{acc84351-04ff-44f9-b23f-655ed168c6d5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateObject"]

    /**
     * CreateObject Method (RDS)
     * @remarks
     * The *HTTP protocol* is the standard Web protocol; *HTTPS* is a secure Web protocol. Use the *DCOM protocol* when running a local-area network without HTTP. The *in-process* protocol is a local dynamic-link library (DLL); it does not use a network.
     * @param {Integer} dwConfig 
     * @param {PWSTR} pszURL 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Pointer<Void>>} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/rds-api/createobject-method-rds
     */
    CreateObject(dwConfig, pszURL, riid) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(3, this, "uint", dwConfig, "ptr", pszURL, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }
}
