#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Media\DirectShow\ALLOCATOR_PROPERTIES.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITAllocatorProperties interface exposes the buffer allocator properties of the Media Streaming Terminal (MST) to an end-user or server application.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3ds/nn-tapi3ds-itallocatorproperties
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITAllocatorProperties extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITAllocatorProperties
     * @type {Guid}
     */
    static IID => Guid("{c1bc3c90-bcfe-11d1-9745-00c04fd91ac0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAllocatorProperties", "GetAllocatorProperties", "SetAllocateBuffers", "GetAllocateBuffers", "SetBufferSize", "GetBufferSize"]

    /**
     * The SetAllocatorProperties method must be called before connection and will force the MSP to use these values during filter negotiation. If the connecting filter doesn't accept these values, the connection is not established.
     * @param {Pointer<ALLOCATOR_PROPERTIES>} pAllocProperties Pointer to the allocator buffer.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an error value.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3ds/nf-tapi3ds-itallocatorproperties-setallocatorproperties
     */
    SetAllocatorProperties(pAllocProperties) {
        result := ComCall(3, this, "ptr", pAllocProperties, "HRESULT")
        return result
    }

    /**
     * The GetAllocatorProperties method gets the current values for the allocator properties after connection and provides the negotiated values. This method is invalid before connection. The MST will accept any values suggested by the connected filters.
     * @returns {ALLOCATOR_PROPERTIES} Pointer to current allocator values.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3ds/nf-tapi3ds-itallocatorproperties-getallocatorproperties
     */
    GetAllocatorProperties() {
        pAllocProperties := ALLOCATOR_PROPERTIES()
        result := ComCall(4, this, "ptr", pAllocProperties, "HRESULT")
        return pAllocProperties
    }

    /**
     * The SetAllocateBuffers method determines whether the current allocator buffers must be set.
     * @param {BOOL} bAllocBuffers Boolean indicator of whether allocator buffers must be set.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an error value.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3ds/nf-tapi3ds-itallocatorproperties-setallocatebuffers
     */
    SetAllocateBuffers(bAllocBuffers) {
        result := ComCall(5, this, "int", bAllocBuffers, "HRESULT")
        return result
    }

    /**
     * The GetAllocateBuffers method determines whether the current allocator buffers can be retrieved. If it returns FALSE, the sample that the MST allocated doesn't have any buffers and they must be supplied before Update is called on the samples.
     * @returns {BOOL} Indicates whether allocator buffers have been set.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3ds/nf-tapi3ds-itallocatorproperties-getallocatebuffers
     */
    GetAllocateBuffers() {
        result := ComCall(6, this, "int*", &pbAllocBuffers := 0, "HRESULT")
        return pbAllocBuffers
    }

    /**
     * The SetBufferSize method sets the size of the allocator buffer.
     * @param {Integer} BufferSize Size of the allocator buffer.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an error value.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3ds/nf-tapi3ds-itallocatorproperties-setbuffersize
     */
    SetBufferSize(BufferSize) {
        result := ComCall(7, this, "uint", BufferSize, "HRESULT")
        return result
    }

    /**
     * The GetBufferSize method gets the size of the allocator buffer.
     * @returns {Integer} Size of current allocator buffer.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3ds/nf-tapi3ds-itallocatorproperties-getbuffersize
     */
    GetBufferSize() {
        result := ComCall(8, this, "uint*", &pBufferSize := 0, "HRESULT")
        return pBufferSize
    }
}
