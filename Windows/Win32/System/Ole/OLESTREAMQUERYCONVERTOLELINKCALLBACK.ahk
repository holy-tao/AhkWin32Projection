#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class OLESTREAMQUERYCONVERTOLELINKCALLBACK extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<Guid>} pClsid 
     * @param {PWSTR} szClass 
     * @param {PWSTR} szTopicName 
     * @param {PWSTR} szItemName 
     * @param {PWSTR} szUNCName 
     * @param {Integer} linkUpdatingOption 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pClsid, szClass, szTopicName, szItemName, szUNCName, linkUpdatingOption, pvContext) {
        szClass := szClass is String ? StrPtr(szClass) : szClass
        szTopicName := szTopicName is String ? StrPtr(szTopicName) : szTopicName
        szItemName := szItemName is String ? StrPtr(szItemName) : szItemName
        szUNCName := szUNCName is String ? StrPtr(szUNCName) : szUNCName

        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", pClsid, "ptr", szClass, "ptr", szTopicName, "ptr", szItemName, "ptr", szUNCName, "uint", linkUpdatingOption, pvContextMarshal, pvContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
