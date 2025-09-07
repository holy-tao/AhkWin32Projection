#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies a type of trace register.
 * @remarks
 * <b>D3D11_TRACE_REGISTER_TYPE</b> identifies the type of trace register in a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_trace_register">D3D11_TRACE_REGISTER</a> structure.
  * 
  * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
  * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ne-d3d11shadertracing-d3d11_trace_register_type
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_TRACE_REGISTER_TYPE{

    /**
     * Output <b>NULL</b> register.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_OUTPUT_NULL_REGISTER => 0

    /**
     * Input register.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_INPUT_REGISTER => 1

    /**
     * Input primitive ID register.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_INPUT_PRIMITIVE_ID_REGISTER => 2

    /**
     * Immediate constant buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_IMMEDIATE_CONSTANT_BUFFER => 3

    /**
     * Temporary register.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_TEMP_REGISTER => 4

    /**
     * Temporary register that can be indexed.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_INDEXABLE_TEMP_REGISTER => 5

    /**
     * Output register.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_OUTPUT_REGISTER => 6

    /**
     * Output oDepth register.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_OUTPUT_DEPTH_REGISTER => 7

    /**
     * Constant buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_CONSTANT_BUFFER => 8

    /**
     * Immediate32 register.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_IMMEDIATE32 => 9

    /**
     * Sampler.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_SAMPLER => 10

    /**
     * Resource.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_RESOURCE => 11

    /**
     * Rasterizer.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_RASTERIZER => 12

    /**
     * Output coverage mask.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_OUTPUT_COVERAGE_MASK => 13

    /**
     * Stream.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_STREAM => 14

    /**
     * This pointer.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_THIS_POINTER => 15

    /**
     * Output control point ID register (this is actually an input; it defines the output that the thread controls).
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_OUTPUT_CONTROL_POINT_ID_REGISTER => 16

    /**
     * Input fork instance ID register.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_INPUT_FORK_INSTANCE_ID_REGISTER => 17

    /**
     * Input join instance ID register.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_INPUT_JOIN_INSTANCE_ID_REGISTER => 18

    /**
     * Input control point register.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_INPUT_CONTROL_POINT_REGISTER => 19

    /**
     * Output control point register.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_OUTPUT_CONTROL_POINT_REGISTER => 20

    /**
     * Input patch constant register.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_INPUT_PATCH_CONSTANT_REGISTER => 21

    /**
     * Input domain point register.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_INPUT_DOMAIN_POINT_REGISTER => 22

    /**
     * Unordered-access view.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_UNORDERED_ACCESS_VIEW => 23

    /**
     * Thread group shared memory.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_THREAD_GROUP_SHARED_MEMORY => 24

    /**
     * Input thread ID register.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_INPUT_THREAD_ID_REGISTER => 25

    /**
     * Thread group ID register.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_INPUT_THREAD_GROUP_ID_REGISTER => 26

    /**
     * Input thread ID in-group register.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_INPUT_THREAD_ID_IN_GROUP_REGISTER => 27

    /**
     * Input coverage mask register.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_INPUT_COVERAGE_MASK_REGISTER => 28

    /**
     * Input thread ID in-group flattened register.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_INPUT_THREAD_ID_IN_GROUP_FLATTENED_REGISTER => 29

    /**
     * Input geometry shader (GS) instance ID register.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_INPUT_GS_INSTANCE_ID_REGISTER => 30

    /**
     * Output oDepth greater than or equal register.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_OUTPUT_DEPTH_GREATER_EQUAL_REGISTER => 31

    /**
     * Output oDepth less than or equal register.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_OUTPUT_DEPTH_LESS_EQUAL_REGISTER => 32

    /**
     * Immediate64 register.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_IMMEDIATE64 => 33

    /**
     * Cycle counter register.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_INPUT_CYCLE_COUNTER_REGISTER => 34

    /**
     * Interface pointer.
     * @type {Integer (Int32)}
     */
    static D3D11_TRACE_INTERFACE_POINTER => 35
}
