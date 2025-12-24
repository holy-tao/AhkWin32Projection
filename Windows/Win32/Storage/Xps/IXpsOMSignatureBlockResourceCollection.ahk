#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMSignatureBlockResource.ahk
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
     * Gets the number of IXpsOMSignatureBlockResource interface pointers in the collection.
     * @returns {Integer} The number of <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomsignatureblockresource">IXpsOMSignatureBlockResource</a> interface pointers in the collection.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomsignatureblockresourcecollection-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &count := 0, "HRESULT")
        return count
    }

    /**
     * Gets an IXpsOMSignatureBlockResource interface pointer from a specified location in the collection.
     * @param {Integer} index The zero-based index of the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomsignatureblockresource">IXpsOMSignatureBlockResource</a> interface pointer to be obtained.
     * @returns {IXpsOMSignatureBlockResource} The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomsignatureblockresource">IXpsOMSignatureBlockResource</a> interface pointer at the location specified by <i>index</i>.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomsignatureblockresourcecollection-getat
     */
    GetAt(index) {
        result := ComCall(4, this, "uint", index, "ptr*", &signatureBlockResource := 0, "HRESULT")
        return IXpsOMSignatureBlockResource(signatureBlockResource)
    }

    /**
     * Inserts an IXpsOMSignatureBlockResource interface pointer at a specified location in the collection.
     * @param {Integer} index The zero-based index in the collection where the interface pointer that is passed in <i>signatureBlockResource</i>  is to be inserted.
     * @param {IXpsOMSignatureBlockResource} signatureBlockResource The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomsignatureblockresource">IXpsOMSignatureBlockResource</a> interface pointer that is to be inserted at the location specified by <i>index</i>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomsignatureblockresourcecollection-insertat
     */
    InsertAt(index, signatureBlockResource) {
        result := ComCall(5, this, "uint", index, "ptr", signatureBlockResource, "HRESULT")
        return result
    }

    /**
     * Removes and releases an IXpsOMSignatureBlockResource interface pointer from a specified location in the collection.
     * @param {Integer} index The zero-based index in the collection from which  an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomsignatureblockresource">IXpsOMSignatureBlockResource</a> interface pointer is to be removed and released.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomsignatureblockresourcecollection-removeat
     */
    RemoveAt(index) {
        result := ComCall(6, this, "uint", index, "HRESULT")
        return result
    }

    /**
     * Replaces an IXpsOMSignatureBlockResource interface pointer at a specified location in the collection.
     * @param {Integer} index The zero-based index in the collection where an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomsignatureblockresource">IXpsOMSignatureBlockResource</a> interface pointer is to be replaced.
     * @param {IXpsOMSignatureBlockResource} signatureBlockResource The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomsignatureblockresource">IXpsOMSignatureBlockResource</a> interface pointer that will replace current contents at the location specified by <i>index</i>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomsignatureblockresourcecollection-setat
     */
    SetAt(index, signatureBlockResource) {
        result := ComCall(7, this, "uint", index, "ptr", signatureBlockResource, "HRESULT")
        return result
    }

    /**
     * Appends an IXpsOMSignatureBlockResource interface to the end of the collection.
     * @param {IXpsOMSignatureBlockResource} signatureBlockResource A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomsignatureblockresource">IXpsOMSignatureBlockResource</a> interface that is to be appended to the collection.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomsignatureblockresourcecollection-append
     */
    Append(signatureBlockResource) {
        result := ComCall(8, this, "ptr", signatureBlockResource, "HRESULT")
        return result
    }

    /**
     * Gets an IXpsOMSignatureBlockResource interface pointer from the collection by matching the interface's part name.
     * @param {IOpcPartUri} partName The part name of the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomsignatureblockresource">IXpsOMSignatureBlockResource</a> interface to be found in the collection.
     * @returns {IXpsOMSignatureBlockResource} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomsignatureblockresource">IXpsOMSignatureBlockResource</a> interface whose part name matches <i>partName</i>. If a matching interface is not found in the collection, a <b>NULL</b> pointer is returned.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomsignatureblockresourcecollection-getbypartname
     */
    GetByPartName(partName) {
        result := ComCall(9, this, "ptr", partName, "ptr*", &signatureBlockResource := 0, "HRESULT")
        return IXpsOMSignatureBlockResource(signatureBlockResource)
    }
}
