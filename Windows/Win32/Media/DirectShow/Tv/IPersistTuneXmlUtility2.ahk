#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IPersistTuneXmlUtility.ahk" { IPersistTuneXmlUtility }
#Import ".\ITuneRequest.ahk" { ITuneRequest }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Defines utility methods for serializing tuning requests (objects that implement the ITuneRequest interface) to XML tuning request strings.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IPersistTuneXmlUtility2)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-ipersisttunexmlutility2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IPersistTuneXmlUtility2 extends IPersistTuneXmlUtility {
    /**
     * The interface identifier for IPersistTuneXmlUtility2
     * @type {Guid}
     */
    static IID := Guid("{992e165f-ea24-4b2f-9a1d-009d92120451}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPersistTuneXmlUtility2 interfaces
    */
    struct Vtbl extends IPersistTuneXmlUtility.Vtbl {
        Serialize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPersistTuneXmlUtility2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Serializes a tuning request to an XML tuning request string.
     * @param {ITuneRequest} piTuneRequest Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/bdatif/nn-bdatif-itunerequestinfo">ITuneRequest</a> interface for the tuning request object that is serialized.
     * @returns {BSTR} Pointer to a buffer that receives the XML tuning request string. The caller is responsible for releasing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ipersisttunexmlutility2-serialize
     */
    Serialize(piTuneRequest) {
        pString := BSTR.Owned()
        result := ComCall(4, this, "ptr", piTuneRequest, BSTR.Ptr, pString, "HRESULT")
        return pString
    }

    Query(iid) {
        if (IPersistTuneXmlUtility2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Serialize := CallbackCreate(GetMethod(implObj, "Serialize"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Serialize)
    }
}
