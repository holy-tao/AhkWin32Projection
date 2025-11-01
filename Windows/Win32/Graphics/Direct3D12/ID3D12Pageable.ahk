#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12DeviceChild.ahk

/**
 * An interface from which many other core interfaces inherit from. It indicates that the object type encapsulates some amount of GPU-accessible memory; but does not strongly indicate whether the application can manipulate the object's residency.
 * @remarks
 * 
  * For more details, refer to <a href="https://docs.microsoft.com/windows/desktop/direct3d12/memory-management">Memory Management in Direct3D 12</a> and the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-makeresident">MakeResident</a> method reference.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12pageable
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Pageable extends ID3D12DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Pageable
     * @type {Guid}
     */
    static IID => Guid("{63ee58fb-1268-4835-86da-f008ce62f0d6}")

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
