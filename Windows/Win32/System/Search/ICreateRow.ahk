#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ICreateRow extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICreateRow
     * @type {Guid}
     */
    static IID => Guid("{0c733ab2-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateRow"]

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {PWSTR} pwszURL 
     * @param {Integer} dwBindURLFlags 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<Guid>} riid 
     * @param {IAuthenticate} pAuthenticate 
     * @param {Pointer<DBIMPLICITSESSION>} pImplSession 
     * @param {Pointer<Integer>} pdwBindStatus 
     * @param {Pointer<PWSTR>} ppwszNewURL 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    CreateRow(pUnkOuter, pwszURL, dwBindURLFlags, rguid, riid, pAuthenticate, pImplSession, pdwBindStatus, ppwszNewURL, ppUnk) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        pdwBindStatusMarshal := pdwBindStatus is VarRef ? "uint*" : "ptr"
        ppwszNewURLMarshal := ppwszNewURL is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pUnkOuter, "ptr", pwszURL, "uint", dwBindURLFlags, "ptr", rguid, "ptr", riid, "ptr", pAuthenticate, "ptr", pImplSession, pdwBindStatusMarshal, pdwBindStatus, ppwszNewURLMarshal, ppwszNewURL, "ptr*", ppUnk, "HRESULT")
        return result
    }
}
