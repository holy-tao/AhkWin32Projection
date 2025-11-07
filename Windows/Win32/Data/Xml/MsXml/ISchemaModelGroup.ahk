#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ISchemaItemCollection.ahk
#Include .\ISchemaParticle.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISchemaModelGroup extends ISchemaParticle{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISchemaModelGroup
     * @type {Guid}
     */
    static IID => Guid("{50ea08bb-dd1b-4664-9a50-c2f40f4bd79a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_particles"]

    /**
     * 
     * @returns {ISchemaItemCollection} 
     */
    get_particles() {
        result := ComCall(16, this, "ptr*", &particles := 0, "HRESULT")
        return ISchemaItemCollection(particles)
    }
}
