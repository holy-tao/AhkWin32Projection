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
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10asynchronous-begin
     */
    Begin() {
        ComCall(7, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10asynchronous-end
     */
    End() {
        ComCall(8, this)
    }

    /**
     * 
     * @param {Pointer} pData 
     * @param {Integer} DataSize 
     * @param {Integer} GetDataFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10asynchronous-getdata
     */
    GetData(pData, DataSize, GetDataFlags) {
        result := ComCall(9, this, "ptr", pData, "uint", DataSize, "uint", GetDataFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10asynchronous-getdatasize
     */
    GetDataSize() {
        result := ComCall(10, this, "uint")
        return result
    }
}
