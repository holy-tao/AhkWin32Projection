#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the various types of context operations for the GET_OPERATION_CONTEXT_PARAMS structure.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ne-resapi-resdll_context_operation_type
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class RESDLL_CONTEXT_OPERATION_TYPE{

    /**
     * A group fail back.
     * @type {Integer (Int32)}
     */
    static ResdllContextOperationTypeFailback => 0

    /**
     * A node drain.
     * @type {Integer (Int32)}
     */
    static ResdllContextOperationTypeDrain => 1

    /**
     * A node drain failure.
     * @type {Integer (Int32)}
     */
    static ResdllContextOperationTypeDrainFailure => 2

    /**
     * An embedded failure.
     * @type {Integer (Int32)}
     */
    static ResdllContextOperationTypeEmbeddedFailure => 3

    /**
     * A preemption failure.
     * @type {Integer (Int32)}
     */
    static ResdllContextOperationTypePreemption => 4

    /**
     * A network connection failure.
 * 
 * <b>Windows Server 2012:  </b>This value is not supported before Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static ResdllContextOperationTypeNetworkDisconnect => 5

    /**
     * A network connection was disconnected and it is being re-established.
 * 
 * <b>Windows Server 2012:  </b>This value is not supported before Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static ResdllContextOperationTypeNetworkDisconnectMoveRetry => 6
}
