#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Contains a method to return the deserialized D3D12_ROOT_SIGNATURE_DESC data structure, of a serialized root signature version 1.0.
 * @remarks
 * 
  * This interface has been superceded by <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12versionedrootsignaturedeserializer">ID3D12VersionedRootSignatureDeserializer</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12rootsignaturedeserializer
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12RootSignatureDeserializer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12RootSignatureDeserializer
     * @type {Guid}
     */
    static IID => Guid("{34ab647b-3cc8-46ac-841b-c0965645c046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRootSignatureDesc"]

    /**
     * 
     * @returns {Pointer<D3D12_ROOT_SIGNATURE_DESC>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12rootsignaturedeserializer-getrootsignaturedesc
     */
    GetRootSignatureDesc() {
        result := ComCall(3, this, "ptr")
        return result
    }
}
