#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A collection of IXpsOMSignatureBlockResource interface pointers.
 * @remarks
 * 
  * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomsignatureblockresourcecollection
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMSignatureBlockResourceCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMSignatureBlockResourceCollection
     * @type {Guid}
     */
    static IID => Guid("{ab8f5d8e-351b-4d33-aaed-fa56f0022931}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAt", "InsertAt", "RemoveAt", "SetAt", "Append", "GetByPartName"]

    /**
     * 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomsignatureblockresourcecollection-getcount
     */
    GetCount(count) {
        result := ComCall(3, this, "uint*", count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IXpsOMSignatureBlockResource>} signatureBlockResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomsignatureblockresourcecollection-getat
     */
    GetAt(index, signatureBlockResource) {
        result := ComCall(4, this, "uint", index, "ptr*", signatureBlockResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {IXpsOMSignatureBlockResource} signatureBlockResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomsignatureblockresourcecollection-insertat
     */
    InsertAt(index, signatureBlockResource) {
        result := ComCall(5, this, "uint", index, "ptr", signatureBlockResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomsignatureblockresourcecollection-removeat
     */
    RemoveAt(index) {
        result := ComCall(6, this, "uint", index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {IXpsOMSignatureBlockResource} signatureBlockResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomsignatureblockresourcecollection-setat
     */
    SetAt(index, signatureBlockResource) {
        result := ComCall(7, this, "uint", index, "ptr", signatureBlockResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMSignatureBlockResource} signatureBlockResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomsignatureblockresourcecollection-append
     */
    Append(signatureBlockResource) {
        result := ComCall(8, this, "ptr", signatureBlockResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOpcPartUri} partName 
     * @param {Pointer<IXpsOMSignatureBlockResource>} signatureBlockResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomsignatureblockresourcecollection-getbypartname
     */
    GetByPartName(partName, signatureBlockResource) {
        result := ComCall(9, this, "ptr", partName, "ptr*", signatureBlockResource, "HRESULT")
        return result
    }
}
