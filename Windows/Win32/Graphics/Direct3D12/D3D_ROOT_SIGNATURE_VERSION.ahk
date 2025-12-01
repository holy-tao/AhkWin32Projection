#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the version of root signature layout.
 * @remarks
 * This enum is used by the following structures and methods.
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_versioned_root_signature_desc">D3D12_VERSIONED_ROOT_SIGNATURE_DESC</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_feature_data_root_signature">D3D12_FEATURE_DATA_ROOT_SIGNATURE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12versionedrootsignaturedeserializer-getrootsignaturedescatversion">GetRootSignatureDescAtVersion</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-d3d12serializerootsignature">D3D12SerializeRootSignature</a>
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d_root_signature_version
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D_ROOT_SIGNATURE_VERSION extends Win32Enum{

    /**
     * Version one of root signature layout.
     * @type {Integer (Int32)}
     */
    static D3D_ROOT_SIGNATURE_VERSION_1 => 1

    /**
     * Version one of root signature layout.
     * @type {Integer (Int32)}
     */
    static D3D_ROOT_SIGNATURE_VERSION_1_0 => 1

    /**
     * Version 1.1  of root signature layout. Refer to <a href="https://docs.microsoft.com/windows/desktop/direct3d12/root-signature-version-1-1">Root Signature Version 1.1</a>.
     * @type {Integer (Int32)}
     */
    static D3D_ROOT_SIGNATURE_VERSION_1_1 => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D_ROOT_SIGNATURE_VERSION_1_2 => 3
}
