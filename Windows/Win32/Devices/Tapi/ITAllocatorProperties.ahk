#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Media\DirectShow\ALLOCATOR_PROPERTIES.ahk" { ALLOCATOR_PROPERTIES }

/**
 * The ITAllocatorProperties interface (tapi3ds.h) exposes the buffer allocator properties of the Media Streaming Terminal (MST) to an end-user or server application.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3ds/nn-tapi3ds-itallocatorproperties
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITAllocatorProperties extends IUnknown {
    /**
     * The interface identifier for ITAllocatorProperties
     * @type {Guid}
     */
    static IID := Guid("{c1bc3c90-bcfe-11d1-9745-00c04fd91ac0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITAllocatorProperties interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetAllocatorProperties : IntPtr
        GetAllocatorProperties : IntPtr
        SetAllocateBuffers     : IntPtr
        GetAllocateBuffers     : IntPtr
        SetBufferSize          : IntPtr
        GetBufferSize          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITAllocatorProperties.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The ITAllocatorProperties::SetAllocatorProperties method (tapi3ds.h) forces the MSP to use entered values during filter negotiation.
     * @remarks
     * <b>This method should be used with extreme care.</b> The quality of the sound may suffer if the values entered for this method are not optimal for the MSP. Therefore, the application should know exactly the properties preferred by the MSP before calling this method. Under Windows 2000, properties entered during calls to this method are ignored if they are not optimal. Under Windows XP, these values are not ignored and the application must be more knowledgeable.
     * 
     * If the application is only concerned with setting consistent buffer sizes, the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nf-tapi3-itallocatorproperties-setbuffersize">ITAllocatorProperties::SetBufferSize</a> method should be used instead. This guarantees the application is provided with the specified buffer size.
     * @param {Pointer<ALLOCATOR_PROPERTIES>} pAllocProperties Pointer to the allocator buffer.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an error value.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3ds/nf-tapi3ds-itallocatorproperties-setallocatorproperties
     */
    SetAllocatorProperties(pAllocProperties) {
        result := ComCall(3, this, ALLOCATOR_PROPERTIES.Ptr, pAllocProperties, "HRESULT")
        return result
    }

    /**
     * The GetAllocatorProperties method (tapi3ds.h) gets the current values for the allocator properties after connection and provides the negotiated values.
     * @returns {ALLOCATOR_PROPERTIES} Pointer to current allocator values.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3ds/nf-tapi3ds-itallocatorproperties-getallocatorproperties
     */
    GetAllocatorProperties() {
        pAllocProperties := ALLOCATOR_PROPERTIES()
        result := ComCall(4, this, ALLOCATOR_PROPERTIES.Ptr, pAllocProperties, "HRESULT")
        return pAllocProperties
    }

    /**
     * The ITAllocatorProperties::SetAllocateBuffers method (tapi3ds.h) determines whether the current allocator buffers must be set.
     * @param {BOOL} bAllocBuffers Boolean indicator of whether allocator buffers must be set.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an error value.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3ds/nf-tapi3ds-itallocatorproperties-setallocatebuffers
     */
    SetAllocateBuffers(bAllocBuffers) {
        result := ComCall(5, this, BOOL, bAllocBuffers, "HRESULT")
        return result
    }

    /**
     * The ITAllocatorProperties::GetAllocateBuffers method (tapi3ds.h) determines whether the current allocator buffers can be retrieved.
     * @returns {BOOL} Indicates whether allocator buffers have been set.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3ds/nf-tapi3ds-itallocatorproperties-getallocatebuffers
     */
    GetAllocateBuffers() {
        result := ComCall(6, this, BOOL.Ptr, &pbAllocBuffers := 0, "HRESULT")
        return pbAllocBuffers
    }

    /**
     * The ITAllocatorProperties::SetBufferSize method (tapi3ds.h) sets the size of the allocator buffer.
     * @param {Integer} BufferSize Size of the allocator buffer.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an error value.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3ds/nf-tapi3ds-itallocatorproperties-setbuffersize
     */
    SetBufferSize(BufferSize) {
        result := ComCall(7, this, "uint", BufferSize, "HRESULT")
        return result
    }

    /**
     * The ITAllocatorProperties::GetBufferSize method (tapi3ds.h) gets the size of the allocator buffer.
     * @returns {Integer} Size of current allocator buffer.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3ds/nf-tapi3ds-itallocatorproperties-getbuffersize
     */
    GetBufferSize() {
        result := ComCall(8, this, "uint*", &pBufferSize := 0, "HRESULT")
        return pBufferSize
    }

    Query(iid) {
        if (ITAllocatorProperties.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAllocatorProperties := CallbackCreate(GetMethod(implObj, "SetAllocatorProperties"), flags, 2)
        this.vtbl.GetAllocatorProperties := CallbackCreate(GetMethod(implObj, "GetAllocatorProperties"), flags, 2)
        this.vtbl.SetAllocateBuffers := CallbackCreate(GetMethod(implObj, "SetAllocateBuffers"), flags, 2)
        this.vtbl.GetAllocateBuffers := CallbackCreate(GetMethod(implObj, "GetAllocateBuffers"), flags, 2)
        this.vtbl.SetBufferSize := CallbackCreate(GetMethod(implObj, "SetBufferSize"), flags, 2)
        this.vtbl.GetBufferSize := CallbackCreate(GetMethod(implObj, "GetBufferSize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAllocatorProperties)
        CallbackFree(this.vtbl.GetAllocatorProperties)
        CallbackFree(this.vtbl.SetAllocateBuffers)
        CallbackFree(this.vtbl.GetAllocateBuffers)
        CallbackFree(this.vtbl.SetBufferSize)
        CallbackFree(this.vtbl.GetBufferSize)
    }
}
