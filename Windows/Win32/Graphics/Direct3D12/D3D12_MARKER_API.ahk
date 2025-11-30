#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_MARKER_API extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_SETMARKER => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_BEGINEVENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_ENDEVENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_DRAWINSTANCED => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_DRAWINDEXEDINSTANCED => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_EXECUTEINDIRECT => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_DISPATCH => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_COPYBUFFERREGION => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_COPYTEXTUREREGION => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_COPYRESOURCE => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_COPYTILES => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_RESOLVESUBRESOURCE => 11

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_CLEARRENDERTARGETVIEW => 12

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_CLEARUNORDEREDACCESSVIEW => 13

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_CLEARDEPTHSTENCILVIEW => 14

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_RESOURCEBARRIER => 15

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_EXECUTEBUNDLE => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_PRESENT => 17

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_RESOLVEQUERYDATA => 18

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_BEGINSUBMISSION => 19

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_ENDSUBMISSION => 20

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_DECODEFRAME => 21

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_PROCESSFRAMES => 22

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_ATOMICCOPYBUFFERUINT => 23

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_ATOMICCOPYBUFFERUINT64 => 24

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_RESOLVESUBRESOURCEREGION => 25

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_WRITEBUFFERIMMEDIATE => 26

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_DECODEFRAME1 => 27

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_SETPROTECTEDRESOURCESESSION => 28

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_DECODEFRAME2 => 29

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_PROCESSFRAMES1 => 30

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_BUILDRAYTRACINGACCELERATIONSTRUCTURE => 31

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_EMITRAYTRACINGACCELERATIONSTRUCTUREPOSTBUILDINFO => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_COPYRAYTRACINGACCELERATIONSTRUCTURE => 33

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_DISPATCHRAYS => 34

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_INITIALIZEMETACOMMAND => 35

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_EXECUTEMETACOMMAND => 36

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_ESTIMATEMOTION => 37

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_RESOLVEMOTIONVECTORHEAP => 38

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_SETPIPELINESTATE1 => 39

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_INITIALIZEEXTENSIONCOMMAND => 40

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_EXECUTEEXTENSIONCOMMAND => 41

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_DISPATCHMESH => 42

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_ENCODEFRAME => 43

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_RESOLVEENCODEROUTPUTMETADATA => 44

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_BARRIER => 45

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_BEGIN_COMMAND_LIST => 46

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_DISPATCHGRAPH => 47

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_SETPROGRAM => 48

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_ENCODEFRAME1 => 49

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_RESOLVEENCODEROUTPUTMETADATA1 => 50

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_RESOLVEINPUTPARAMLAYOUT => 51

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_PROCESSFRAMES2 => 52

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_MARKER_API_SET_WORK_GRAPH_MAXIMUM_GPU_INPUT_RECORDS => 53
}
