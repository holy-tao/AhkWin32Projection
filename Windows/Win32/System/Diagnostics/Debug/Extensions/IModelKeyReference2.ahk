#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IModelKeyReference.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IModelKeyReference2 extends IModelKeyReference{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IModelKeyReference2
     * @type {Guid}
     */
    static IID => Guid("{80e2f7c5-7159-4e92-887e-7e0347e88406}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OverrideContextObject"]

    /**
     * 
     * @param {IModelObject} newContextObject 
     * @returns {HRESULT} 
     */
    OverrideContextObject(newContextObject) {
        result := ComCall(10, this, "ptr", newContextObject, "HRESULT")
        return result
    }
}
