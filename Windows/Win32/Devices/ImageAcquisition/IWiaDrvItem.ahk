#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWiaDrvItem.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaDrvItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaDrvItem
     * @type {Guid}
     */
    static IID => Guid("{1f02b5c5-b00c-11d2-a094-00c04f72dc3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetItemFlags", "GetDeviceSpecContext", "GetFullItemName", "GetItemName", "AddItemToFolder", "UnlinkItemTree", "RemoveItemFromFolder", "FindItemByName", "FindChildItemByName", "GetParentItem", "GetFirstChildItem", "GetNextSiblingItem", "DumpItemData"]

    /**
     * 
     * @returns {Integer} 
     */
    GetItemFlags() {
        result := ComCall(3, this, "int*", &__MIDL__IWiaDrvItem0000 := 0, "HRESULT")
        return __MIDL__IWiaDrvItem0000
    }

    /**
     * 
     * @returns {Pointer<Integer>} 
     */
    GetDeviceSpecContext() {
        result := ComCall(4, this, "ptr*", &__MIDL__IWiaDrvItem0001 := 0, "HRESULT")
        return __MIDL__IWiaDrvItem0001
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetFullItemName() {
        __MIDL__IWiaDrvItem0002 := BSTR()
        result := ComCall(5, this, "ptr", __MIDL__IWiaDrvItem0002, "HRESULT")
        return __MIDL__IWiaDrvItem0002
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetItemName() {
        __MIDL__IWiaDrvItem0003 := BSTR()
        result := ComCall(6, this, "ptr", __MIDL__IWiaDrvItem0003, "HRESULT")
        return __MIDL__IWiaDrvItem0003
    }

    /**
     * 
     * @param {IWiaDrvItem} __MIDL__IWiaDrvItem0004 
     * @returns {HRESULT} 
     */
    AddItemToFolder(__MIDL__IWiaDrvItem0004) {
        result := ComCall(7, this, "ptr", __MIDL__IWiaDrvItem0004, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} __MIDL__IWiaDrvItem0005 
     * @returns {HRESULT} 
     */
    UnlinkItemTree(__MIDL__IWiaDrvItem0005) {
        result := ComCall(8, this, "int", __MIDL__IWiaDrvItem0005, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} __MIDL__IWiaDrvItem0006 
     * @returns {HRESULT} 
     */
    RemoveItemFromFolder(__MIDL__IWiaDrvItem0006) {
        result := ComCall(9, this, "int", __MIDL__IWiaDrvItem0006, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} __MIDL__IWiaDrvItem0007 
     * @param {BSTR} __MIDL__IWiaDrvItem0008 
     * @returns {IWiaDrvItem} 
     */
    FindItemByName(__MIDL__IWiaDrvItem0007, __MIDL__IWiaDrvItem0008) {
        __MIDL__IWiaDrvItem0008 := __MIDL__IWiaDrvItem0008 is String ? BSTR.Alloc(__MIDL__IWiaDrvItem0008).Value : __MIDL__IWiaDrvItem0008

        result := ComCall(10, this, "int", __MIDL__IWiaDrvItem0007, "ptr", __MIDL__IWiaDrvItem0008, "ptr*", &__MIDL__IWiaDrvItem0009 := 0, "HRESULT")
        return IWiaDrvItem(__MIDL__IWiaDrvItem0009)
    }

    /**
     * 
     * @param {BSTR} __MIDL__IWiaDrvItem0010 
     * @returns {IWiaDrvItem} 
     */
    FindChildItemByName(__MIDL__IWiaDrvItem0010) {
        __MIDL__IWiaDrvItem0010 := __MIDL__IWiaDrvItem0010 is String ? BSTR.Alloc(__MIDL__IWiaDrvItem0010).Value : __MIDL__IWiaDrvItem0010

        result := ComCall(11, this, "ptr", __MIDL__IWiaDrvItem0010, "ptr*", &__MIDL__IWiaDrvItem0011 := 0, "HRESULT")
        return IWiaDrvItem(__MIDL__IWiaDrvItem0011)
    }

    /**
     * 
     * @returns {IWiaDrvItem} 
     */
    GetParentItem() {
        result := ComCall(12, this, "ptr*", &__MIDL__IWiaDrvItem0012 := 0, "HRESULT")
        return IWiaDrvItem(__MIDL__IWiaDrvItem0012)
    }

    /**
     * 
     * @returns {IWiaDrvItem} 
     */
    GetFirstChildItem() {
        result := ComCall(13, this, "ptr*", &__MIDL__IWiaDrvItem0013 := 0, "HRESULT")
        return IWiaDrvItem(__MIDL__IWiaDrvItem0013)
    }

    /**
     * 
     * @returns {IWiaDrvItem} 
     */
    GetNextSiblingItem() {
        result := ComCall(14, this, "ptr*", &__MIDL__IWiaDrvItem0014 := 0, "HRESULT")
        return IWiaDrvItem(__MIDL__IWiaDrvItem0014)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    DumpItemData() {
        __MIDL__IWiaDrvItem0015 := BSTR()
        result := ComCall(15, this, "ptr", __MIDL__IWiaDrvItem0015, "HRESULT")
        return __MIDL__IWiaDrvItem0015
    }
}
