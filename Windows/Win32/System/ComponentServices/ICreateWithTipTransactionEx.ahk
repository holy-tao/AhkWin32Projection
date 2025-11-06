#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Creates an object that is enlisted within a manual transaction using the Transaction Internet Protocol (TIP).
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icreatewithtiptransactionex
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ICreateWithTipTransactionEx extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICreateWithTipTransactionEx
     * @type {Guid}
     */
    static IID => Guid("{455acf59-5345-11d2-99cf-00c04f797bc9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance"]

    /**
     * 
     * @param {BSTR} bstrTipUrl 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icreatewithtiptransactionex-createinstance
     */
    CreateInstance(bstrTipUrl, rclsid, riid) {
        bstrTipUrl := bstrTipUrl is String ? BSTR.Alloc(bstrTipUrl).Value : bstrTipUrl

        result := ComCall(3, this, "ptr", bstrTipUrl, "ptr", rclsid, "ptr", riid, "ptr*", &pObject := 0, "HRESULT")
        return pObject
    }
}
