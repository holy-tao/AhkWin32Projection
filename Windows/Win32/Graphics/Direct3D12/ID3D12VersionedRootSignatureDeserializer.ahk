#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Contains methods to return the deserialized D3D12_ROOT_SIGNATURE_DESC1 data structure, of any version of a serialized root signature.
 * @remarks
 * 
  * This interface supercedes <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12rootsignaturedeserializer">ID3D12RootSignatureDeserializer</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12versionedrootsignaturedeserializer
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12VersionedRootSignatureDeserializer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VersionedRootSignatureDeserializer
     * @type {Guid}
     */
    static IID => Guid("{7f91ce67-090c-4bb7-b78e-ed8ff2e31da0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRootSignatureDescAtVersion", "GetUnconvertedRootSignatureDesc"]

    /**
     * 
     * @param {Integer} convertToVersion 
     * @param {Pointer<Pointer<D3D12_VERSIONED_ROOT_SIGNATURE_DESC>>} ppDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12versionedrootsignaturedeserializer-getrootsignaturedescatversion
     */
    GetRootSignatureDescAtVersion(convertToVersion, ppDesc) {
        ppDescMarshal := ppDesc is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "int", convertToVersion, ppDescMarshal, ppDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<D3D12_VERSIONED_ROOT_SIGNATURE_DESC>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12versionedrootsignaturedeserializer-getunconvertedrootsignaturedesc
     */
    GetUnconvertedRootSignatureDesc() {
        result := ComCall(4, this, "ptr")
        return result
    }
}
