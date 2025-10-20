#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IBindHost extends IUnknown{
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
     * 
     * @param {PWSTR} szName 
     * @param {Pointer<IBindCtx>} pBC 
     * @param {Pointer<IMoniker>} ppmk 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    CreateMoniker(szName, pBC, ppmk, dwReserved) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(3, this, "ptr", szName, "ptr", pBC, "ptr", ppmk, "uint", dwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMoniker>} pMk 
     * @param {Pointer<IBindCtx>} pBC 
     * @param {Pointer<IBindStatusCallback>} pBSC 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvObj 
     * @returns {HRESULT} 
     */
    MonikerBindToStorage(pMk, pBC, pBSC, riid, ppvObj) {
        result := ComCall(4, this, "ptr", pMk, "ptr", pBC, "ptr", pBSC, "ptr", riid, "ptr", ppvObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMoniker>} pMk 
     * @param {Pointer<IBindCtx>} pBC 
     * @param {Pointer<IBindStatusCallback>} pBSC 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvObj 
     * @returns {HRESULT} 
     */
    MonikerBindToObject(pMk, pBC, pBSC, riid, ppvObj) {
        result := ComCall(5, this, "ptr", pMk, "ptr", pBC, "ptr", pBSC, "ptr", riid, "ptr", ppvObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
