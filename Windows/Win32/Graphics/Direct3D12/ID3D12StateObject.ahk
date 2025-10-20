#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Pageable.ahk

/**
 * Represents a variable amount of configuration state, including shaders, that an application manages as a single unit and which is given to a driver atomically to process, such as compile or optimize.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12stateobject
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12StateObject extends ID3D12Pageable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12StateObject
     * @type {Guid}
     */
    static IID => Guid("{47016943-fca8-4594-93ea-af258b55346d}")

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
