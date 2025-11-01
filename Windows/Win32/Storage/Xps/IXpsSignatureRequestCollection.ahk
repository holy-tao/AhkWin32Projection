#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A collection of IXpsSignatureRequest interfaces.
 * @remarks
 * 
  * For more information about the collection methods, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignaturerequestcollection
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsSignatureRequestCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsSignatureRequestCollection
     * @type {Guid}
     */
    static IID => Guid("{f0253e68-9f19-412e-9b4f-54d3b0ac6cd9}")

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
     * 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturerequestcollection-getcount
     */
    GetCount(count) {
        result := ComCall(3, this, "uint*", count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IXpsSignatureRequest>} signatureRequest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturerequestcollection-getat
     */
    GetAt(index, signatureRequest) {
        result := ComCall(4, this, "uint", index, "ptr*", signatureRequest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturerequestcollection-removeat
     */
    RemoveAt(index) {
        result := ComCall(5, this, "uint", index, "HRESULT")
        return result
    }
}
