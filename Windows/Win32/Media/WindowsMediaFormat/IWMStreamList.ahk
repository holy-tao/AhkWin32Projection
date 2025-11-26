#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMStreamList interface is used by mutual exclusion objects and bandwidth sharing objects to maintain lists of streams.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmstreamlist
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMStreamList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMStreamList
     * @type {Guid}
     */
    static IID => Guid("{96406bdd-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreams", "AddStream", "RemoveStream"]

    /**
     * The GetStreams method retrieves an array of stream numbers that make up the list.
     * @param {Pointer<Integer>} pcStreams On input, a pointer to a variable containing the size of the <i>pwStreamNumArray</i> array. On output, if the method succeeds, this variable contains the number of stream numbers entered into <i>pwStreamNumArray</i> by the method.
     * @returns {Integer} Pointer to a <b>WORD</b> array containing the stream numbers. Pass <b>NULL</b> to retrieve the required size of the array.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmstreamlist-getstreams
     */
    GetStreams(pcStreams) {
        pcStreamsMarshal := pcStreams is VarRef ? "ushort*" : "ptr"

        result := ComCall(3, this, "ushort*", &pwStreamNumArray := 0, pcStreamsMarshal, pcStreams, "HRESULT")
        return pwStreamNumArray
    }

    /**
     * The AddStream method adds a stream to the list.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number. Stream numbers are in the range of 1 through 63.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
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
     * There is not enough available memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmstreamlist-addstream
     */
    AddStream(wStreamNum) {
        result := ComCall(4, this, "ushort", wStreamNum, "HRESULT")
        return result
    }

    /**
     * The RemoveStream method removes a stream from the list.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number. Stream numbers are in the range of 1 through 63.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_NOMATCHING_ELEMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>wStreamNum</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmstreamlist-removestream
     */
    RemoveStream(wStreamNum) {
        result := ComCall(5, this, "ushort", wStreamNum, "HRESULT")
        return result
    }
}
