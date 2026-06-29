#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\MPEG_DATE.ahk" { MPEG_DATE }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) service information (SI) parameter descriptor. The SI parameter descriptor appears in the program map table (PMT) or network information table (NIT).
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-iisdbsiparameterdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IIsdbSIParameterDescriptor extends IUnknown {
    /**
     * The interface identifier for IIsdbSIParameterDescriptor
     * @type {Guid}
     */
    static IID := Guid("{f837dc36-867c-426a-9111-f62093951a45}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIsdbSIParameterDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag                    : IntPtr
        GetLength                 : IntPtr
        GetParameterVersion       : IntPtr
        GetUpdateTime             : IntPtr
        GetRecordNumberOfTable    : IntPtr
        GetTableId                : IntPtr
        GetTableDescriptionLength : IntPtr
        GetTableDescriptionBytes  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIsdbSIParameterDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag that identifies a service information (SI) parameter descriptor.
     * @returns {Integer} Receives the tag value. For SI parameter descriptors, this value is 0xD7.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of a service information (SI) parameter descriptor, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the version number of a parameter from a service information (SI) parameter descriptor. This version number is incremented by one each time the parameter is updated.
     * @returns {Integer} Receives the version number.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-getparameterversion
     */
    GetParameterVersion() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the time at which a parameter becomes valid from a service information (SI) parameter descriptor.
     * @returns {MPEG_DATE} Receives the date/time value that indicates when the parameter becomes valid.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-getupdatetime
     */
    GetUpdateTime() {
        pVal := MPEG_DATE()
        result := ComCall(6, this, MPEG_DATE.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets the number of table descriptors in a service information (SI) parameter descriptor.
     * @returns {Integer} Receives the number of table descriptors.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-getrecordnumberoftable
     */
    GetRecordNumberOfTable() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets an identifier for a table descriptor in a service information (SI) parameter descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the SI table descriptor. To get the number of table descriptors, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-getrecordnumberoftable">IIsdbSIParameterDescriptor::GetRecordNumberOfTable</a> method.
     * @returns {Integer} Receives the table descriptor identifier.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-gettableid
     */
    GetTableId(bRecordIndex) {
        result := ComCall(8, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of a table descriptor in a service information (SI) parameter descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the SI table descriptor. To get the number of table descriptors, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-getrecordnumberoftable">IIsdbSIParameterDescriptor::GetRecordNumberOfTable</a> method.
     * @returns {Integer} Receives the length of the table descriptor, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-gettabledescriptionlength
     */
    GetTableDescriptionLength(bRecordIndex) {
        result := ComCall(9, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets description data from a table descriptor in a service information (SI) parameter descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the SI table descriptor. To get the number of table descriptors, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-getrecordnumberoftable">IIsdbSIParameterDescriptor::GetRecordNumberOfTable</a> method.
     * @param {Pointer<Integer>} pbBufferLength On input specifies the length of the table descriptor data that is retrieved, in bytes. On output returns the actual data length.
     * @returns {Integer} Receives the table descriptor data.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-gettabledescriptionbytes
     */
    GetTableDescriptionBytes(bRecordIndex, pbBufferLength) {
        pbBufferLengthMarshal := pbBufferLength is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, "char", bRecordIndex, pbBufferLengthMarshal, pbBufferLength, "char*", &pbBuffer := 0, "HRESULT")
        return pbBuffer
    }

    Query(iid) {
        if (IIsdbSIParameterDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetParameterVersion := CallbackCreate(GetMethod(implObj, "GetParameterVersion"), flags, 2)
        this.vtbl.GetUpdateTime := CallbackCreate(GetMethod(implObj, "GetUpdateTime"), flags, 2)
        this.vtbl.GetRecordNumberOfTable := CallbackCreate(GetMethod(implObj, "GetRecordNumberOfTable"), flags, 2)
        this.vtbl.GetTableId := CallbackCreate(GetMethod(implObj, "GetTableId"), flags, 3)
        this.vtbl.GetTableDescriptionLength := CallbackCreate(GetMethod(implObj, "GetTableDescriptionLength"), flags, 3)
        this.vtbl.GetTableDescriptionBytes := CallbackCreate(GetMethod(implObj, "GetTableDescriptionBytes"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetParameterVersion)
        CallbackFree(this.vtbl.GetUpdateTime)
        CallbackFree(this.vtbl.GetRecordNumberOfTable)
        CallbackFree(this.vtbl.GetTableId)
        CallbackFree(this.vtbl.GetTableDescriptionLength)
        CallbackFree(this.vtbl.GetTableDescriptionBytes)
    }
}
