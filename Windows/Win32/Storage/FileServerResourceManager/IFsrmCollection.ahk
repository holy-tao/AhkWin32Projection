#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Defines a collection of FSRM objects.
 * @see https://docs.microsoft.com/windows/win32/api//fsrm/nn-fsrm-ifsrmcollection
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmCollection
     * @type {Guid}
     */
    static IID => Guid("{f76fbf3b-8ddd-4b42-b05a-cb1c3ff1fee8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_Count", "get_State", "Cancel", "WaitForCompletion", "GetById"]

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &unknown := 0, "HRESULT")
        return IUnknown(unknown)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmcollection-get_item
     */
    get_Item(index) {
        item := VARIANT()
        result := ComCall(8, this, "int", index, "ptr", item, "HRESULT")
        return item
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmcollection-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &count := 0, "HRESULT")
        return count
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmcollection-get_state
     */
    get_State() {
        result := ComCall(10, this, "int*", &state := 0, "HRESULT")
        return state
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmcollection-cancel
     */
    Cancel() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} waitSeconds 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmcollection-waitforcompletion
     */
    WaitForCompletion(waitSeconds) {
        result := ComCall(12, this, "int", waitSeconds, "short*", &completed := 0, "HRESULT")
        return completed
    }

    /**
     * 
     * @param {Guid} id 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmcollection-getbyid
     */
    GetById(id) {
        entry := VARIANT()
        result := ComCall(13, this, "ptr", id, "ptr", entry, "HRESULT")
        return entry
    }
}
