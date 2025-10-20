#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ILBEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILBEvents
     * @type {Guid}
     */
    static IID => Guid("{683130b4-2e50-11d2-98a5-00c04f8ee1c4}")

    /**
     * The class identifier for LBEvents
     * @type {Guid}
     */
    static CLSID => Guid("{ecabb0c1-7f19-11d2-978e-0000f8757e2a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TargetUp", "TargetDown", "EngineDefined"]

    /**
     * 
     * @param {BSTR} bstrServerName 
     * @param {BSTR} bstrClsidEng 
     * @returns {HRESULT} 
     */
    TargetUp(bstrServerName, bstrClsidEng) {
        bstrServerName := bstrServerName is String ? BSTR.Alloc(bstrServerName).Value : bstrServerName
        bstrClsidEng := bstrClsidEng is String ? BSTR.Alloc(bstrClsidEng).Value : bstrClsidEng

        result := ComCall(3, this, "ptr", bstrServerName, "ptr", bstrClsidEng, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrServerName 
     * @param {BSTR} bstrClsidEng 
     * @returns {HRESULT} 
     */
    TargetDown(bstrServerName, bstrClsidEng) {
        bstrServerName := bstrServerName is String ? BSTR.Alloc(bstrServerName).Value : bstrServerName
        bstrClsidEng := bstrClsidEng is String ? BSTR.Alloc(bstrClsidEng).Value : bstrClsidEng

        result := ComCall(4, this, "ptr", bstrServerName, "ptr", bstrClsidEng, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropName 
     * @param {Pointer<VARIANT>} varPropValue 
     * @param {BSTR} bstrClsidEng 
     * @returns {HRESULT} 
     */
    EngineDefined(bstrPropName, varPropValue, bstrClsidEng) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName
        bstrClsidEng := bstrClsidEng is String ? BSTR.Alloc(bstrClsidEng).Value : bstrClsidEng

        result := ComCall(5, this, "ptr", bstrPropName, "ptr", varPropValue, "ptr", bstrClsidEng, "HRESULT")
        return result
    }
}
