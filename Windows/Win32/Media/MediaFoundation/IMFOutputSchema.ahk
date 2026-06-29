#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFAttributes.ahk" { IMFAttributes }

/**
 * Encapsulates information about an output protection system and its corresponding configuration data.
 * @remarks
 * If the configuration information for the output protection system does not require more than a <b>DWORD</b> of space, the configuration information is retrieved in the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfoutputschema-getconfigurationdata">GetConfigurationData</a> method. If more than a <b>DWORD</b> of configuration information is needed, it is stored using the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfoutputschema
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFOutputSchema extends IMFAttributes {
    /**
     * The interface identifier for IMFOutputSchema
     * @type {Guid}
     */
    static IID := Guid("{7be0fc5b-abd9-44fb-a5c8-f50136e71599}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFOutputSchema interfaces
    */
    struct Vtbl extends IMFAttributes.Vtbl {
        GetSchemaType        : IntPtr
        GetConfigurationData : IntPtr
        GetOriginatorID      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFOutputSchema.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the output protection system that is represented by this object. Output protection systems are identified by GUID value.
     * @returns {Guid} Receives the GUID that identifies the output protection system.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfoutputschema-getschematype
     */
    GetSchemaType() {
        pguidSchemaType := Guid()
        result := ComCall(33, this, Guid.Ptr, pguidSchemaType, "HRESULT")
        return pguidSchemaType
    }

    /**
     * Returns configuration data for the output protection system. The configuration data is used to enable or disable the protection system, and to set the protection levels.
     * @returns {Integer} Receives the configuration data. The meaning of this data depends on the output protection system.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfoutputschema-getconfigurationdata
     */
    GetConfigurationData() {
        result := ComCall(34, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * Retrieves a GUID identifying the input trust authority (ITA) that generated this output schema object.
     * @remarks
     * All of the policy objects and output schemas from the same ITA should return the same originator identifier (including dynamic policy changes). This value enables the OTA to distinguish policies that originate from different ITAs, so that the OTA can update dynamic policies correctly.
     * @returns {Guid} Receives a GUID that identifies the originating ITA.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfoutputschema-getoriginatorid
     */
    GetOriginatorID() {
        pguidOriginatorID := Guid()
        result := ComCall(35, this, Guid.Ptr, pguidOriginatorID, "HRESULT")
        return pguidOriginatorID
    }

    Query(iid) {
        if (IMFOutputSchema.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSchemaType := CallbackCreate(GetMethod(implObj, "GetSchemaType"), flags, 2)
        this.vtbl.GetConfigurationData := CallbackCreate(GetMethod(implObj, "GetConfigurationData"), flags, 2)
        this.vtbl.GetOriginatorID := CallbackCreate(GetMethod(implObj, "GetOriginatorID"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSchemaType)
        CallbackFree(this.vtbl.GetConfigurationData)
        CallbackFree(this.vtbl.GetOriginatorID)
    }
}
