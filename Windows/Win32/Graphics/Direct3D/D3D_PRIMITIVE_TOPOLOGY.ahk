#Requires AutoHotkey v2.0.0 64-bit

/**
 * Values that indicate how the pipeline interprets vertex data that is bound to the input-assembler stage. These primitive topology values determine how the vertex data is rendered on screen.
 * @remarks
 * Use the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-iasetprimitivetopology">ID3D11DeviceContext::IASetPrimitiveTopology</a> method and a value from <b>D3D_PRIMITIVE_TOPOLOGY</b> to bind a primitive topology to the input-assembler stage. Use the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-iagetprimitivetopology">ID3D11DeviceContext::IAGetPrimitiveTopology</a> method to retrieve the primitive topology for the input-assembler stage.
  * 
  * The following diagram shows the various primitive types for a geometry shader object.
  * 
  * <img alt="Illustration of the various primitive types for a geometry shader object" border="" src="./images/D3D11_GSInputs1.png"/>
 * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_primitive_topology
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3D_PRIMITIVE_TOPOLOGY{

    /**
     * The IA stage has not been initialized with a primitive topology. The IA stage will not function properly unless a primitive topology is defined.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_UNDEFINED => 0

    /**
     * Interpret the vertex data as a list of points.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_POINTLIST => 1

    /**
     * Interpret the vertex data as a list of lines.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_LINELIST => 2

    /**
     * Interpret the vertex data as a line strip.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_LINESTRIP => 3

    /**
     * Interpret the vertex data as a list of triangles.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_TRIANGLELIST => 4

    /**
     * Interpret the vertex data as a triangle strip.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_TRIANGLEFAN => 6

    /**
     * Interpret the vertex data as a list of lines with adjacency data.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_LINELIST_ADJ => 10

    /**
     * Interpret the vertex data as a line strip with adjacency data.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_LINESTRIP_ADJ => 11

    /**
     * Interpret the vertex data as a list of triangles with adjacency data.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_TRIANGLELIST_ADJ => 12

    /**
     * Interpret the vertex data as a triangle strip with adjacency data.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP_ADJ => 13

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_1_CONTROL_POINT_PATCHLIST => 33

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_2_CONTROL_POINT_PATCHLIST => 34

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_3_CONTROL_POINT_PATCHLIST => 35

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_4_CONTROL_POINT_PATCHLIST => 36

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_5_CONTROL_POINT_PATCHLIST => 37

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_6_CONTROL_POINT_PATCHLIST => 38

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_7_CONTROL_POINT_PATCHLIST => 39

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_8_CONTROL_POINT_PATCHLIST => 40

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_9_CONTROL_POINT_PATCHLIST => 41

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_10_CONTROL_POINT_PATCHLIST => 42

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_11_CONTROL_POINT_PATCHLIST => 43

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_12_CONTROL_POINT_PATCHLIST => 44

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_13_CONTROL_POINT_PATCHLIST => 45

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_14_CONTROL_POINT_PATCHLIST => 46

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_15_CONTROL_POINT_PATCHLIST => 47

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_16_CONTROL_POINT_PATCHLIST => 48

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_17_CONTROL_POINT_PATCHLIST => 49

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_18_CONTROL_POINT_PATCHLIST => 50

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_19_CONTROL_POINT_PATCHLIST => 51

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_20_CONTROL_POINT_PATCHLIST => 52

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_21_CONTROL_POINT_PATCHLIST => 53

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_22_CONTROL_POINT_PATCHLIST => 54

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_23_CONTROL_POINT_PATCHLIST => 55

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_24_CONTROL_POINT_PATCHLIST => 56

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_25_CONTROL_POINT_PATCHLIST => 57

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_26_CONTROL_POINT_PATCHLIST => 58

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_27_CONTROL_POINT_PATCHLIST => 59

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_28_CONTROL_POINT_PATCHLIST => 60

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_29_CONTROL_POINT_PATCHLIST => 61

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_30_CONTROL_POINT_PATCHLIST => 62

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_31_CONTROL_POINT_PATCHLIST => 63

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D_PRIMITIVE_TOPOLOGY_32_CONTROL_POINT_PATCHLIST => 64

    /**
     * The IA stage has not been initialized with a primitive topology. The IA stage will not function properly unless a primitive topology is defined.
     * @type {Integer (Int32)}
     */
    static D3D10_PRIMITIVE_TOPOLOGY_UNDEFINED => 0

    /**
     * Interpret the vertex data as a list of points.
     * @type {Integer (Int32)}
     */
    static D3D10_PRIMITIVE_TOPOLOGY_POINTLIST => 1

    /**
     * Interpret the vertex data as a list of lines.
     * @type {Integer (Int32)}
     */
    static D3D10_PRIMITIVE_TOPOLOGY_LINELIST => 2

    /**
     * Interpret the vertex data as a line strip.
     * @type {Integer (Int32)}
     */
    static D3D10_PRIMITIVE_TOPOLOGY_LINESTRIP => 3

    /**
     * Interpret the vertex data as a list of triangles.
     * @type {Integer (Int32)}
     */
    static D3D10_PRIMITIVE_TOPOLOGY_TRIANGLELIST => 4

    /**
     * Interpret the vertex data as a triangle strip.
     * @type {Integer (Int32)}
     */
    static D3D10_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP => 5

    /**
     * Interpret the vertex data as a list of lines with adjacency data.
     * @type {Integer (Int32)}
     */
    static D3D10_PRIMITIVE_TOPOLOGY_LINELIST_ADJ => 10

    /**
     * Interpret the vertex data as a line strip with adjacency data.
     * @type {Integer (Int32)}
     */
    static D3D10_PRIMITIVE_TOPOLOGY_LINESTRIP_ADJ => 11

    /**
     * Interpret the vertex data as a list of triangles with adjacency data.
     * @type {Integer (Int32)}
     */
    static D3D10_PRIMITIVE_TOPOLOGY_TRIANGLELIST_ADJ => 12

    /**
     * Interpret the vertex data as a triangle strip with adjacency data.
     * @type {Integer (Int32)}
     */
    static D3D10_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP_ADJ => 13

    /**
     * The IA stage has not been initialized with a primitive topology. The IA stage will not function properly unless a primitive topology is defined.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_UNDEFINED => 0

    /**
     * Interpret the vertex data as a list of points.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_POINTLIST => 1

    /**
     * Interpret the vertex data as a list of lines.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_LINELIST => 2

    /**
     * Interpret the vertex data as a line strip.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_LINESTRIP => 3

    /**
     * Interpret the vertex data as a list of triangles.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_TRIANGLELIST => 4

    /**
     * Interpret the vertex data as a triangle strip.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP => 5

    /**
     * Interpret the vertex data as a list of lines with adjacency data.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_LINELIST_ADJ => 10

    /**
     * Interpret the vertex data as a line strip with adjacency data.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_LINESTRIP_ADJ => 11

    /**
     * Interpret the vertex data as a list of triangles with adjacency data.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_TRIANGLELIST_ADJ => 12

    /**
     * Interpret the vertex data as a triangle strip with adjacency data.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP_ADJ => 13

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_1_CONTROL_POINT_PATCHLIST => 33

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_2_CONTROL_POINT_PATCHLIST => 34

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_3_CONTROL_POINT_PATCHLIST => 35

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_4_CONTROL_POINT_PATCHLIST => 36

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_5_CONTROL_POINT_PATCHLIST => 37

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_6_CONTROL_POINT_PATCHLIST => 38

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_7_CONTROL_POINT_PATCHLIST => 39

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_8_CONTROL_POINT_PATCHLIST => 40

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_9_CONTROL_POINT_PATCHLIST => 41

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_10_CONTROL_POINT_PATCHLIST => 42

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_11_CONTROL_POINT_PATCHLIST => 43

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_12_CONTROL_POINT_PATCHLIST => 44

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_13_CONTROL_POINT_PATCHLIST => 45

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_14_CONTROL_POINT_PATCHLIST => 46

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_15_CONTROL_POINT_PATCHLIST => 47

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_16_CONTROL_POINT_PATCHLIST => 48

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_17_CONTROL_POINT_PATCHLIST => 49

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_18_CONTROL_POINT_PATCHLIST => 50

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_19_CONTROL_POINT_PATCHLIST => 51

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_20_CONTROL_POINT_PATCHLIST => 52

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_21_CONTROL_POINT_PATCHLIST => 53

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_22_CONTROL_POINT_PATCHLIST => 54

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_23_CONTROL_POINT_PATCHLIST => 55

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_24_CONTROL_POINT_PATCHLIST => 56

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_25_CONTROL_POINT_PATCHLIST => 57

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_26_CONTROL_POINT_PATCHLIST => 58

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_27_CONTROL_POINT_PATCHLIST => 59

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_28_CONTROL_POINT_PATCHLIST => 60

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_29_CONTROL_POINT_PATCHLIST => 61

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_30_CONTROL_POINT_PATCHLIST => 62

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_31_CONTROL_POINT_PATCHLIST => 63

    /**
     * Interpret the vertex data as a patch list.
     * @type {Integer (Int32)}
     */
    static D3D11_PRIMITIVE_TOPOLOGY_32_CONTROL_POINT_PATCHLIST => 64
}
