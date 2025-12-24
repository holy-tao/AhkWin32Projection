#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface is no longer supported by the AVI Splitter. Note  It was defined to support certain older hardware decoders that required AVI files to be read directly into hardware memory.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamdevmemorycontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMDevMemoryControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMDevMemoryControl
     * @type {Guid}
     */
    static IID => Guid("{c6545bf1-e76b-11d0-bd52-00a0c911ce86}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryWriteSync", "WriteSync", "GetDevId"]

    /**
     * Note  The IAMDevMemoryControl interface is deprecated. Checks if the memory supported by the allocator requires the use of the IAMDevMemoryControl::WriteSync method.
     * @returns {HRESULT} Returns S_OK if the method is required, or S_FALSE otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamdevmemorycontrol-querywritesync
     */
    QueryWriteSync() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Note  The IAMDevMemoryControl interface is deprecated. Used to synchronize with the completed write. This method returns when any data being written to the particular allocator region is fully written into the memory.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A time-out has occurred without this method confirming that data was written.
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
     * The data was successfully written into memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_COMMITTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The allocator hasn't called the <a href="/windows/desktop/api/strmif/nf-strmif-imemallocator-commit">IMemAllocator::Commit</a> method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamdevmemorycontrol-writesync
     */
    WriteSync() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Note  The IAMDevMemoryControl interface is deprecated. Retrieves the device ID of the on-board memory allocator.
     * @returns {Integer} Pointer to the device ID.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamdevmemorycontrol-getdevid
     */
    GetDevId() {
        result := ComCall(5, this, "uint*", &pdwDevId := 0, "HRESULT")
        return pdwDevId
    }
}
