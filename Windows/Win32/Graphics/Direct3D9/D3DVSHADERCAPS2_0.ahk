#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Vertex shader caps.
 * @see https://learn.microsoft.com/windows/win32/api/d3d9caps/ns-d3d9caps-d3dvshadercaps2_0
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DVSHADERCAPS2_0 {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Instruction predication is supported if this value is nonzero. See <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/setp-comp---vs">setp_comp - vs</a>.
     */
    Caps : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     *  Either 0 or 24, which represents the depth of the dynamic flow control instruction nesting. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dvs20caps">D3DVS20CAPS</a>.
     */
    DynamicFlowControlDepth : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * The number of temporary registers supported. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dvs20caps">D3DVS20CAPS</a>.
     */
    NumTemps : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * The depth of nesting of the <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/loop---vs">loop - vs</a>/<a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/rep---vs">rep - vs</a> and <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/call---vs">call - vs</a>/<a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/callnz-bool---vs">callnz bool - vs</a> instructions. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dvs20caps">D3DVS20CAPS</a>.
     */
    StaticFlowControlDepth : Int32

}
