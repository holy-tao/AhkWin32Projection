#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Congruent with, and numerically equivalent to, 3D12DDI_HANDLETYPE enumeration values.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_dred_allocation_type
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_DRED_ALLOCATION_TYPE extends Win32Enum {

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_COMMAND_QUEUE
     * @type {Integer (Int32)}
     */
    static COMMAND_QUEUE => 19

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_COMMAND_ALLOCATOR
     * @type {Integer (Int32)}
     */
    static COMMAND_ALLOCATOR => 20

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_PIPELINE_STATE
     * @type {Integer (Int32)}
     */
    static PIPELINE_STATE => 21

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_COMMAND_LIST
     * @type {Integer (Int32)}
     */
    static COMMAND_LIST => 22

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_FENCE
     * @type {Integer (Int32)}
     */
    static FENCE => 23

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_DESCRIPTOR_HEAP
     * @type {Integer (Int32)}
     */
    static DESCRIPTOR_HEAP => 24

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_HEAP
     * @type {Integer (Int32)}
     */
    static HEAP => 25

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_QUERY_HEAP
     * @type {Integer (Int32)}
     */
    static QUERY_HEAP => 27

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_COMMAND_SIGNATURE
     * @type {Integer (Int32)}
     */
    static COMMAND_SIGNATURE => 28

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_PIPELINE_LIBRARY
     * @type {Integer (Int32)}
     */
    static PIPELINE_LIBRARY => 29

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_VIDEO_DECODER
     * @type {Integer (Int32)}
     */
    static VIDEO_DECODER => 30

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_VIDEO_PROCESSOR
     * @type {Integer (Int32)}
     */
    static VIDEO_PROCESSOR => 32

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_RESOURCE
     * @type {Integer (Int32)}
     */
    static RESOURCE => 34

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_PASS
     * @type {Integer (Int32)}
     */
    static PASS => 35

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_CRYPTOSESSION
     * @type {Integer (Int32)}
     */
    static CRYPTOSESSION => 36

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_CRYPTOSESSIONPOLICY
     * @type {Integer (Int32)}
     */
    static CRYPTOSESSIONPOLICY => 37

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_PROTECTEDRESOURCESESSION
     * @type {Integer (Int32)}
     */
    static PROTECTEDRESOURCESESSION => 38

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_VIDEO_DECODER_HEAP
     * @type {Integer (Int32)}
     */
    static VIDEO_DECODER_HEAP => 39

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_COMMAND_POOL
     * @type {Integer (Int32)}
     */
    static COMMAND_POOL => 40

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_COMMAND_RECORDER
     * @type {Integer (Int32)}
     */
    static COMMAND_RECORDER => 41

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_STATE_OBJECT
     * @type {Integer (Int32)}
     */
    static STATE_OBJECT => 42

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_METACOMMAND
     * @type {Integer (Int32)}
     */
    static METACOMMAND => 43

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_SCHEDULINGGROUP
     * @type {Integer (Int32)}
     */
    static SCHEDULINGGROUP => 44

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_VIDEO_MOTION_ESTIMATOR
     * @type {Integer (Int32)}
     */
    static VIDEO_MOTION_ESTIMATOR => 45

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_VIDEO_MOTION_VECTOR_HEAP
     * @type {Integer (Int32)}
     */
    static VIDEO_MOTION_VECTOR_HEAP => 46

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_VIDEO_EXTENSION_COMMAND
     * @type {Integer (Int32)}
     */
    static VIDEO_EXTENSION_COMMAND => 47

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_VIDEO_ENCODER
     * @type {Integer (Int32)}
     */
    static VIDEO_ENCODER => 48

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_VIDEO_ENCODER_HEAP
     * @type {Integer (Int32)}
     */
    static VIDEO_ENCODER_HEAP => 49

    /**
     * Native name: D3D12_DRED_ALLOCATION_TYPE_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => -1
}
