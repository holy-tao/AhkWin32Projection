#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ALLOCATOR_PROPERTIES.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMBufferNegotiation interface requests the number of buffers for a filter to create and size of each buffer.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iambuffernegotiation
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMBufferNegotiation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMBufferNegotiation
     * @type {Guid}
     */
    static IID => Guid("{56ed71a0-af5f-11d0-b3f0-00aa003761c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SuggestAllocatorProperties", "GetAllocatorProperties"]

    /**
     * 
     * @param {Pointer<ALLOCATOR_PROPERTIES>} pprop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iambuffernegotiation-suggestallocatorproperties
     */
    SuggestAllocatorProperties(pprop) {
        result := ComCall(3, this, "ptr", pprop, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ALLOCATOR_PROPERTIES} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iambuffernegotiation-getallocatorproperties
     */
    GetAllocatorProperties() {
        pprop := ALLOCATOR_PROPERTIES()
        result := ComCall(4, this, "ptr", pprop, "HRESULT")
        return pprop
    }
}
