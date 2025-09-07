#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the header metadata type.
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_5/nf-dxgi1_5-idxgiswapchain4-sethdrmetadata">SetHDRMetaData</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_5/ne-dxgi1_5-dxgi_hdr_metadata_type
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_HDR_METADATA_TYPE{

    /**
     * Indicates there is no header metadata.
     * @type {Integer (Int32)}
     */
    static DXGI_HDR_METADATA_TYPE_NONE => 0

    /**
     * Indicates the header metadata is held by a  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_5/ns-dxgi1_5-dxgi_hdr_metadata_hdr10">DXGI_HDR_METADATA_HDR10</a> structure.
     * @type {Integer (Int32)}
     */
    static DXGI_HDR_METADATA_TYPE_HDR10 => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DXGI_HDR_METADATA_TYPE_HDR10PLUS => 2
}
