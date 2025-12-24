#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPacketSize interface controls the maximum size of packets in an ASF file.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmpacketsize
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMPacketSize extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPacketSize
     * @type {Guid}
     */
    static IID => Guid("{cdfb97ab-188f-40b3-b643-5b7903975c59}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMaxPacketSize", "SetMaxPacketSize"]

    /**
     * The GetMaxPacketSize method retrieves the maximum size of a packet in an ASF file.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the maximum packet size, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmpacketsize-getmaxpacketsize
     */
    GetMaxPacketSize() {
        result := ComCall(3, this, "uint*", &pdwMaxPacketSize := 0, "HRESULT")
        return pdwMaxPacketSize
    }

    /**
     * The SetMaxPacketSize method specifies the maximum size of a packet in an ASF file.
     * @param {Integer} dwMaxPacketSize <b>DWORD</b> containing the maximum packet size, in bytes. Set this to zero if the writer is to generate packets of various sizes. Otherwise, it must be a value between 100 bytes and 64 kilobytes.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwMaxPacketSize</i> parameter contains an invalid value for the maximum packet size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmpacketsize-setmaxpacketsize
     */
    SetMaxPacketSize(dwMaxPacketSize) {
        result := ComCall(4, this, "uint", dwMaxPacketSize, "HRESULT")
        return result
    }
}
