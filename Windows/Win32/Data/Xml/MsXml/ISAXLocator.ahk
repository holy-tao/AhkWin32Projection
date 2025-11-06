#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISAXLocator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISAXLocator
     * @type {Guid}
     */
    static IID => Guid("{9b7e472a-0de4-4640-bff3-84d38a051c31}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["getColumnNumber", "getLineNumber", "getPublicId", "getSystemId"]

    /**
     * 
     * @returns {Integer} 
     */
    getColumnNumber() {
        result := ComCall(3, this, "int*", &pnColumn := 0, "HRESULT")
        return pnColumn
    }

    /**
     * 
     * @returns {Integer} 
     */
    getLineNumber() {
        result := ComCall(4, this, "int*", &pnLine := 0, "HRESULT")
        return pnLine
    }

    /**
     * 
     * @returns {Pointer<Integer>} 
     */
    getPublicId() {
        result := ComCall(5, this, "ptr*", &ppwchPublicId := 0, "HRESULT")
        return ppwchPublicId
    }

    /**
     * 
     * @returns {Pointer<Integer>} 
     */
    getSystemId() {
        result := ComCall(6, this, "ptr*", &ppwchSystemId := 0, "HRESULT")
        return ppwchSystemId
    }
}
