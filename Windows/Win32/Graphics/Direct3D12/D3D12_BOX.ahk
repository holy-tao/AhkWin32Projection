#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a 3D box.
 * @remarks
 * This structure is used by the methods <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12resource-writetosubresource">WriteToSubresource</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12resource-readfromsubresource">ReadFromSubresource</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copytextureregion">CopyTextureRegion</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_box
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_BOX {
    #StructPack 4

    /**
     * The x position of the left hand side of the box.
     */
    left : UInt32

    /**
     * The y position of the top of the box.
     */
    top : UInt32

    /**
     * The z position of the front of the box.
     */
    front : UInt32

    /**
     * The x position of the right hand side of the box, plus 1. This means that <c>right - left</c> equals the width of the box.
     */
    right : UInt32

    /**
     * The y position of the bottom of the box, plus 1. This means that <c>bottom - top</c> equals the height of the box.
     */
    bottom : UInt32

    /**
     * The z position of the back of the box, plus 1. This means that <c>back - front</c> equals the depth of the box.
     */
    back : UInt32

}
