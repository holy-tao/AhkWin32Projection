#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsMembers interface is a dual interface.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsmembers
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsMembers extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsMembers
     * @type {Guid}
     */
    static IID => Guid("{451a0030-72ec-11cf-b03b-00aa006e0975}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "get_Filter", "put_Filter"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {VARIANT} 
     */
    Filter {
        get => this.get_Filter()
        set => this.put_Filter(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(7, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsmembers-get__newenum
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &ppEnumerator := 0, "HRESULT")
        return IUnknown(ppEnumerator)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Filter() {
        pvFilter := VARIANT()
        result := ComCall(9, this, "ptr", pvFilter, "HRESULT")
        return pvFilter
    }

    /**
     * 
     * @param {VARIANT} pvFilter 
     * @returns {HRESULT} 
     */
    put_Filter(pvFilter) {
        result := ComCall(10, this, "ptr", pvFilter, "HRESULT")
        return result
    }
}
