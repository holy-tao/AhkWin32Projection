#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISchemaItem.ahk" { ISchemaItem }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct ISchemaParticle extends ISchemaItem {
    /**
     * The interface identifier for ISchemaParticle
     * @type {Guid}
     */
    static IID := Guid("{50ea08b5-dd1b-4664-9a50-c2f40f4bd79a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISchemaParticle interfaces
    */
    struct Vtbl extends ISchemaItem.Vtbl {
        get_minOccurs : IntPtr
        get_maxOccurs : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISchemaParticle.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(14, this, VARIANT.Ptr, minOccurs, "HRESULT")
        return minOccurs
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_maxOccurs() {
        maxOccurs := VARIANT()
        result := ComCall(15, this, VARIANT.Ptr, maxOccurs, "HRESULT")
        return maxOccurs
    }

    Query(iid) {
        if (ISchemaParticle.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_minOccurs := CallbackCreate(GetMethod(implObj, "get_minOccurs"), flags, 2)
        this.vtbl.get_maxOccurs := CallbackCreate(GetMethod(implObj, "get_maxOccurs"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_minOccurs)
        CallbackFree(this.vtbl.get_maxOccurs)
    }
}
