#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOfflineFilesPinInfo.ahk

/**
 * Defines a method to determine whether an item in the Offline Files cache is partly pinned.
 * @see https://learn.microsoft.com/windows/win32/api//content/cscobj/nn-cscobj-iofflinefilespininfo2
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesPinInfo2 extends IOfflineFilesPinInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesPinInfo2
     * @type {Guid}
     */
    static IID => Guid("{623c58a2-42ed-4ad7-b69a-0f1b30a72d0d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsPartlyPinned"]

    /**
     * Determines whether the item is partly pinned.
     * @remarks
     * Only container items, such as directories and shares, can be partly pinned. An item is partly pinned if the item itself is not pinned, but it contains pinned items. The item could contain autocached or transparently cached items in addition to the pinned items.
     * @returns {BOOL} Receives <b>TRUE</b> if the item has some child content that is pinned in the Offline Files cache, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/cscobj/nf-cscobj-iofflinefilespininfo2-ispartlypinned
     */
    IsPartlyPinned() {
        result := ComCall(8, this, "int*", &pbPartlyPinned := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbPartlyPinned
    }
}
