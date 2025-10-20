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
     * 
     * @param {Pointer<UInt32>} count 
     * @returns {HRESULT} 
     */
    GetCount(count) {
        result := ComCall(3, this, "uint*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IXpsOMSignatureBlockResource>} signatureBlockResource 
     * @returns {HRESULT} 
     */
    GetAt(index, signatureBlockResource) {
        result := ComCall(4, this, "uint", index, "ptr", signatureBlockResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IXpsOMSignatureBlockResource>} signatureBlockResource 
     * @returns {HRESULT} 
     */
    InsertAt(index, signatureBlockResource) {
        result := ComCall(5, this, "uint", index, "ptr", signatureBlockResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    RemoveAt(index) {
        result := ComCall(6, this, "uint", index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IXpsOMSignatureBlockResource>} signatureBlockResource 
     * @returns {HRESULT} 
     */
    SetAt(index, signatureBlockResource) {
        result := ComCall(7, this, "uint", index, "ptr", signatureBlockResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMSignatureBlockResource>} signatureBlockResource 
     * @returns {HRESULT} 
     */
    Append(signatureBlockResource) {
        result := ComCall(8, this, "ptr", signatureBlockResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcPartUri>} partName 
     * @param {Pointer<IXpsOMSignatureBlockResource>} signatureBlockResource 
     * @returns {HRESULT} 
     */
    GetByPartName(partName, signatureBlockResource) {
        result := ComCall(9, this, "ptr", partName, "ptr", signatureBlockResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
