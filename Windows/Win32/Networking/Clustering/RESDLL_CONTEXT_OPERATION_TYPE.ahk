#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the various types of context operations for the GET_OPERATION_CONTEXT_PARAMS structure.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ne-resapi-resdll_context_operation_type
 * @namespace Windows.Win32.Networking.Clustering
 */
class RESDLL_CONTEXT_OPERATION_TYPE extends Win32Enum {

    /**
     * A group fail back.
     * Native name: ResdllContextOperationTypeFailback
     * @type {Integer (Int32)}
     */
    static Failback => 0

    /**
     * A node drain.
     * Native name: ResdllContextOperationTypeDrain
     * @type {Integer (Int32)}
     */
    static Drain => 1

    /**
     * A node drain failure.
     * Native name: ResdllContextOperationTypeDrainFailure
     * @type {Integer (Int32)}
     */
    static DrainFailure => 2

    /**
     * An embedded failure.
     * Native name: ResdllContextOperationTypeEmbeddedFailure
     * @type {Integer (Int32)}
     */
    static EmbeddedFailure => 3

    /**
     * A preemption failure.
     * Native name: ResdllContextOperationTypePreemption
     * @type {Integer (Int32)}
     */
    static Preemption => 4

    /**
     * A network connection failure.
     * 
     * <b>Windows Server 2012:  </b>This value is not supported before Windows Server 2012 R2.
     * Native name: ResdllContextOperationTypeNetworkDisconnect
     * @type {Integer (Int32)}
     */
    static NetworkDisconnect => 5

    /**
     * A network connection was disconnected and it is being re-established.
     * 
     * <b>Windows Server 2012:  </b>This value is not supported before Windows Server 2012 R2.
     * Native name: ResdllContextOperationTypeNetworkDisconnectMoveRetry
     * @type {Integer (Int32)}
     */
    static NetworkDisconnectMoveRetry => 6
}
