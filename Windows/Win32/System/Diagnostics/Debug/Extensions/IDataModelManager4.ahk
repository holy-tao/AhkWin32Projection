#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDataModelManager3.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelManager4 extends IDataModelManager3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataModelManager4
     * @type {Guid}
     */
    static IID => Guid("{8898ad97-3a2e-421c-953f-035e15426b7c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 27

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSyntheticObjectFromKeyStore"]

    /**
     * 
     * @param {IDebugHostContext} context 
     * @param {IKeyStore} parentStore 
     * @param {Pointer<IModelObject>} object 
     * @returns {HRESULT} 
     */
    CreateSyntheticObjectFromKeyStore(context, parentStore, object) {
        result := ComCall(27, this, "ptr", context, "ptr", parentStore, "ptr*", object, "HRESULT")
        return result
    }
}
