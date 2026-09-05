#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies a type of trace register.
 * @remarks
 * <b>D3D11_TRACE_REGISTER_TYPE</b> identifies the type of trace register in a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_trace_register">D3D11_TRACE_REGISTER</a> structure.
 * 
 * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ne-d3d11shadertracing-d3d11_trace_register_type
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3D11_TRACE_REGISTER_TYPE extends Win32Enum {

    /**
     * Output <b>NULL</b> register.
     * Native name: D3D11_TRACE_OUTPUT_NULL_REGISTER
     * @type {Integer (Int32)}
     */
    static OUTPUT_NULL_REGISTER => 0

    /**
     * Input register.
     * Native name: D3D11_TRACE_INPUT_REGISTER
     * @type {Integer (Int32)}
     */
    static INPUT_REGISTER => 1

    /**
     * Input primitive ID register.
     * Native name: D3D11_TRACE_INPUT_PRIMITIVE_ID_REGISTER
     * @type {Integer (Int32)}
     */
    static INPUT_PRIMITIVE_ID_REGISTER => 2

    /**
     * Immediate constant buffer.
     * Native name: D3D11_TRACE_IMMEDIATE_CONSTANT_BUFFER
     * @type {Integer (Int32)}
     */
    static IMMEDIATE_CONSTANT_BUFFER => 3

    /**
     * Temporary register.
     * Native name: D3D11_TRACE_TEMP_REGISTER
     * @type {Integer (Int32)}
     */
    static TEMP_REGISTER => 4

    /**
     * Temporary register that can be indexed.
     * Native name: D3D11_TRACE_INDEXABLE_TEMP_REGISTER
     * @type {Integer (Int32)}
     */
    static INDEXABLE_TEMP_REGISTER => 5

    /**
     * Output register.
     * Native name: D3D11_TRACE_OUTPUT_REGISTER
     * @type {Integer (Int32)}
     */
    static OUTPUT_REGISTER => 6

    /**
     * Output oDepth register.
     * Native name: D3D11_TRACE_OUTPUT_DEPTH_REGISTER
     * @type {Integer (Int32)}
     */
    static OUTPUT_DEPTH_REGISTER => 7

    /**
     * Constant buffer.
     * Native name: D3D11_TRACE_CONSTANT_BUFFER
     * @type {Integer (Int32)}
     */
    static CONSTANT_BUFFER => 8

    /**
     * Immediate32 register.
     * Native name: D3D11_TRACE_IMMEDIATE32
     * @type {Integer (Int32)}
     */
    static IMMEDIATE32 => 9

    /**
     * Sampler.
     * Native name: D3D11_TRACE_SAMPLER
     * @type {Integer (Int32)}
     */
    static SAMPLER => 10

    /**
     * Resource.
     * Native name: D3D11_TRACE_RESOURCE
     * @type {Integer (Int32)}
     */
    static RESOURCE => 11

    /**
     * Rasterizer.
     * Native name: D3D11_TRACE_RASTERIZER
     * @type {Integer (Int32)}
     */
    static RASTERIZER => 12

    /**
     * Output coverage mask.
     * Native name: D3D11_TRACE_OUTPUT_COVERAGE_MASK
     * @type {Integer (Int32)}
     */
    static OUTPUT_COVERAGE_MASK => 13

    /**
     * Stream.
     * Native name: D3D11_TRACE_STREAM
     * @type {Integer (Int32)}
     */
    static STREAM => 14

    /**
     * This pointer.
     * Native name: D3D11_TRACE_THIS_POINTER
     * @type {Integer (Int32)}
     */
    static THIS_POINTER => 15

    /**
     * Output control point ID register (this is actually an input; it defines the output that the thread controls).
     * Native name: D3D11_TRACE_OUTPUT_CONTROL_POINT_ID_REGISTER
     * @type {Integer (Int32)}
     */
    static OUTPUT_CONTROL_POINT_ID_REGISTER => 16

    /**
     * Input fork instance ID register.
     * Native name: D3D11_TRACE_INPUT_FORK_INSTANCE_ID_REGISTER
     * @type {Integer (Int32)}
     */
    static INPUT_FORK_INSTANCE_ID_REGISTER => 17

    /**
     * Input join instance ID register.
     * Native name: D3D11_TRACE_INPUT_JOIN_INSTANCE_ID_REGISTER
     * @type {Integer (Int32)}
     */
    static INPUT_JOIN_INSTANCE_ID_REGISTER => 18

    /**
     * Input control point register.
     * Native name: D3D11_TRACE_INPUT_CONTROL_POINT_REGISTER
     * @type {Integer (Int32)}
     */
    static INPUT_CONTROL_POINT_REGISTER => 19

    /**
     * Output control point register.
     * Native name: D3D11_TRACE_OUTPUT_CONTROL_POINT_REGISTER
     * @type {Integer (Int32)}
     */
    static OUTPUT_CONTROL_POINT_REGISTER => 20

    /**
     * Input patch constant register.
     * Native name: D3D11_TRACE_INPUT_PATCH_CONSTANT_REGISTER
     * @type {Integer (Int32)}
     */
    static INPUT_PATCH_CONSTANT_REGISTER => 21

    /**
     * Input domain point register.
     * Native name: D3D11_TRACE_INPUT_DOMAIN_POINT_REGISTER
     * @type {Integer (Int32)}
     */
    static INPUT_DOMAIN_POINT_REGISTER => 22

    /**
     * Unordered-access view.
     * Native name: D3D11_TRACE_UNORDERED_ACCESS_VIEW
     * @type {Integer (Int32)}
     */
    static UNORDERED_ACCESS_VIEW => 23

    /**
     * Thread group shared memory.
     * Native name: D3D11_TRACE_THREAD_GROUP_SHARED_MEMORY
     * @type {Integer (Int32)}
     */
    static THREAD_GROUP_SHARED_MEMORY => 24

    /**
     * Input thread ID register.
     * Native name: D3D11_TRACE_INPUT_THREAD_ID_REGISTER
     * @type {Integer (Int32)}
     */
    static INPUT_THREAD_ID_REGISTER => 25

    /**
     * Thread group ID register.
     * Native name: D3D11_TRACE_INPUT_THREAD_GROUP_ID_REGISTER
     * @type {Integer (Int32)}
     */
    static INPUT_THREAD_GROUP_ID_REGISTER => 26

    /**
     * Input thread ID in-group register.
     * Native name: D3D11_TRACE_INPUT_THREAD_ID_IN_GROUP_REGISTER
     * @type {Integer (Int32)}
     */
    static INPUT_THREAD_ID_IN_GROUP_REGISTER => 27

    /**
     * Input coverage mask register.
     * Native name: D3D11_TRACE_INPUT_COVERAGE_MASK_REGISTER
     * @type {Integer (Int32)}
     */
    static INPUT_COVERAGE_MASK_REGISTER => 28

    /**
     * Input thread ID in-group flattened register.
     * Native name: D3D11_TRACE_INPUT_THREAD_ID_IN_GROUP_FLATTENED_REGISTER
     * @type {Integer (Int32)}
     */
    static INPUT_THREAD_ID_IN_GROUP_FLATTENED_REGISTER => 29

    /**
     * Input geometry shader (GS) instance ID register.
     * Native name: D3D11_TRACE_INPUT_GS_INSTANCE_ID_REGISTER
     * @type {Integer (Int32)}
     */
    static INPUT_GS_INSTANCE_ID_REGISTER => 30

    /**
     * Output oDepth greater than or equal register.
     * Native name: D3D11_TRACE_OUTPUT_DEPTH_GREATER_EQUAL_REGISTER
     * @type {Integer (Int32)}
     */
    static OUTPUT_DEPTH_GREATER_EQUAL_REGISTER => 31

    /**
     * Output oDepth less than or equal register.
     * Native name: D3D11_TRACE_OUTPUT_DEPTH_LESS_EQUAL_REGISTER
     * @type {Integer (Int32)}
     */
    static OUTPUT_DEPTH_LESS_EQUAL_REGISTER => 32

    /**
     * Immediate64 register.
     * Native name: D3D11_TRACE_IMMEDIATE64
     * @type {Integer (Int32)}
     */
    static IMMEDIATE64 => 33

    /**
     * Cycle counter register.
     * Native name: D3D11_TRACE_INPUT_CYCLE_COUNTER_REGISTER
     * @type {Integer (Int32)}
     */
    static INPUT_CYCLE_COUNTER_REGISTER => 34

    /**
     * Interface pointer.
     * Native name: D3D11_TRACE_INTERFACE_POINTER
     * @type {Integer (Int32)}
     */
    static INTERFACE_POINTER => 35
}
