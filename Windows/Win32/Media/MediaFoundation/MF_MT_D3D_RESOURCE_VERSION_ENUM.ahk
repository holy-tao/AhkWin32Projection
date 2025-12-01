#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the Direct3D version of the resource used in the stream associated with a media type.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/mfd3d12/ne-mfd3d12-mf_mt_d3d_resource_version_enum
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_MT_D3D_RESOURCE_VERSION_ENUM extends Win32Enum{

    /**
     * The version is Direct3D 11.
     * @type {Integer (Int32)}
     */
    static MF_D3D11_RESOURCE => 0

    /**
     * The version is Direct3D 12.
     * @type {Integer (Int32)}
     */
    static MF_D3D12_RESOURCE => 1
}
