#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugDocumentInfo.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugDocumentProvider extends IDebugDocumentInfo{
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
     * 
     * @param {Pointer<IDebugDocument>} ppssd 
     * @returns {HRESULT} 
     */
    GetDocument(ppssd) {
        result := ComCall(5, this, "ptr", ppssd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
