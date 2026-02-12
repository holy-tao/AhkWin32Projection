#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsSignatureBlock.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A collection of IXpsSignatureBlock interfaces.
 * @remarks
 * This interface cannot exist independently from the signature manager from which it was instantiated.
 * 
 * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignatureblockcollection
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsSignatureBlockCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsSignatureBlockCollection
     * @type {Guid}
     */
    static IID => Guid("{23397050-fe99-467a-8dce-9237f074ffe4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAt", "RemoveAt"]

    /**
     * Gets the number of IXpsSignatureBlock interface pointers in the collection.
     * @remarks
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * @returns {Integer} The number of <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignatureblock">IXpsSignatureBlock</a> interface pointers in the collection.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignatureblockcollection-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return count
    }

    /**
     * Gets an IXpsSignatureBlock interface pointer from a specified location in the collection.
     * @remarks
     * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * @param {Integer} index The zero-based index of the <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignatureblock">IXpsSignatureBlock</a> interface pointer to be obtained.
     * @returns {IXpsSignatureBlock} The <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignatureblock">IXpsSignatureBlock</a> interface pointer at the location specified by <i>index</i>.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignatureblockcollection-getat
     */
    GetAt(index) {
        result := ComCall(4, this, "uint", index, "ptr*", &signatureBlock := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXpsSignatureBlock(signatureBlock)
    }

    /**
     * Removes and releases an IXpsSignatureBlock interface pointer from a specified location in the collection.
     * @remarks
     * From the location specified by <i>index</i>, this method releases the interface  referenced by an <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignatureblock">IXpsSignatureBlock</a> pointer. The method then compacts the collection by   reducing by 1 the index of each pointer subsequent to <i>index</i>.  For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
     * 
     * Removing a signature block from the collection removes from the package the    SignatureDefinitions part and relationship that correspond to that signature block. This removal breaks existing signatures. In addition, the SignatureDefinitions part name is removed from the list of required XPS parts, which prevents  new signatures from including the removed signature block.
     * 
     * An interface that has been removed from a collection is no longer valid. If an application retains a pointer to the interface and tries to call one of its methods,  the  method will return <b>XPS_E_OBJECT_DETACHED</b>.
     * @param {Integer} index The zero-based index in the collection from which  an <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignatureblock">IXpsSignatureBlock</a> interface pointer is to be removed and released.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignatureblockcollection-removeat
     */
    RemoveAt(index) {
        result := ComCall(5, this, "uint", index, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
