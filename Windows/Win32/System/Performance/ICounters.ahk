#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class ICounters extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICounters
     * @type {Guid}
     */
    static IID => Guid("{79167962-28fc-11cf-942f-008029004347}")

    /**
     * The class identifier for Counters
     * @type {Guid}
     */
    static CLSID => Guid("{b2b066d2-2aac-11cf-942f-008029004347}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "get_Item", "Add", "Remove"]

    /**
     * 
     * @param {Pointer<Integer>} pLong 
     * @returns {HRESULT} 
     */
    get_Count(pLong) {
        pLongMarshal := pLong is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pLongMarshal, pLong, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppIunk 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppIunk) {
        result := ComCall(8, this, "ptr*", ppIunk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} index 
     * @param {Pointer<DICounterItem>} ppI 
     * @returns {HRESULT} 
     */
    get_Item(index, ppI) {
        result := ComCall(9, this, "ptr", index, "ptr*", ppI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pathname 
     * @param {Pointer<DICounterItem>} ppI 
     * @returns {HRESULT} 
     */
    Add(pathname, ppI) {
        pathname := pathname is String ? BSTR.Alloc(pathname).Value : pathname

        result := ComCall(10, this, "ptr", pathname, "ptr*", ppI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} index 
     * @returns {HRESULT} 
     */
    Remove(index) {
        result := ComCall(11, this, "ptr", index, "HRESULT")
        return result
    }
}
