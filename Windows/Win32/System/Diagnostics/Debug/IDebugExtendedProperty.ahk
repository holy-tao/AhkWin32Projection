#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ExtendedDebugPropertyInfo.ahk
#Include .\IEnumDebugExtendedPropertyInfo.ahk
#Include .\IDebugProperty.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IDebugExtendedProperty extends IDebugProperty{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugExtendedProperty
     * @type {Guid}
     */
    static IID => Guid("{51973c52-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetExtendedPropertyInfo", "EnumExtendedMembers"]

    /**
     * 
     * @param {Integer} dwFieldSpec 
     * @param {Integer} nRadix 
     * @returns {ExtendedDebugPropertyInfo} 
     */
    GetExtendedPropertyInfo(dwFieldSpec, nRadix) {
        pExtendedPropertyInfo := ExtendedDebugPropertyInfo()
        result := ComCall(8, this, "uint", dwFieldSpec, "uint", nRadix, "ptr", pExtendedPropertyInfo, "HRESULT")
        return pExtendedPropertyInfo
    }

    /**
     * 
     * @param {Integer} dwFieldSpec 
     * @param {Integer} nRadix 
     * @returns {IEnumDebugExtendedPropertyInfo} 
     */
    EnumExtendedMembers(dwFieldSpec, nRadix) {
        result := ComCall(9, this, "uint", dwFieldSpec, "uint", nRadix, "ptr*", &ppeepi := 0, "HRESULT")
        return IEnumDebugExtendedPropertyInfo(ppeepi)
    }
}
