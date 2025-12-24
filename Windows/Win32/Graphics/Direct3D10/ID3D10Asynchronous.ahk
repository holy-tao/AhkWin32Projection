#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10DeviceChild.ahk

/**
 * This interface encapsulates methods for retrieving data from the GPU asynchronously.
 * @remarks
 * 
 * There are three types of asynchronous interfaces, all of which inherit this interface:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10query">ID3D10Query Interface</a> - Queries information from the GPU.</li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10predicate">ID3D10Predicate Interface</a> - Determines whether a piece of geometry should be processed or not depending on the results of a previous draw call.</li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10counter">ID3D10Counter Interface</a> - Measures GPU performance.</li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/nn-d3d10-id3d10asynchronous
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10Asynchronous extends ID3D10DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10Asynchronous
     * @type {Guid}
     */
    static IID => Guid("{9b7e4c0d-342c-4106-a19f-4f2704f689f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Begin", "End", "GetData", "GetDataSize"]

    /**
     * Starts the collection of GPU data.
     * @remarks
     * 
     * Calling Begin starts the asynchronous collection of GPU data. Calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-end">ID3D10Asynchronous::End</a> causes data collection to stop.  
     *   See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10asynchronous">ID3D10Asynchronous Interface</a> for additional information.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10asynchronous-begin
     */
    Begin() {
        ComCall(7, this)
    }

    /**
     * Ends the collection of GPU data.
     * @remarks
     * 
     * Calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-begin">ID3D10Asynchronous::Begin</a> starts the asynchronous collection of GPU data. Calling <b>ID3D10Asynchronous::End</b> causes data 
     *       collection to stop. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10asynchronous">ID3D10Asynchronous Interface</a> for additional information.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10asynchronous-end
     */
    End() {
        ComCall(8, this)
    }

    /**
     * Get data from the GPU asynchronously.
     * @param {Pointer} pData Type: <b>void*</b>
     * 
     * Address of memory that will receive the data. If <b>NULL</b>, <b>GetData</b> will be used only to check status. The type of data output depends on the type of asynchronous interface. See Remarks.
     * @param {Integer} DataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the data to retrieve or 0. This value can be obtained with <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-getdatasize">ID3D10Asynchronous::GetDataSize</a>. Must be 0 when <i>pData</i> is <b>NULL</b>.
     * @param {Integer} GetDataFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Optional flags. Can be 0 or any combination of the flags enumerated by
     *             <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_async_getdata_flag">D3D10_ASYNC_GETDATA_FLAG</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this function succeeds, it returns S_OK. Otherwise, possible 
     *           return values are the following:
     * 
     * <ul>
     * <li>S_FALSE</li>
     * <li>DXGI_ERROR_DEVICE_REMOVED</li>
     * <li>DXGI_ERROR_INVALID_CALL</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10asynchronous-getdata
     */
    GetData(pData, DataSize, GetDataFlags) {
        result := ComCall(9, this, "ptr", pData, "uint", DataSize, "uint", GetDataFlags, "HRESULT")
        return result
    }

    /**
     * Get the size of the data (in bytes) that is output when calling ID3D10Asynchronous::GetData.
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the data (in bytes) that is output when calling GetData.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10asynchronous-getdatasize
     */
    GetDataSize() {
        result := ComCall(10, this, "uint")
        return result
    }
}
