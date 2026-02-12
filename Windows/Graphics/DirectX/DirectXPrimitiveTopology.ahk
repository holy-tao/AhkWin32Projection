#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Values that indicate how the pipeline interprets vertex data that is bound to the input-assembler stage. These primitive topology values determine how the vertex data is rendered on screen. This is a Windows Runtime equivalent of the [D3D_PRIMITIVE_TOPOLOGY](/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_primitive_topology) enumeration.
 * @remarks
 * Refer to [D3D_PRIMITIVE_TOPOLOGY](/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_primitive_topology) for descriptions of these topologies.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.directx.directxprimitivetopology
 * @namespace Windows.Graphics.DirectX
 * @version WindowsRuntime 1.4
 */
class DirectXPrimitiveTopology extends Win32Enum{

    /**
     * See [D3D_PRIMITIVE_TOPOLOGY_UNDEFINED](/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_primitive_topology).
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * See [D3D_PRIMITIVE_TOPOLOGY_POINTLIST](/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_primitive_topology).
     * @type {Integer (Int32)}
     */
    static PointList => 1

    /**
     * See [D3D_PRIMITIVE_TOPOLOGY_LINELIST](/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_primitive_topology).
     * @type {Integer (Int32)}
     */
    static LineList => 2

    /**
     * See [D3D_PRIMITIVE_TOPOLOGY_LINESTRIP](/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_primitive_topology).
     * @type {Integer (Int32)}
     */
    static LineStrip => 3

    /**
     * See [D3D_PRIMITIVE_TOPOLOGY_TRIANGLELIST](/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_primitive_topology).
     * @type {Integer (Int32)}
     */
    static TriangleList => 4

    /**
     * See [D3D_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP](/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_primitive_topology).
     * @type {Integer (Int32)}
     */
    static TriangleStrip => 5
}
