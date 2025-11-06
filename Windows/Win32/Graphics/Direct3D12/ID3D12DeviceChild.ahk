#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Object.ahk

/**
 * An interface from which other core interfaces inherit from, including (but not limited to) ID3D12PipelineLibrary, ID3D12CommandList, ID3D12Pageable, and ID3D12RootSignature. It provides a method to get back to the device object it was created against.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12devicechild
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12DeviceChild extends ID3D12Object{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12DeviceChild
     * @type {Guid}
     */
    static IID => Guid("{905db94b-a00c-4140-9df5-2b64ca9ea357}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDevice"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12devicechild-getdevice
     */
    GetDevice(riid) {
        result := ComCall(7, this, "ptr", riid, "ptr*", &ppvDevice := 0, "HRESULT")
        return ppvDevice
    }
}
