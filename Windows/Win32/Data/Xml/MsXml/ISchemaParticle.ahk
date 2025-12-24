#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include .\ISchemaItem.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISchemaParticle extends ISchemaItem{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_minOccurs", "get_maxOccurs"]

    /**
     * @type {VARIANT} 
     */
    minOccurs {
        get => this.get_minOccurs()
    }

    /**
     * @type {VARIANT} 
     */
    maxOccurs {
        get => this.get_maxOccurs()
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_minOccurs() {
        minOccurs := VARIANT()
        result := ComCall(14, this, "ptr", minOccurs, "HRESULT")
        return minOccurs
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_maxOccurs() {
        maxOccurs := VARIANT()
        result := ComCall(15, this, "ptr", maxOccurs, "HRESULT")
        return maxOccurs
    }
}
