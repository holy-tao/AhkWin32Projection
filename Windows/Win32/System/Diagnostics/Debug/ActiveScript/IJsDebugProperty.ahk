#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IJsDebugProperty extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IJsDebugProperty
     * @type {Guid}
     */
    static IID => Guid("{f8ffcf2b-3aa4-4320-85c3-52a312ba9633}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropertyInfo", "GetMembers"]

    /**
     * 
     * @param {Integer} nRadix 
     * @param {Pointer<JsDebugPropertyInfo>} pPropertyInfo 
     * @returns {HRESULT} 
     */
    GetPropertyInfo(nRadix, pPropertyInfo) {
        result := ComCall(3, this, "uint", nRadix, "ptr", pPropertyInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} members 
     * @param {Pointer<IJsEnumDebugProperty>} ppEnum 
     * @returns {HRESULT} 
     */
    GetMembers(members, ppEnum) {
        result := ComCall(4, this, "int", members, "ptr*", ppEnum, "HRESULT")
        return result
    }
}
