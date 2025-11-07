#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ALLOCATOR_PROPERTIES.ahk
#Include .\IMediaSample.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMemAllocator interface allocates media samples, for moving data between pins.This interface is used by pins that share allocators, when the input pin exposes the IMemInputPin interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-imemallocator
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMemAllocator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMemAllocator
     * @type {Guid}
     */
    static IID => Guid("{56a8689c-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetProperties", "GetProperties", "Commit", "Decommit", "GetBuffer", "ReleaseBuffer"]

    /**
     * 
     * @param {Pointer<ALLOCATOR_PROPERTIES>} pRequest 
     * @returns {ALLOCATOR_PROPERTIES} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imemallocator-setproperties
     */
    SetProperties(pRequest) {
        pActual := ALLOCATOR_PROPERTIES()
        result := ComCall(3, this, "ptr", pRequest, "ptr", pActual, "HRESULT")
        return pActual
    }

    /**
     * 
     * @returns {ALLOCATOR_PROPERTIES} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imemallocator-getproperties
     */
    GetProperties() {
        pProps := ALLOCATOR_PROPERTIES()
        result := ComCall(4, this, "ptr", pProps, "HRESULT")
        return pProps
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imemallocator-commit
     */
    Commit() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imemallocator-decommit
     */
    Decommit() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pStartTime 
     * @param {Pointer<Integer>} pEndTime 
     * @param {Integer} dwFlags 
     * @returns {IMediaSample} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imemallocator-getbuffer
     */
    GetBuffer(pStartTime, pEndTime, dwFlags) {
        pStartTimeMarshal := pStartTime is VarRef ? "int64*" : "ptr"
        pEndTimeMarshal := pEndTime is VarRef ? "int64*" : "ptr"

        result := ComCall(7, this, "ptr*", &ppBuffer := 0, pStartTimeMarshal, pStartTime, pEndTimeMarshal, pEndTime, "uint", dwFlags, "HRESULT")
        return IMediaSample(ppBuffer)
    }

    /**
     * 
     * @param {IMediaSample} pBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imemallocator-releasebuffer
     */
    ReleaseBuffer(pBuffer) {
        result := ComCall(8, this, "ptr", pBuffer, "HRESULT")
        return result
    }
}
