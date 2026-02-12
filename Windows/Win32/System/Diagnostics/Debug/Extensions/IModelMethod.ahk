#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IModelMethod extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IModelMethod
     * @type {Guid}
     */
    static IID => Guid("{80600c1f-b90b-4896-82ad-1c00207909e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Call"]

    /**
     * Call SQLColumns on a Table with Sparse Columns
     * @param {IModelObject} pContextObject 
     * @param {Integer} argCount 
     * @param {Pointer<IModelObject>} ppArguments 
     * @param {Pointer<IModelObject>} ppResult 
     * @param {Pointer<Pointer<IKeyStore>>} ppMetadata 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/native-client-odbc-how-to/call-sqlcolumns-on-a-table-with-sparse-columns
     */
    Call(pContextObject, argCount, ppArguments, ppResult, ppMetadata) {
        result := ComCall(3, this, "ptr", pContextObject, "uint", argCount, "ptr*", ppArguments, "ptr*", ppResult, "ptr*", ppMetadata, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
