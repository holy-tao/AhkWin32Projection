#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IActionEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionEnumerator
     * @type {Guid}
     */
    static IID => Guid("{3dec5c44-f63a-4ca6-90f0-fd5c269fda59}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reset", "GetNext"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} keyName 
     * @param {Pointer<BSTR>} actionName 
     * @param {Pointer<BSTR>} actionDescription 
     * @param {Pointer<Boolean>} actionIsDefault 
     * @param {Pointer<IModelObject>} actionMethod 
     * @param {Pointer<IKeyStore>} metadta 
     * @returns {HRESULT} 
     */
    GetNext(keyName, actionName, actionDescription, actionIsDefault, actionMethod, metadta) {
        result := ComCall(4, this, "ptr", keyName, "ptr", actionName, "ptr", actionDescription, "int*", actionIsDefault, "ptr*", actionMethod, "ptr*", metadta, "HRESULT")
        return result
    }
}
