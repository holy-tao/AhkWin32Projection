#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WSD_METADATA_SECTION_LIST.ahk" { WSD_METADATA_SECTION_LIST }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Is the base class for other objects which access metadata.
 * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nn-wsdclient-iwsdmetadataexchange
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct IWSDMetadataExchange extends IUnknown {
    /**
     * The interface identifier for IWSDMetadataExchange
     * @type {Guid}
     */
    static IID := Guid("{06996d57-1d67-4928-9307-3d7833fdb846}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSDMetadataExchange interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetMetadata : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSDMetadataExchange.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves metadata for an object.
     * @returns {Pointer<WSD_METADATA_SECTION_LIST>} Pointer to a linked list of structures containing the requested metadata.
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdmetadataexchange-getmetadata
     */
    GetMetadata() {
        result := ComCall(3, this, "ptr*", &MetadataOut := 0, "HRESULT")
        return MetadataOut
    }

    Query(iid) {
        if (IWSDMetadataExchange.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMetadata := CallbackCreate(GetMethod(implObj, "GetMetadata"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMetadata)
    }
}
