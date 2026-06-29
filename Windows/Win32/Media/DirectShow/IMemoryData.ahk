#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Note  This interface is deprecated.
 * @see https://learn.microsoft.com/windows/win32/api/austream/nn-austream-imemorydata
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IMemoryData extends IUnknown {
    /**
     * The interface identifier for IMemoryData
     * @type {Guid}
     */
    static IID := Guid("{327fc560-af60-11d0-8212-00c04fc32c45}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMemoryData interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetBuffer : IntPtr
        GetInfo   : IntPtr
        SetActual : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMemoryData.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Initializes a memory buffer with a pointer to memory and length.
     * @remarks
     * This method can be called as often as needed. When using <a href="https://docs.microsoft.com/windows/desktop/api/mmstream/nf-mmstream-istreamsample-update">IStreamSample::Update</a> to update samples asynchronously, make sure that SetBuffer is never called before an update is completed.
     * @param {Integer} cbSize Size of memory pointed to by <i>pbData</i>, in bytes.
     * @param {Pointer<Integer>} pbData Pointer to memory that this object will use.
     * @param {Integer} dwFlags Reserved for flag data. Must be zero.
     * @returns {HRESULT} Returns S_OK if successful or E_INVALIDARG if <i>cbSize</i> is zero or <i>pbData</i> is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/austream/nf-austream-imemorydata-setbuffer
     */
    SetBuffer(cbSize, pbData, dwFlags) {
        pbDataMarshal := pbData is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", cbSize, pbDataMarshal, pbData, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Retrieves information describing an audio data object.
     * @remarks
     * This method determines how much data the object currently contains as last set by <a href="https://docs.microsoft.com/windows/desktop/api/austream/nf-austream-imemorydata-setactual">SetActual</a>.
     * @param {Pointer<Integer>} pdwLength Length of memory in bytes, if non-<b>NULL</b>.
     * @param {Pointer<Pointer<Integer>>} ppbData Pointer to the memory, if non-<b>NULL</b>.
     * @param {Pointer<Integer>} pcbActualData Length of data in bytes, if non-<b>NULL</b>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/austream/nf-austream-imemorydata-getinfo
     */
    GetInfo(pdwLength, ppbData, pcbActualData) {
        pdwLengthMarshal := pdwLength is VarRef ? "uint*" : "ptr"
        ppbDataMarshal := ppbData is VarRef ? "ptr*" : "ptr"
        pcbActualDataMarshal := pcbActualData is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwLengthMarshal, pdwLength, ppbDataMarshal, ppbData, pcbActualDataMarshal, pcbActualData, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Sets the amount of audio data currently in the object.
     * @remarks
     * This method is usually called by the <a href="https://docs.microsoft.com/windows/desktop/api/austream/nn-austream-iaudiomediastream">IAudioMediaStream</a> or <a href="https://docs.microsoft.com/windows/desktop/api/austream/nn-austream-iaudiostreamsample">IAudioStreamSample</a> object, rather than by the application.
     * @param {Integer} cbDataValid Amount of data, in bytes.
     * @returns {HRESULT} Returns S_OK if successful or E_POINTER if the required parameter is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/austream/nf-austream-imemorydata-setactual
     */
    SetActual(cbDataValid) {
        result := ComCall(5, this, "uint", cbDataValid, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMemoryData.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetBuffer := CallbackCreate(GetMethod(implObj, "SetBuffer"), flags, 4)
        this.vtbl.GetInfo := CallbackCreate(GetMethod(implObj, "GetInfo"), flags, 4)
        this.vtbl.SetActual := CallbackCreate(GetMethod(implObj, "SetActual"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetBuffer)
        CallbackFree(this.vtbl.GetInfo)
        CallbackFree(this.vtbl.SetActual)
    }
}
