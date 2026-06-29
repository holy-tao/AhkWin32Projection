#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\MPEG2StreamType.ahk" { MPEG2StreamType }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ILanguageComponentType.ahk" { ILanguageComponentType }

/**
 * The IMPEG2ComponentType interface is implemented on MPEG2ComponentType objects. It enables applications to set and retrieve information about MPEG2 stream types.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMPEG2ComponentType)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-impeg2componenttype
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMPEG2ComponentType extends ILanguageComponentType {
    /**
     * The interface identifier for IMPEG2ComponentType
     * @type {Guid}
     */
    static IID := Guid("{2c073d84-b51c-48c9-aa9f-68971e1f6e38}")

    /**
     * The class identifier for MPEG2ComponentType
     * @type {Guid}
     */
    static CLSID := Guid("{418008f3-cf67-4668-9628-10dc52be1d08}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMPEG2ComponentType interfaces
    */
    struct Vtbl extends ILanguageComponentType.Vtbl {
        get_StreamType : IntPtr
        put_StreamType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMPEG2ComponentType.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {MPEG2StreamType} 
     */
    StreamType {
        get => this.get_StreamType()
        set => this.put_StreamType(value)
    }

    /**
     * The get_StreamType method retrieves the stream type.
     * @returns {MPEG2StreamType} Pointer to a variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/mpeg2streamtype">MPEG2StreamType</a> that receives the stream type value.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-impeg2componenttype-get_streamtype
     */
    get_StreamType() {
        result := ComCall(26, this, "int*", &MP2StreamType := 0, "HRESULT")
        return MP2StreamType
    }

    /**
     * The put_StreamType method sets the MPEG2 stream type.
     * @param {MPEG2StreamType} MP2StreamType Variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/mpeg2streamtype">MPEG2StreamType</a> that specifies the stream type.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-impeg2componenttype-put_streamtype
     */
    put_StreamType(MP2StreamType) {
        result := ComCall(27, this, MPEG2StreamType, MP2StreamType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMPEG2ComponentType.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_StreamType := CallbackCreate(GetMethod(implObj, "get_StreamType"), flags, 2)
        this.vtbl.put_StreamType := CallbackCreate(GetMethod(implObj, "put_StreamType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_StreamType)
        CallbackFree(this.vtbl.put_StreamType)
    }
}
