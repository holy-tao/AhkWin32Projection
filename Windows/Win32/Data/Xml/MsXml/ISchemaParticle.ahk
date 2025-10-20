#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ISchemaItem.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISchemaParticle extends ISchemaItem{
    /**
     * The interface identifier for ISchemaParticle
     * @type {Guid}
     */
    static IID => Guid("{50ea08b5-dd1b-4664-9a50-c2f40f4bd79a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * 
     * @param {Pointer<VARIANT>} minOccurs 
     * @returns {HRESULT} 
     */
    get_minOccurs(minOccurs) {
        result := ComCall(14, this, "ptr", minOccurs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} maxOccurs 
     * @returns {HRESULT} 
     */
    get_maxOccurs(maxOccurs) {
        result := ComCall(15, this, "ptr", maxOccurs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
