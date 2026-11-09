#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MEDIA_STATUS extends Win32Enum {

    /**
     * Native name: CxlMediaStatus_Normal
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * Native name: CxlMediaStatus_NotReady
     * @type {Integer (Int32)}
     */
    static NotReady => 1

    /**
     * Native name: CxlMediaStatus_WritePersistencyLost
     * @type {Integer (Int32)}
     */
    static WritePersistencyLost => 2

    /**
     * Native name: CxlMediaStatus_AllDataLost
     * @type {Integer (Int32)}
     */
    static AllDataLost => 3

    /**
     * Native name: CxlMediaStatus_WritePersistencyLossPowerLoss
     * @type {Integer (Int32)}
     */
    static WritePersistencyLossPowerLoss => 4

    /**
     * Native name: CxlMediaStatus_WritePersistencyLossShutdown
     * @type {Integer (Int32)}
     */
    static WritePersistencyLossShutdown => 5

    /**
     * Native name: CxlMediaStatus_WritePersistencyLossImminent
     * @type {Integer (Int32)}
     */
    static WritePersistencyLossImminent => 6

    /**
     * Native name: CxlMediaStatus_AllDataLossPowerLoss
     * @type {Integer (Int32)}
     */
    static AllDataLossPowerLoss => 7

    /**
     * Native name: CxlMediaStatus_AllDataLossShutdown
     * @type {Integer (Int32)}
     */
    static AllDataLossShutdown => 8

    /**
     * Native name: CxlMediaStatus_AllDataLossImminent
     * @type {Integer (Int32)}
     */
    static AllDataLossImminent => 9
}
