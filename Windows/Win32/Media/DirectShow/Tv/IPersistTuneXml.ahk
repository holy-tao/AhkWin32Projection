#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IPersist.ahk" { IPersist }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Implements methods for serializing tuning model objects. All serializable tuning model objects are required to implement this interface.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IPersistTuneXml)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-ipersisttunexml
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IPersistTuneXml extends IPersist {
    /**
     * The interface identifier for IPersistTuneXml
     * @type {Guid}
     */
    static IID := Guid("{0754cd31-8d15-47a9-8215-d20064157244}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPersistTuneXml interfaces
    */
    struct Vtbl extends IPersist.Vtbl {
        InitNew : IntPtr
        Load    : IntPtr
        Save    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPersistTuneXml.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This method is not implemented in the current release. It was created to make the IPersistTuneXml interface compatible with the IPersistStreamInit interface and is reserved for future use.
     * @returns {HRESULT} Always returns <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ipersisttunexml-initnew
     */
    InitNew() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Deserializes a tuning model object from an XML node.
     * @param {VARIANT} varValue XML node used to deserialize the object. This parameter can be either a <b>BSTR</b> object or an <b>IXMLDOMNode</b> object.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ipersisttunexml-load
     */
    Load(varValue) {
        result := ComCall(5, this, VARIANT, varValue, "HRESULT")
        return result
    }

    /**
     * Serializes a tuning model object to an XML node.
     * @returns {VARIANT} Pointer to an <b>IXMLDOMNode</b> object that gets the data for the tuning model object.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ipersisttunexml-save
     */
    Save() {
        pvarFragment := VARIANT()
        result := ComCall(6, this, VARIANT.Ptr, pvarFragment, "HRESULT")
        return pvarFragment
    }

    Query(iid) {
        if (IPersistTuneXml.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitNew := CallbackCreate(GetMethod(implObj, "InitNew"), flags, 1)
        this.vtbl.Load := CallbackCreate(GetMethod(implObj, "Load"), flags, 2)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitNew)
        CallbackFree(this.vtbl.Load)
        CallbackFree(this.vtbl.Save)
    }
}
