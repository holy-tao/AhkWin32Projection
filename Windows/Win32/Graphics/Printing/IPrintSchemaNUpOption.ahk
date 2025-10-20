#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrintSchemaOption.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintSchemaNUpOption extends IPrintSchemaOption{
    /**
     * The interface identifier for IPrintSchemaNUpOption
     * @type {Guid}
     */
    static IID => Guid("{1f6342f2-d848-42e3-8995-c10a9ef9a3ba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * 
     * @param {Pointer<UInt32>} pulPagesPerSheet 
     * @returns {HRESULT} 
     */
    get_PagesPerSheet(pulPagesPerSheet) {
        result := ComCall(14, this, "uint*", pulPagesPerSheet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
