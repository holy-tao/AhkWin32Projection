#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugDocumentInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugDocumentInfo
     * @type {Guid}
     */
    static IID => Guid("{51973c1f-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetDocumentClassId"]

    /**
     * 
     * @param {Integer} dnt 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    GetName(dnt, pbstrName) {
        result := ComCall(3, this, "int", dnt, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pclsidDocument 
     * @returns {HRESULT} 
     */
    GetDocumentClassId(pclsidDocument) {
        result := ComCall(4, this, "ptr", pclsidDocument, "HRESULT")
        return result
    }
}
