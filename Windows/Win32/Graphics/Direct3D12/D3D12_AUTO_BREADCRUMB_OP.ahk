#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify render/compute GPU operations. (D3D12_AUTO_BREADCRUMB_OP)
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_auto_breadcrumb_op
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_AUTO_BREADCRUMB_OP{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_SETMARKER => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_BEGINEVENT => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_ENDEVENT => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_DRAWINSTANCED => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_DRAWINDEXEDINSTANCED => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_EXECUTEINDIRECT => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_DISPATCH => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_COPYBUFFERREGION => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_COPYTEXTUREREGION => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_COPYRESOURCE => 9

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_COPYTILES => 10

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_RESOLVESUBRESOURCE => 11

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_CLEARRENDERTARGETVIEW => 12

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_CLEARUNORDEREDACCESSVIEW => 13

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_CLEARDEPTHSTENCILVIEW => 14

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_RESOURCEBARRIER => 15

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_EXECUTEBUNDLE => 16

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_PRESENT => 17

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_RESOLVEQUERYDATA => 18

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_BEGINSUBMISSION => 19

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_ENDSUBMISSION => 20

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_DECODEFRAME => 21

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_PROCESSFRAMES => 22

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_ATOMICCOPYBUFFERUINT => 23

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_ATOMICCOPYBUFFERUINT64 => 24

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_RESOLVESUBRESOURCEREGION => 25

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_WRITEBUFFERIMMEDIATE => 26

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_DECODEFRAME1 => 27

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_SETPROTECTEDRESOURCESESSION => 28

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_DECODEFRAME2 => 29

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_PROCESSFRAMES1 => 30

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_BUILDRAYTRACINGACCELERATIONSTRUCTURE => 31

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_EMITRAYTRACINGACCELERATIONSTRUCTUREPOSTBUILDINFO => 32

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_COPYRAYTRACINGACCELERATIONSTRUCTURE => 33

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_DISPATCHRAYS => 34

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_INITIALIZEMETACOMMAND => 35

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_EXECUTEMETACOMMAND => 36

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_ESTIMATEMOTION => 37

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_RESOLVEMOTIONVECTORHEAP => 38

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_SETPIPELINESTATE1 => 39

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_INITIALIZEEXTENSIONCOMMAND => 40

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_EXECUTEEXTENSIONCOMMAND => 41

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_DISPATCHMESH => 42

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_ENCODEFRAME => 43

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_RESOLVEENCODEROUTPUTMETADATA => 44

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_BARRIER => 45

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_BEGIN_COMMAND_LIST => 46

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_DISPATCHGRAPH => 47

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_AUTO_BREADCRUMB_OP_SETPROGRAM => 48
}
