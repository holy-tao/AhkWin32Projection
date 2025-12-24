#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITSubStream.ahk
#Include .\IEnumSubStream.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITSubStreamControl interface exposes methods that allow an application to enumerate, create, or remove substreams. Many MSPs do not support this interface.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itsubstreamcontrol
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITSubStreamControl extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITSubStreamControl
     * @type {Guid}
     */
    static IID => Guid("{ee3bd607-3868-11d2-a045-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSubStream", "RemoveSubStream", "EnumerateSubStreams", "get_SubStreams"]

    /**
     * @type {VARIANT} 
     */
    SubStreams {
        get => this.get_SubStreams()
    }

    /**
     * The CreateSubStream method creates a substream.
     * @returns {ITSubStream} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itsubstream">ITSubStream</a> interface created.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itsubstreamcontrol-createsubstream
     */
    CreateSubStream() {
        result := ComCall(7, this, "ptr*", &ppSubStream := 0, "HRESULT")
        return ITSubStream(ppSubStream)
    }

    /**
     * The RemoveSubStream method removes a substream.
     * @param {ITSubStream} pSubStream Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itsubstream">ITSubStream</a> to be removed.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pSubStream</i> parameter does not point to a valid interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_INVALIDSTREAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pSubStream</i> parameter does not point to a valid substream.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itsubstreamcontrol-removesubstream
     */
    RemoveSubStream(pSubStream) {
        result := ComCall(8, this, "ptr", pSubStream, "HRESULT")
        return result
    }

    /**
     * The EnumerateSubStreams method enumerates currently available media substreams. Provided for C and C++ applications. Automation client applications such as Visual Basic must use the get_SubStreams method.
     * @returns {IEnumSubStream} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumsubstream">IEnumSubStream</a> enumeration of substreams.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itsubstreamcontrol-enumeratesubstreams
     */
    EnumerateSubStreams() {
        result := ComCall(9, this, "ptr*", &ppEnumSubStream := 0, "HRESULT")
        return IEnumSubStream(ppEnumSubStream)
    }

    /**
     * The get_SubStreams method creates a collection of substreams currently available. Provided for Automation client applications, such as those written in Visual Basic. C and C++ applications must use the EnumerateSubStreams method.
     * @returns {VARIANT} Pointer to <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itsubstream">ITSubStream</a> interface pointers.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itsubstreamcontrol-get_substreams
     */
    get_SubStreams() {
        pVariant := VARIANT()
        result := ComCall(10, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }
}
