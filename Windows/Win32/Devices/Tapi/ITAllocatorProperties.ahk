#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Media\DirectShow\ALLOCATOR_PROPERTIES.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITAllocatorProperties interface (tapi3ds.h) exposes the buffer allocator properties of the Media Streaming Terminal (MST) to an end-user or server application.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3ds/nn-tapi3ds-itallocatorproperties
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
        result := ComCall(3, this, "ptr", pAllocProperties, "HRESULT")
        return result
    }

    /**
     * The GetAllocatorProperties method (tapi3ds.h) gets the current values for the allocator properties after connection and provides the negotiated values.
     * @returns {ALLOCATOR_PROPERTIES} Pointer to current allocator values.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3ds/nf-tapi3ds-itallocatorproperties-getallocatorproperties
     */
    GetAllocatorProperties() {
        pAllocProperties := ALLOCATOR_PROPERTIES()
        result := ComCall(4, this, "ptr", pAllocProperties, "HRESULT")
        return pAllocProperties
    }

    /**
     * The ITAllocatorProperties::SetAllocateBuffers method (tapi3ds.h) determines whether the current allocator buffers must be set.
     * @param {BOOL} bAllocBuffers Boolean indicator of whether allocator buffers must be set.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an error value.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3ds/nf-tapi3ds-itallocatorproperties-setallocatebuffers
     */
    SetAllocateBuffers(bAllocBuffers) {
        result := ComCall(5, this, "int", bAllocBuffers, "HRESULT")
        return result
    }

    /**
     * The ITAllocatorProperties::GetAllocateBuffers method (tapi3ds.h) determines whether the current allocator buffers can be retrieved.
     * @returns {BOOL} Indicates whether allocator buffers have been set.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3ds/nf-tapi3ds-itallocatorproperties-getallocatebuffers
     */
    GetAllocateBuffers() {
        result := ComCall(6, this, "int*", &pbAllocBuffers := 0, "HRESULT")
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
}
