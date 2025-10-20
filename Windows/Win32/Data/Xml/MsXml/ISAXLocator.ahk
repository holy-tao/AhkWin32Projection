#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISAXLocator extends IUnknown{
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
     * 
     * @param {Pointer<Int32>} pnColumn 
     * @returns {HRESULT} 
     */
    getColumnNumber(pnColumn) {
        result := ComCall(3, this, "int*", pnColumn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pnLine 
     * @returns {HRESULT} 
     */
    getLineNumber(pnLine) {
        result := ComCall(4, this, "int*", pnLine, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} ppwchPublicId 
     * @returns {HRESULT} 
     */
    getPublicId(ppwchPublicId) {
        result := ComCall(5, this, "ushort*", ppwchPublicId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} ppwchSystemId 
     * @returns {HRESULT} 
     */
    getSystemId(ppwchSystemId) {
        result := ComCall(6, this, "ushort*", ppwchSystemId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
