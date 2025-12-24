#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMemAllocator.ahk
#Include .\ALLOCATOR_PROPERTIES.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMemInputPin interface delivers media data to an input pin.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-imeminputpin
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMemInputPin extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMemInputPin
     * @type {Guid}
     */
    static IID => Guid("{56a8689d-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAllocator", "NotifyAllocator", "GetAllocatorRequirements", "Receive", "ReceiveMultiple", "ReceiveCanBlock"]

    /**
     * The GetAllocator method retrieves the memory allocator proposed by this pin. After the allocator has been selected, this method returns a pointer to the selected allocator.
     * @returns {IMemAllocator} Receives a pointer to the allocator's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-imemallocator">IMemAllocator</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imeminputpin-getallocator
     */
    GetAllocator() {
        result := ComCall(3, this, "ptr*", &ppAllocator := 0, "HRESULT")
        return IMemAllocator(ppAllocator)
    }

    /**
     * The NotifyAllocator method specifies an allocator for the connection.
     * @param {IMemAllocator} pAllocator Pointer to the allocator's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-imemallocator">IMemAllocator</a> interface.
     * @param {BOOL} bReadOnly Flag that specifies whether samples from this allocator are read-only. If <b>TRUE</b>, samples are read-only.
     * @returns {HRESULT} Returns S_OK if successful, or an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imeminputpin-notifyallocator
     */
    NotifyAllocator(pAllocator, bReadOnly) {
        result := ComCall(4, this, "ptr", pAllocator, "int", bReadOnly, "HRESULT")
        return result
    }

    /**
     * The GetAllocatorRequirements method retrieves the allocator properties requested by the input pin.
     * @returns {ALLOCATOR_PROPERTIES} Pointer to an [ALLOCATOR_PROPERTIES](/windows/desktop/api/strmif/ns-strmif-allocator_properties), structure which is filled in with the requirements.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imeminputpin-getallocatorrequirements
     */
    GetAllocatorRequirements() {
        pProps := ALLOCATOR_PROPERTIES()
        result := ComCall(5, this, "ptr", pProps, "HRESULT")
        return pProps
    }

    /**
     * The Receive method receives the next media sample in the stream.
     * @param {IMediaSample} pSample Pointer to the sample's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-imediasample">IMediaSample</a> interface.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sample was rejected.
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
     * <dt><b>VFW_E_INVALIDMEDIATYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid media type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_RUNTIME_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A run-time error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pin is stopped.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imeminputpin-receive
     */
    Receive(pSample) {
        result := ComCall(6, this, "ptr", pSample, "HRESULT")
        return result
    }

    /**
     * The ReceiveMultiple method receives multiple samples in the stream.
     * @param {Pointer<IMediaSample>} pSamples Address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-imediasample">IMediaSample</a> interface pointers, of size <i>nSamples</i>.
     * @param {Integer} nSamples Number of samples to process.
     * @returns {Integer} Pointer to a variable that receives the number of samples that were processed.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imeminputpin-receivemultiple
     */
    ReceiveMultiple(pSamples, nSamples) {
        result := ComCall(7, this, "ptr*", pSamples, "int", nSamples, "int*", &nSamplesProcessed := 0, "HRESULT")
        return nSamplesProcessed
    }

    /**
     * The ReceiveCanBlock method determines whether calls to the IMemInputPin::Receive method might block.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pin will not block on a call to <b>Receive</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pin might block on a call to <b>Receive</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imeminputpin-receivecanblock
     */
    ReceiveCanBlock() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
