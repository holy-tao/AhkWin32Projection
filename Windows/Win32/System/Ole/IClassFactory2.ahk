#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IClassFactory.ahk

/**
 * Enables a class factory object, in any sort of object server, to control object creation through licensing.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-iclassfactory2
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IClassFactory2 extends IClassFactory{
    /**
     * The interface identifier for IClassFactory2
     * @type {Guid}
     */
    static IID => Guid("{b196b28f-bab4-101a-b69c-00aa00341d07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @param {Pointer<LICINFO>} pLicInfo 
     * @returns {HRESULT} 
     */
    GetLicInfo(pLicInfo) {
        result := ComCall(5, this, "ptr", pLicInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwReserved 
     * @param {Pointer<BSTR>} pBstrKey 
     * @returns {HRESULT} 
     */
    RequestLicKey(dwReserved, pBstrKey) {
        result := ComCall(6, this, "uint", dwReserved, "ptr", pBstrKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @param {Pointer<Guid>} riid 
     * @param {BSTR} bstrKey 
     * @param {Pointer<Void>} ppvObj 
     * @returns {HRESULT} 
     */
    CreateInstanceLic(pUnkOuter, riid, bstrKey, ppvObj) {
        static pUnkReserved := 0 ;Reserved parameters must always be NULL

        bstrKey := bstrKey is String ? BSTR.Alloc(bstrKey).Value : bstrKey

        result := ComCall(7, this, "ptr", pUnkOuter, "ptr", pUnkReserved, "ptr", riid, "ptr", bstrKey, "ptr", ppvObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
