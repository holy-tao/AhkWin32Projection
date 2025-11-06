#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugDocument.ahk
#Include .\IDebugDocumentInfo.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugDocumentProvider extends IDebugDocumentInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugDocumentProvider
     * @type {Guid}
     */
    static IID => Guid("{51973c20-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDocument"]

    /**
     * 
     * @returns {IDebugDocument} 
     */
    GetDocument() {
        result := ComCall(5, this, "ptr*", &ppssd := 0, "HRESULT")
        return IDebugDocument(ppssd)
    }
}
