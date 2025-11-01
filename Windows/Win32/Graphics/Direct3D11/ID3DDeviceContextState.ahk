#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11DeviceChild.ahk

/**
 * The ID3DDeviceContextState interface represents a context state object, which holds state and behavior information about a Microsoft Direct3D device.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nn-d3d11_1-id3ddevicecontextstate
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3DDeviceContextState extends ID3D11DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3DDeviceContextState
     * @type {Guid}
     */
    static IID => Guid("{5c1e0d8a-7c23-48f9-8c59-a92958ceff11}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
