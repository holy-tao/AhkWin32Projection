#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11DeviceChild.ahk

/**
 * This interface encapsulates methods for retrieving data from the GPU asynchronously.
 * @remarks
 * 
  * There are three types of asynchronous interfaces, all of which inherit this interface:
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11query">ID3D11Query</a> - Queries information from the GPU.</li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11predicate">ID3D11Predicate</a> - Determines whether a piece of geometry should be processed or not depending on the results of a previous draw call.</li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11counter">ID3D11Counter</a> - Measures GPU performance.</li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/nn-d3d11-id3d11asynchronous
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Asynchronous extends ID3D11DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11Asynchronous
     * @type {Guid}
     */
    static IID => Guid("{4b35d0cd-1e15-4258-9c98-1b1333f6dd3b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDataSize"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11asynchronous-getdatasize
     */
    GetDataSize() {
        result := ComCall(7, this, "uint")
        return result
    }
}
