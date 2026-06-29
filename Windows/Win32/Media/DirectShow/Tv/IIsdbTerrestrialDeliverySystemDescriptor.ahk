#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) terrestrial delivery system descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-iisdbterrestrialdeliverysystemdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IIsdbTerrestrialDeliverySystemDescriptor extends IUnknown {
    /**
     * The interface identifier for IIsdbTerrestrialDeliverySystemDescriptor
     * @type {Guid}
     */
    static IID := Guid("{39fae0a6-d151-44dd-a28a-765de5991670}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIsdbTerrestrialDeliverySystemDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag              : IntPtr
        GetLength           : IntPtr
        GetAreaCode         : IntPtr
        GetGuardInterval    : IntPtr
        GetTransmissionMode : IntPtr
        GetCountOfRecords   : IntPtr
        GetRecordFrequency  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIsdbTerrestrialDeliverySystemDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag that identifies an Integrated Digital Services Broadcasting (ISDB) terrestrial delivery system descriptor.
     * @returns {Integer} Receives the terrestrial delivery system descriptor tag. For terrestrial delivery system descriptors, this value is 0xFA.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbterrestrialdeliverysystemdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of an Integrated Services Digital Broadcasting (ISDB) terrestrial delivery system descriptor, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbterrestrialdeliverysystemdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the service area code from an Integrated Services Digital Broadcasting (ISDB) terrestrial delivery system descriptor.
     * @returns {Integer} Receives the area code.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbterrestrialdeliverysystemdescriptor-getareacode
     */
    GetAreaCode() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the guard interval from an Integrated Services Digital Broadcasting (ISDB) terrestrial delivery system descriptor.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbterrestrialdeliverysystemdescriptor-getguardinterval
     */
    GetGuardInterval() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the transmission mode from an Integrated Services Digital Broadcasting (ISDB) terrestrial delivery system descriptor.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbterrestrialdeliverysystemdescriptor-gettransmissionmode
     */
    GetTransmissionMode() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the number of records in an Integrated Services Digital Broadcasting (ISDB) terrestrial delivery system descriptor.
     * @returns {Integer} Receives the number of records.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbterrestrialdeliverysystemdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(8, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the center frequency from an Integrated Services Digital Broadcasting (ISDB) terrestrial delivery system descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the descriptor to return. To get the number of descriptors, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbparentalratingdescriptor-getcountofrecords">IIsdbTerrestrialDeliverySystemDescriptor::GetCountOfRecords</a>
     * @returns {Integer} Receives the center frequency, in units of 1/7 MHz.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbterrestrialdeliverysystemdescriptor-getrecordfrequency
     */
    GetRecordFrequency(bRecordIndex) {
        result := ComCall(9, this, "char", bRecordIndex, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    Query(iid) {
        if (IIsdbTerrestrialDeliverySystemDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetAreaCode := CallbackCreate(GetMethod(implObj, "GetAreaCode"), flags, 2)
        this.vtbl.GetGuardInterval := CallbackCreate(GetMethod(implObj, "GetGuardInterval"), flags, 2)
        this.vtbl.GetTransmissionMode := CallbackCreate(GetMethod(implObj, "GetTransmissionMode"), flags, 2)
        this.vtbl.GetCountOfRecords := CallbackCreate(GetMethod(implObj, "GetCountOfRecords"), flags, 2)
        this.vtbl.GetRecordFrequency := CallbackCreate(GetMethod(implObj, "GetRecordFrequency"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetAreaCode)
        CallbackFree(this.vtbl.GetGuardInterval)
        CallbackFree(this.vtbl.GetTransmissionMode)
        CallbackFree(this.vtbl.GetCountOfRecords)
        CallbackFree(this.vtbl.GetRecordFrequency)
    }
}
