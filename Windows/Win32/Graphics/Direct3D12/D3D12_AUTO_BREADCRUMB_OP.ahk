#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify render/compute GPU operations. (D3D12_AUTO_BREADCRUMB_OP)
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_auto_breadcrumb_op
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_AUTO_BREADCRUMB_OP extends Win32Enum {

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_SETMARKER
     * @type {Integer (Int32)}
     */
    static SETMARKER => 0

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_BEGINEVENT
     * @type {Integer (Int32)}
     */
    static BEGINEVENT => 1

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_ENDEVENT
     * @type {Integer (Int32)}
     */
    static ENDEVENT => 2

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_DRAWINSTANCED
     * @type {Integer (Int32)}
     */
    static DRAWINSTANCED => 3

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_DRAWINDEXEDINSTANCED
     * @type {Integer (Int32)}
     */
    static DRAWINDEXEDINSTANCED => 4

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_EXECUTEINDIRECT
     * @type {Integer (Int32)}
     */
    static EXECUTEINDIRECT => 5

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_DISPATCH
     * @type {Integer (Int32)}
     */
    static DISPATCH => 6

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_COPYBUFFERREGION
     * @type {Integer (Int32)}
     */
    static COPYBUFFERREGION => 7

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_COPYTEXTUREREGION
     * @type {Integer (Int32)}
     */
    static COPYTEXTUREREGION => 8

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_COPYRESOURCE
     * @type {Integer (Int32)}
     */
    static COPYRESOURCE => 9

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_COPYTILES
     * @type {Integer (Int32)}
     */
    static COPYTILES => 10

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_RESOLVESUBRESOURCE
     * @type {Integer (Int32)}
     */
    static RESOLVESUBRESOURCE => 11

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_CLEARRENDERTARGETVIEW
     * @type {Integer (Int32)}
     */
    static CLEARRENDERTARGETVIEW => 12

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_CLEARUNORDEREDACCESSVIEW
     * @type {Integer (Int32)}
     */
    static CLEARUNORDEREDACCESSVIEW => 13

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_CLEARDEPTHSTENCILVIEW
     * @type {Integer (Int32)}
     */
    static CLEARDEPTHSTENCILVIEW => 14

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_RESOURCEBARRIER
     * @type {Integer (Int32)}
     */
    static RESOURCEBARRIER => 15

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_EXECUTEBUNDLE
     * @type {Integer (Int32)}
     */
    static EXECUTEBUNDLE => 16

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_PRESENT
     * @type {Integer (Int32)}
     */
    static PRESENT => 17

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_RESOLVEQUERYDATA
     * @type {Integer (Int32)}
     */
    static RESOLVEQUERYDATA => 18

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_BEGINSUBMISSION
     * @type {Integer (Int32)}
     */
    static BEGINSUBMISSION => 19

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_ENDSUBMISSION
     * @type {Integer (Int32)}
     */
    static ENDSUBMISSION => 20

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_DECODEFRAME
     * @type {Integer (Int32)}
     */
    static DECODEFRAME => 21

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_PROCESSFRAMES
     * @type {Integer (Int32)}
     */
    static PROCESSFRAMES => 22

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_ATOMICCOPYBUFFERUINT
     * @type {Integer (Int32)}
     */
    static ATOMICCOPYBUFFERUINT => 23

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_ATOMICCOPYBUFFERUINT64
     * @type {Integer (Int32)}
     */
    static ATOMICCOPYBUFFERUINT64 => 24

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_RESOLVESUBRESOURCEREGION
     * @type {Integer (Int32)}
     */
    static RESOLVESUBRESOURCEREGION => 25

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_WRITEBUFFERIMMEDIATE
     * @type {Integer (Int32)}
     */
    static WRITEBUFFERIMMEDIATE => 26

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_DECODEFRAME1
     * @type {Integer (Int32)}
     */
    static DECODEFRAME1 => 27

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_SETPROTECTEDRESOURCESESSION
     * @type {Integer (Int32)}
     */
    static SETPROTECTEDRESOURCESESSION => 28

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_DECODEFRAME2
     * @type {Integer (Int32)}
     */
    static DECODEFRAME2 => 29

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_PROCESSFRAMES1
     * @type {Integer (Int32)}
     */
    static PROCESSFRAMES1 => 30

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_BUILDRAYTRACINGACCELERATIONSTRUCTURE
     * @type {Integer (Int32)}
     */
    static BUILDRAYTRACINGACCELERATIONSTRUCTURE => 31

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_EMITRAYTRACINGACCELERATIONSTRUCTUREPOSTBUILDINFO
     * @type {Integer (Int32)}
     */
    static EMITRAYTRACINGACCELERATIONSTRUCTUREPOSTBUILDINFO => 32

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_COPYRAYTRACINGACCELERATIONSTRUCTURE
     * @type {Integer (Int32)}
     */
    static COPYRAYTRACINGACCELERATIONSTRUCTURE => 33

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_DISPATCHRAYS
     * @type {Integer (Int32)}
     */
    static DISPATCHRAYS => 34

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_INITIALIZEMETACOMMAND
     * @type {Integer (Int32)}
     */
    static INITIALIZEMETACOMMAND => 35

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_EXECUTEMETACOMMAND
     * @type {Integer (Int32)}
     */
    static EXECUTEMETACOMMAND => 36

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_ESTIMATEMOTION
     * @type {Integer (Int32)}
     */
    static ESTIMATEMOTION => 37

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_RESOLVEMOTIONVECTORHEAP
     * @type {Integer (Int32)}
     */
    static RESOLVEMOTIONVECTORHEAP => 38

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_SETPIPELINESTATE1
     * @type {Integer (Int32)}
     */
    static SETPIPELINESTATE1 => 39

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_INITIALIZEEXTENSIONCOMMAND
     * @type {Integer (Int32)}
     */
    static INITIALIZEEXTENSIONCOMMAND => 40

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_EXECUTEEXTENSIONCOMMAND
     * @type {Integer (Int32)}
     */
    static EXECUTEEXTENSIONCOMMAND => 41

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_DISPATCHMESH
     * @type {Integer (Int32)}
     */
    static DISPATCHMESH => 42

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_ENCODEFRAME
     * @type {Integer (Int32)}
     */
    static ENCODEFRAME => 43

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_RESOLVEENCODEROUTPUTMETADATA
     * @type {Integer (Int32)}
     */
    static RESOLVEENCODEROUTPUTMETADATA => 44

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_BARRIER
     * @type {Integer (Int32)}
     */
    static BARRIER => 45

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_BEGIN_COMMAND_LIST
     * @type {Integer (Int32)}
     */
    static BEGIN_COMMAND_LIST => 46

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_DISPATCHGRAPH
     * @type {Integer (Int32)}
     */
    static DISPATCHGRAPH => 47

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_SETPROGRAM
     * @type {Integer (Int32)}
     */
    static SETPROGRAM => 48

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_ENCODEFRAME1
     * @type {Integer (Int32)}
     */
    static ENCODEFRAME1 => 49

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_RESOLVEENCODEROUTPUTMETADATA1
     * @type {Integer (Int32)}
     */
    static RESOLVEENCODEROUTPUTMETADATA1 => 50

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_RESOLVEINPUTPARAMLAYOUT
     * @type {Integer (Int32)}
     */
    static RESOLVEINPUTPARAMLAYOUT => 51

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_PROCESSFRAMES2
     * @type {Integer (Int32)}
     */
    static PROCESSFRAMES2 => 52

    /**
     * Native name: D3D12_AUTO_BREADCRUMB_OP_SET_WORK_GRAPH_MAXIMUM_GPU_INPUT_RECORDS
     * @type {Integer (Int32)}
     */
    static SET_WORK_GRAPH_MAXIMUM_GPU_INPUT_RECORDS => 53
}
