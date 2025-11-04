#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Retrieves information about a tracking information collection.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icomtrackinginfocollection
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComTrackingInfoCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComTrackingInfoCollection
     * @type {Guid}
     */
    static IID => Guid("{c266c677-c9ad-49ab-9fd9-d9661078588a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Type", "Count", "Item"]

    /**
     * 
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtrackinginfocollection-type
     */
    Type(pType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pTypeMarshal, pType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtrackinginfocollection-count
     */
    Count(pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulIndex 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtrackinginfocollection-item
     */
    Item(ulIndex, riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "uint", ulIndex, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }
}
