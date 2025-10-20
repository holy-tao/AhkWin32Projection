#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class INamedModelsEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INamedModelsEnumerator
     * @type {Guid}
     */
    static IID => Guid("{47bbfc0b-0b20-4e0c-882b-465d6ccac97c}")

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
     * @param {Pointer<BSTR>} pModelName 
     * @param {Pointer<IModelObject>} ppModel 
     * @returns {HRESULT} 
     */
    GetNext(pModelName, ppModel) {
        result := ComCall(4, this, "ptr", pModelName, "ptr*", ppModel, "HRESULT")
        return result
    }
}
