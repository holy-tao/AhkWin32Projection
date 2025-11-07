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
     * 
     * @param {Pointer<ALLOCATOR_PROPERTIES>} pAllocProperties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3ds/nf-tapi3ds-itallocatorproperties-setallocatorproperties
     */
    SetAllocatorProperties(pAllocProperties) {
        result := ComCall(3, this, "ptr", pAllocProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ALLOCATOR_PROPERTIES} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3ds/nf-tapi3ds-itallocatorproperties-getallocatorproperties
     */
    GetAllocatorProperties() {
        pAllocProperties := ALLOCATOR_PROPERTIES()
        result := ComCall(4, this, "ptr", pAllocProperties, "HRESULT")
        return pAllocProperties
    }

    /**
     * 
     * @param {BOOL} bAllocBuffers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3ds/nf-tapi3ds-itallocatorproperties-setallocatebuffers
     */
    SetAllocateBuffers(bAllocBuffers) {
        result := ComCall(5, this, "int", bAllocBuffers, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3ds/nf-tapi3ds-itallocatorproperties-getallocatebuffers
     */
    GetAllocateBuffers() {
        result := ComCall(6, this, "int*", &pbAllocBuffers := 0, "HRESULT")
        return pbAllocBuffers
    }

    /**
     * 
     * @param {Integer} BufferSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3ds/nf-tapi3ds-itallocatorproperties-setbuffersize
     */
    SetBufferSize(BufferSize) {
        result := ComCall(7, this, "uint", BufferSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3ds/nf-tapi3ds-itallocatorproperties-getbuffersize
     */
    GetBufferSize() {
        result := ComCall(8, this, "uint*", &pBufferSize := 0, "HRESULT")
        return pBufferSize
    }
}
