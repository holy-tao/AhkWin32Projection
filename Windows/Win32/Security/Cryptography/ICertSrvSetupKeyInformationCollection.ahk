#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Defines functionality to populate and enumerate a collection of ICertSrvSetupKeyInformation objects.
 * @see https://docs.microsoft.com/windows/win32/api//casetup/nn-casetup-icertsrvsetupkeyinformationcollection
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class ICertSrvSetupKeyInformationCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertSrvSetupKeyInformationCollection
     * @type {Guid}
     */
    static IID => Guid("{e65c8b00-e58f-41f9-a9ec-a28d7427c844}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_Count", "Add"]

    /**
     * 
     * @param {Pointer<IUnknown>} ppVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetupkeyinformationcollection-get__newenum
     */
    get__NewEnum(ppVal) {
        result := ComCall(7, this, "ptr*", ppVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetupkeyinformationcollection-get_item
     */
    get_Item(Index, pVal) {
        result := ComCall(8, this, "int", Index, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetupkeyinformationcollection-get_count
     */
    get_Count(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICertSrvSetupKeyInformation} pIKeyInformation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetupkeyinformationcollection-add
     */
    Add(pIKeyInformation) {
        result := ComCall(10, this, "ptr", pIKeyInformation, "HRESULT")
        return result
    }
}
