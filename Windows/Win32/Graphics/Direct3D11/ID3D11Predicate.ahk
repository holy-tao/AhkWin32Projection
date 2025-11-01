#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11Query.ahk

/**
 * A predicate interface determines whether geometry should be processed depending on the results of a previous draw call.
 * @remarks
 * 
  * To create a predicate object, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createpredicate">ID3D11Device::CreatePredicate</a>. To set the predicate object, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-setpredication">ID3D11DeviceContext::SetPredication</a>.
  * 
  * There are two types of predicates: stream-output-overflow predicates and occlusion predicates. Stream-output-overflow predicates cause any geometry residing in stream-output buffers that were overflowed to not be processed. Occlusion predicates cause any geometry that did not have a single sample pass the depth/stencil tests to not be processed.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/nn-d3d11-id3d11predicate
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Predicate extends ID3D11Query{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11Predicate
     * @type {Guid}
     */
    static IID => Guid("{9eb576dd-9f77-4d86-81aa-8bab5fe490e2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
