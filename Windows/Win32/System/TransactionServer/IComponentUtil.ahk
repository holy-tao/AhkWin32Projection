#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.TransactionServer
 * @version v4.0.30319
 */
class IComponentUtil extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComponentUtil
     * @type {Guid}
     */
    static IID => Guid("{6eb22873-8a19-11d0-81b6-00a0c9231c29}")

    /**
     * The class identifier for ComponentUtil
     * @type {Guid}
     */
    static CLSID => Guid("{6eb22884-8a19-11d0-81b6-00a0c9231c29}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InstallComponent", "ImportComponent", "ImportComponentByName", "GetCLSIDs"]

    /**
     * 
     * @param {BSTR} bstrDLLFile 
     * @param {BSTR} bstrTypelibFile 
     * @param {BSTR} bstrProxyStubDLLFile 
     * @returns {HRESULT} 
     */
    InstallComponent(bstrDLLFile, bstrTypelibFile, bstrProxyStubDLLFile) {
        bstrDLLFile := bstrDLLFile is String ? BSTR.Alloc(bstrDLLFile).Value : bstrDLLFile
        bstrTypelibFile := bstrTypelibFile is String ? BSTR.Alloc(bstrTypelibFile).Value : bstrTypelibFile
        bstrProxyStubDLLFile := bstrProxyStubDLLFile is String ? BSTR.Alloc(bstrProxyStubDLLFile).Value : bstrProxyStubDLLFile

        result := ComCall(7, this, "ptr", bstrDLLFile, "ptr", bstrTypelibFile, "ptr", bstrProxyStubDLLFile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrCLSID 
     * @returns {HRESULT} 
     */
    ImportComponent(bstrCLSID) {
        bstrCLSID := bstrCLSID is String ? BSTR.Alloc(bstrCLSID).Value : bstrCLSID

        result := ComCall(8, this, "ptr", bstrCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProgID 
     * @returns {HRESULT} 
     */
    ImportComponentByName(bstrProgID) {
        bstrProgID := bstrProgID is String ? BSTR.Alloc(bstrProgID).Value : bstrProgID

        result := ComCall(9, this, "ptr", bstrProgID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDLLFile 
     * @param {BSTR} bstrTypelibFile 
     * @param {Pointer<Pointer<SAFEARRAY>>} aCLSIDs 
     * @returns {HRESULT} 
     */
    GetCLSIDs(bstrDLLFile, bstrTypelibFile, aCLSIDs) {
        bstrDLLFile := bstrDLLFile is String ? BSTR.Alloc(bstrDLLFile).Value : bstrDLLFile
        bstrTypelibFile := bstrTypelibFile is String ? BSTR.Alloc(bstrTypelibFile).Value : bstrTypelibFile

        result := ComCall(10, this, "ptr", bstrDLLFile, "ptr", bstrTypelibFile, "ptr*", aCLSIDs, "HRESULT")
        return result
    }
}
