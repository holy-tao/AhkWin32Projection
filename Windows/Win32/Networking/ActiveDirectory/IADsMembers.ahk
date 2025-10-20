#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     */
    get_Count(plCount) {
        result := ComCall(7, this, "int*", plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppEnumerator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsmembers-get__newenum
     */
    get__NewEnum(ppEnumerator) {
        result := ComCall(8, this, "ptr*", ppEnumerator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvFilter 
     * @returns {HRESULT} 
     */
    get_Filter(pvFilter) {
        result := ComCall(9, this, "ptr", pvFilter, "HRESULT")
        return result
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
