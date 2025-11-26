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
     * Retrieves the type of a tracking information collection.
     * @returns {Integer} The type of tracking information. For a list of values, see the <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ne-comsvcs-tracking_coll_type">TRACKING_COLL_TYPE</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomtrackinginfocollection-type
     */
    Type() {
        result := ComCall(3, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * Retrieves the number of objects in a tracking information collection.
     * @returns {Integer} The number of objects in the tracking information collection.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomtrackinginfocollection-count
     */
    Count() {
        result := ComCall(4, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Retrieves the specified interface from a specified member of a tracking information collection.
     * @param {Integer} ulIndex The index of the object in the collection.
     * @param {Pointer<Guid>} riid The identifier of the interface to be requested.
     * @returns {Pointer<Void>} A pointer to the requested interface.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomtrackinginfocollection-item
     */
    Item(ulIndex, riid) {
        result := ComCall(5, this, "uint", ulIndex, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
