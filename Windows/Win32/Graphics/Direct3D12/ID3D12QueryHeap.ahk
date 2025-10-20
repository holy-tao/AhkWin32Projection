#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Pageable.ahk

/**
 * Manages a query heap. A query heap holds an array of queries, referenced by indexes.
 * @remarks
 * 
  * For more information, refer to <a href="https://docs.microsoft.com/windows/desktop/direct3d12/queries">Queries</a>.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12queryheap
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12QueryHeap extends ID3D12Pageable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12QueryHeap
     * @type {Guid}
     */
    static IID => Guid("{0d9658ae-ed45-469e-a61d-970ec583cab4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
