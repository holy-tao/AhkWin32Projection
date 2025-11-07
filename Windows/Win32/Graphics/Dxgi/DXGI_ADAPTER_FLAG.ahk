#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies the type of DXGI adapter.
 * @remarks
 * 
 * The <b>DXGI_ADAPTER_FLAG</b> enumerated type is used by the <b>Flags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_adapter_desc1">DXGI_ADAPTER_DESC1</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_adapter_desc2">DXGI_ADAPTER_DESC2</a> structure to 
 *       identify the type of DXGI adapter.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi/ne-dxgi-dxgi_adapter_flag
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_ADAPTER_FLAG{

    /**
     * Specifies no flags.
     * @type {Integer (Int32)}
     */
    static DXGI_ADAPTER_FLAG_NONE => 0

    /**
     * Value always set to 0. This flag is reserved.
     * @type {Integer (Int32)}
     */
    static DXGI_ADAPTER_FLAG_REMOTE => 1

    /**
     * Specifies a software adapter. For more info about this flag, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/d3d10-graphics-programming-guide-dxgi">new info in Windows 8 about enumerating adapters</a>.
 * 
 * <b>Direct3D 11:  </b>This enumeration value is supported starting with Windows 8.
     * @type {Integer (Int32)}
     */
    static DXGI_ADAPTER_FLAG_SOFTWARE => 2
}
