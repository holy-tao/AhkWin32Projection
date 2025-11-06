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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtrackinginfocollection-type
     */
    Type() {
        result := ComCall(3, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtrackinginfocollection-count
     */
    Count() {
        result := ComCall(4, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} ulIndex 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtrackinginfocollection-item
     */
    Item(ulIndex, riid) {
        result := ComCall(5, this, "uint", ulIndex, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
