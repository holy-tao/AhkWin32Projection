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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLicInfo", "RequestLicKey", "CreateInstanceLic"]

    /**
     * 
     * @param {Pointer<LICINFO>} pLicInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iclassfactory2-getlicinfo
     */
    GetLicInfo(pLicInfo) {
        result := ComCall(5, this, "ptr", pLicInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwReserved 
     * @param {Pointer<BSTR>} pBstrKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iclassfactory2-requestlickey
     */
    RequestLicKey(dwReserved, pBstrKey) {
        result := ComCall(6, this, "uint", dwReserved, "ptr", pBstrKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<Guid>} riid 
     * @param {BSTR} bstrKey 
     * @param {Pointer<Pointer<Void>>} ppvObj 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iclassfactory2-createinstancelic
     */
    CreateInstanceLic(pUnkOuter, riid, bstrKey, ppvObj) {
        static pUnkReserved := 0 ;Reserved parameters must always be NULL

        bstrKey := bstrKey is String ? BSTR.Alloc(bstrKey).Value : bstrKey

        result := ComCall(7, this, "ptr", pUnkOuter, "ptr", pUnkReserved, "ptr", riid, "ptr", bstrKey, "ptr*", ppvObj, "HRESULT")
        return result
    }
}
