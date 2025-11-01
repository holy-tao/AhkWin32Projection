#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11Asynchronous.ahk

/**
 * This interface encapsulates methods for measuring GPU performance.
 * @remarks
 * 
  * A counter can be created with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createcounter">ID3D11Device::CreateCounter</a>.
  * 
  * This is a derived class of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11asynchronous">ID3D11Asynchronous</a>.
  * 
  * Counter data is gathered by issuing an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-begin">ID3D11DeviceContext::Begin</a> command, issuing some graphics commands, issuing an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-end">ID3D11DeviceContext::End</a> command, and then calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getdata">ID3D11DeviceContext::GetData</a> to get data about what happened in between the Begin and End calls. The data returned by GetData will be different depending on the type of counter. The call to End causes the data returned by GetData to be accurate up until the last call to End.
  * 
  * Counters are best suited for profiling.
  * 
  * For a list of the types of performance counters, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_counter">D3D11_COUNTER</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/nn-d3d11-id3d11counter
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Counter extends ID3D11Asynchronous{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11Counter
     * @type {Guid}
     */
    static IID => Guid("{6e8c49fb-a371-4770-b440-29086022b741}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc"]

    /**
     * 
     * @param {Pointer<D3D11_COUNTER_DESC>} pDesc 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11counter-getdesc
     */
    GetDesc(pDesc) {
        ComCall(8, this, "ptr", pDesc)
    }
}
