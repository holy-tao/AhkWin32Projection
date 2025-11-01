#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFileOperation.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFileOperation2 extends IFileOperation{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileOperation2
     * @type {Guid}
     */
    static IID => Guid("{cd8f23c1-8f61-4916-909d-55bdd0918753}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 23

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetOperationFlags2"]

    /**
     * 
     * @param {Integer} operationFlags2 
     * @returns {HRESULT} 
     */
    SetOperationFlags2(operationFlags2) {
        result := ComCall(23, this, "int", operationFlags2, "HRESULT")
        return result
    }
}
