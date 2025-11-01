#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12DeviceChild.ahk

/**
 * The root signature defines what resources are bound to the graphics pipeline. A root signature is configured by the app and links command lists to the resources the shaders require. Currently, there is one graphics and one compute root signature per app.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12rootsignature
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12RootSignature extends ID3D12DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12RootSignature
     * @type {Guid}
     */
    static IID => Guid("{c54a6b66-72df-4ee8-8be5-a946a1429214}")

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
