#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Defines utility methods for deserializing XML tuning requests to objects that expose their IUnknown interfaces.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IPersistTuneXmlUtility)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-ipersisttunexmlutility
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IPersistTuneXmlUtility extends IUnknown {
    /**
     * The interface identifier for IPersistTuneXmlUtility
     * @type {Guid}
     */
    static IID := Guid("{990237ae-ac11-4614-be8f-dd217a4cb4cb}")

    /**
     * The class identifier for PersistTuneXmlUtility
     * @type {Guid}
     */
    static CLSID := Guid("{e77026b0-b97f-4cbb-b7fb-f4f03ad69f11}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPersistTuneXmlUtility interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Deserialize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPersistTuneXmlUtility.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Constructs and returns an object that initializes itself by using the XML node passed as a VARIANT parameter to the method. The returned object exposes its IUnknown interface so that other objects can query it.
     * @param {VARIANT} varValue XML node used to construct and initialize the object. This parameter can be either a <b>BSTR</b> object or an <b>IXMLDOMNode</b> object.
     * @returns {IUnknown} Pointer to the <b>IUnknown</b> interface of the object being deserialized.
     *           This method allocates memory to hold the deserialized object and returns the pointer in this parameter. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ipersisttunexmlutility-deserialize
     */
    Deserialize(varValue) {
        result := ComCall(3, this, VARIANT, varValue, "ptr*", &ppObject := 0, "HRESULT")
        return IUnknown(ppObject)
    }

    Query(iid) {
        if (IPersistTuneXmlUtility.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Deserialize := CallbackCreate(GetMethod(implObj, "Deserialize"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Deserialize)
    }
}
