#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include .\ICounterItem.ahk

/**
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class ICounterItem2 extends ICounterItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICounterItem2
     * @type {Guid}
     */
    static IID => Guid("{eefcd4e1-ea1c-4435-b7f4-e341ba03b4f9}")

    /**
     * The class identifier for CounterItem2
     * @type {Guid}
     */
    static CLSID => Guid("{43196c62-c31f-4ce3-a02e-79efe0f6a525}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Selected", "get_Selected", "put_Visible", "get_Visible", "GetDataAt"]

    /**
     * @type {VARIANT_BOOL} 
     */
    Selected {
        get => this.get_Selected()
        set => this.put_Selected(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Visible {
        get => this.get_Visible()
        set => this.put_Visible(value)
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_Selected(bState) {
        result := ComCall(15, this, "short", bState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Selected() {
        result := ComCall(16, this, "short*", &pbState := 0, "HRESULT")
        return pbState
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_Visible(bState) {
        result := ComCall(17, this, "short", bState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Visible() {
        result := ComCall(18, this, "short*", &pbState := 0, "HRESULT")
        return pbState
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {Integer} iWhich 
     * @returns {VARIANT} 
     */
    GetDataAt(iIndex, iWhich) {
        pVariant := VARIANT()
        result := ComCall(19, this, "int", iIndex, "int", iWhich, "ptr", pVariant, "HRESULT")
        return pVariant
    }
}
