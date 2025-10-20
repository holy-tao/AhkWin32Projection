#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A collection of IXpsSignatureBlock interfaces.
 * @remarks
 * 
  * This interface cannot exist independently from the signature manager from which it was instantiated.
  * 
  * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignatureblockcollection
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsSignatureBlockCollection extends IUnknown{
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
     * @param {Pointer<IXpsSignatureBlock>} signatureBlock 
     * @returns {HRESULT} 
     */
    GetAt(index, signatureBlock) {
        result := ComCall(4, this, "uint", index, "ptr", signatureBlock, "int")
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
        result := ComCall(5, this, "uint", index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
