#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Gets information from the Service Location Descriptor in an Advanced Television Systems Committee (ATSC) Virtual Channel Table (VCT).
 * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nn-atscpsipparser-iservicelocationdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IServiceLocationDescriptor extends IUnknown {
    /**
     * The interface identifier for IServiceLocationDescriptor
     * @type {Guid}
     */
    static IID := Guid("{58c3c827-9d91-4215-bff3-820a49f0904c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IServiceLocationDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPCR_PID             : IntPtr
        GetNumberOfElements    : IntPtr
        GetElementStreamType   : IntPtr
        GetElementPID          : IntPtr
        GetElementLanguageCode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IServiceLocationDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the program ID (PID) for the packets that contain the Program Clock Reference (PCR) in the transport stream from an Advanced Television Systems Committee (ATSC) Service Location Descriptor.
     * @returns {Integer} Receives the PID value.
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iservicelocationdescriptor-getpcr_pid
     */
    GetPCR_PID() {
        result := ComCall(3, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the number of elementary streams for an Advanced Television Systems Committee (ATSC) service location descriptor.
     * @returns {Integer} Receives the number of elementary streams.
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iservicelocationdescriptor-getnumberofelements
     */
    GetNumberOfElements() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets a code identifying the type of an elementary stream from an Advanced Television Systems Committee (ATSC) Service Location Descriptor.
     * @param {Integer} bIndex Specifies the elementary stream,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iservicelocationdescriptor-getnumberofelements">IServiceLocationDescriptor::GetNumberOfElements</a> method to get the number of elementary streams in the descriptor.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iservicelocationdescriptor-getelementstreamtype
     */
    GetElementStreamType(bIndex) {
        result := ComCall(5, this, "char", bIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the program ID (PID) that identifies an elementary stream from an Advanced Television Systems Committee (ATSC) Service Location Descriptor.
     * @param {Integer} bIndex Specifies the elementary stream,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iservicelocationdescriptor-getnumberofelements">IServiceLocationDescriptor::GetNumberOfElements</a> method to get the number of elementary streams in the descriptor.
     * @returns {Integer} Receives the PID value for the elementary stream.
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iservicelocationdescriptor-getelementpid
     */
    GetElementPID(bIndex) {
        result := ComCall(6, this, "char", bIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the three-character ISO 639 language code for an Advanced Television Systems Committee (ATSC) service location descriptor.
     * @param {Integer} bIndex Specifies the elementary stream,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/atscpsipparser/nf-atscpsipparser-iservicelocationdescriptor-getnumberofelements">IServiceLocationDescriptor::GetNumberOfElements</a> method to get the number of elementary streams in the descriptor.
     * @returns {Integer} Pointer to a buffer that receives the language code. For a list of language codes, refer to <a href="http://www-01.sil.org/iso639-3/codes.asp">ISO 639 Code Tables</a>.
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iservicelocationdescriptor-getelementlanguagecode
     */
    GetElementLanguageCode(bIndex) {
        result := ComCall(7, this, "char", bIndex, "char*", &LangCode := 0, "HRESULT")
        return LangCode
    }

    Query(iid) {
        if (IServiceLocationDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPCR_PID := CallbackCreate(GetMethod(implObj, "GetPCR_PID"), flags, 2)
        this.vtbl.GetNumberOfElements := CallbackCreate(GetMethod(implObj, "GetNumberOfElements"), flags, 2)
        this.vtbl.GetElementStreamType := CallbackCreate(GetMethod(implObj, "GetElementStreamType"), flags, 3)
        this.vtbl.GetElementPID := CallbackCreate(GetMethod(implObj, "GetElementPID"), flags, 3)
        this.vtbl.GetElementLanguageCode := CallbackCreate(GetMethod(implObj, "GetElementLanguageCode"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPCR_PID)
        CallbackFree(this.vtbl.GetNumberOfElements)
        CallbackFree(this.vtbl.GetElementStreamType)
        CallbackFree(this.vtbl.GetElementPID)
        CallbackFree(this.vtbl.GetElementLanguageCode)
    }
}
