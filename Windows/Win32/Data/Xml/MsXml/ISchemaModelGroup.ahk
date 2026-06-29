#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISchemaItemCollection.ahk" { ISchemaItemCollection }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISchemaParticle.ahk" { ISchemaParticle }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct ISchemaModelGroup extends ISchemaParticle {
    /**
     * The interface identifier for ISchemaModelGroup
     * @type {Guid}
     */
    static IID := Guid("{50ea08bb-dd1b-4664-9a50-c2f40f4bd79a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISchemaModelGroup interfaces
    */
    struct Vtbl extends ISchemaParticle.Vtbl {
        get_particles : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISchemaModelGroup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISchemaItemCollection} 
     */
    particles {
        get => this.get_particles()
    }

    /**
     * 
     * @returns {ISchemaItemCollection} 
     */
    get_particles() {
        result := ComCall(16, this, "ptr*", &particles := 0, "HRESULT")
        return ISchemaItemCollection(particles)
    }

    Query(iid) {
        if (ISchemaModelGroup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_particles := CallbackCreate(GetMethod(implObj, "get_particles"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_particles)
    }
}
