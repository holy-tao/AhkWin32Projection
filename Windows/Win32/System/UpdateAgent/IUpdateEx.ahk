#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IUpdate5.ahk

/**
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateEx extends IUpdate5{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateEx
     * @type {Guid}
     */
    static IID => Guid("{769355a3-c5a0-497c-a606-560a36d2121c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 60

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExtendedStaticProperty", "EvaluateExtendedDynamicProperty"]

    /**
     * 
     * @param {BSTR} propertyName 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_ExtendedStaticProperty(propertyName, retval) {
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        result := ComCall(60, this, "ptr", propertyName, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} propertyName 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    EvaluateExtendedDynamicProperty(propertyName, retval) {
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        result := ComCall(61, this, "ptr", propertyName, "ptr", retval, "HRESULT")
        return result
    }
}
