#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ALLOCATOR_PROPERTIES.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMBufferNegotiation interface requests the number of buffers for a filter to create and size of each buffer.
 * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nn-strmif-iambuffernegotiation
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
     * The SuggestAllocatorProperties method informs the pin of the application's preferred allocator properties. Call this method before the pin connects.
     * @remarks
     * If both pins in the connection expose the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iambuffernegotiation">IAMBufferNegotiation</a> interface, call this method on each pin, to ensure that one pin does not override the other.
     * 
     * To request a particular number of buffers, set the <b>cBuffers</b> member of the <b>ALLOCATOR_PROPERTIES</b> structure. To request a particular buffer size, set the <b>cbBuffer</b> member. An application typically should not specify the alignment or prefix. If the number of buffers or size of each buffer is too small, the filter graph might drop samples.
     * @param {Pointer<ALLOCATOR_PROPERTIES>} pprop Pointer to an [ALLOCATOR_PROPERTIES](/windows/desktop/api/strmif/ns-strmif-allocator_properties) structure that contains the requested properties. A negative value for any member indicates that the pin should use its default setting for that property.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_ALREADY_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pin is already connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-iambuffernegotiation-suggestallocatorproperties
     */
    SuggestAllocatorProperties(pprop) {
        result := ComCall(3, this, "ptr", pprop, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetAllocatorProperties method retrieves the allocator properties that the pin is using.
     * @remarks
     * Call this method after the pins connect, to find out the allocator properties that were chosen.
     * @returns {ALLOCATOR_PROPERTIES} Pointer to an [ALLOCATOR_PROPERTIES](/windows/desktop/api/strmif/ns-strmif-allocator_properties) structure, allocated by the caller, that receives the allocator properties.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-iambuffernegotiation-getallocatorproperties
     */
    GetAllocatorProperties() {
        pprop := ALLOCATOR_PROPERTIES()
        result := ComCall(4, this, "ptr", pprop, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pprop
    }
}
