#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\JsDebugPropertyInfo.ahk
#Include .\JS_PROPERTY_MEMBERS.ahk
#Include ..\..\..\Com\IUnknown.ahk
#Include .\IJsEnumDebugProperty.ahk
#Include ..\..\..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class IJsDebugProperty extends IUnknown {

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
     * The GetPropertyInfo function returns a pointer to the property information of a given protocol.
     * @remarks
     * [*Experts*](e.md) and [*parsers*](p.md) can call the **GetPropertyInfo** function.
     * @param {Integer} nRadix 
     * @returns {JsDebugPropertyInfo} 
     * @see https://learn.microsoft.com/windows/win32/NetMon2/getpropertyinfo
     */
    GetPropertyInfo(nRadix) {
        pPropertyInfo := JsDebugPropertyInfo()
        result := ComCall(3, this, "uint", nRadix, "ptr", pPropertyInfo, "HRESULT")
        return pPropertyInfo
    }

    /**
     * 
     * @param {JS_PROPERTY_MEMBERS} members 
     * @returns {IJsEnumDebugProperty} 
     */
    GetMembers(members) {
        result := ComCall(4, this, "int", members, "ptr*", &ppEnum := 0, "HRESULT")
        return IJsEnumDebugProperty(ppEnum)
    }
}
