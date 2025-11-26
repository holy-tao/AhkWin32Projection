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
     * Converts root signature description structures to a requested version.
     * @param {Integer} convertToVersion Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d_root_signature_version">D3D_ROOT_SIGNATURE_VERSION</a></b>
     * 
     * Specifies the required <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d_root_signature_version">D3D_ROOT_SIGNATURE_VERSION</a>.
     * @returns {Pointer<D3D12_VERSIONED_ROOT_SIGNATURE_DESC>} Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_versioned_root_signature_desc">D3D12_VERSIONED_ROOT_SIGNATURE_DESC</a>**</b>
     * 
     * Contains the deserialized root signature in a  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_versioned_root_signature_desc">D3D12_VERSIONED_ROOT_SIGNATURE_DESC</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12versionedrootsignaturedeserializer-getrootsignaturedescatversion
     */
    GetRootSignatureDescAtVersion(convertToVersion) {
        result := ComCall(3, this, "int", convertToVersion, "ptr*", &ppDesc := 0, "HRESULT")
        return ppDesc
    }

    /**
     * Gets the layout of the root signature, without converting between root signature versions.
     * @returns {Pointer<D3D12_VERSIONED_ROOT_SIGNATURE_DESC>} Type: <b><a href="/windows/desktop/api/d3d12/ns-d3d12-d3d12_versioned_root_signature_desc">D3D12_VERSIONED_ROOT_SIGNATURE_DESC</a></b>
     * 
     * This method returns a deserialized root signature in a <a href="/windows/desktop/api/d3d12/ns-d3d12-d3d12_versioned_root_signature_desc">D3D12_VERSIONED_ROOT_SIGNATURE_DESC</a> structure that describes the layout of the root signature.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12versionedrootsignaturedeserializer-getunconvertedrootsignaturedesc
     */
    GetUnconvertedRootSignatureDesc() {
        result := ComCall(4, this, "ptr")
        return result
    }
}
