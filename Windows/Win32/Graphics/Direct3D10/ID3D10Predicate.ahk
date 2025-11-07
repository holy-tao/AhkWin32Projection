#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10Query.ahk

/**
 * A predicate interface determines whether geometry should be processed depending on the results of a previous draw call.
 * @remarks
 * 
 * A predicate can be created with <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createpredicate">ID3D10Device::CreatePredicate</a>, and used with <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-setpredication">ID3D10Device::SetPredication</a>.
 * 
 * There are two types of predicates in Direct3D 10: stream-output-overflow predicates and occlusion predicates. Stream-output-overflow predicates will cause any geometry residing in stream-output buffers that were overflowed to not be processed. Occlusion predicates will cause any geometry that did not have a single sample pass the depth/stencil tests to not be processed.
 * 
 * For an example of occlusion-predicated rendering, see <a href="https://msdn.microsoft.com/library/Ee416402(v=VS.85).aspx">Draw Predicated Sample</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/nn-d3d10-id3d10predicate
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10Predicate extends ID3D10Query{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10Predicate
     * @type {Guid}
     */
    static IID => Guid("{9b7e4c10-342c-4106-a19f-4f2704f689f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
