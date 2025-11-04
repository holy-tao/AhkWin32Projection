#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IBindHost extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBindHost
     * @type {Guid}
     */
    static IID => Guid("{fc4801a1-2ba9-11cf-a229-00aa003d7352}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMoniker", "MonikerBindToStorage", "MonikerBindToObject"]

    /**
     * 
     * @param {PWSTR} szName 
     * @param {IBindCtx} pBC 
     * @param {Pointer<IMoniker>} ppmk 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    CreateMoniker(szName, pBC, ppmk, dwReserved) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(3, this, "ptr", szName, "ptr", pBC, "ptr*", ppmk, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMoniker} pMk 
     * @param {IBindCtx} pBC 
     * @param {IBindStatusCallback} pBSC 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvObj 
     * @returns {HRESULT} 
     */
    MonikerBindToStorage(pMk, pBC, pBSC, riid, ppvObj) {
        ppvObjMarshal := ppvObj is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pMk, "ptr", pBC, "ptr", pBSC, "ptr", riid, ppvObjMarshal, ppvObj, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMoniker} pMk 
     * @param {IBindCtx} pBC 
     * @param {IBindStatusCallback} pBSC 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvObj 
     * @returns {HRESULT} 
     */
    MonikerBindToObject(pMk, pBC, pBSC, riid, ppvObj) {
        ppvObjMarshal := ppvObj is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", pMk, "ptr", pBC, "ptr", pBSC, "ptr", riid, ppvObjMarshal, ppvObj, "HRESULT")
        return result
    }
}
