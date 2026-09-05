#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the status of a DRM handshake between a tuner and the user's computer.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/ne-bdaiface-bda_drmpairingerror
 * @namespace Windows.Win32.Media.DirectShow
 */
class BDA_DrmPairingError extends Win32Enum {

    /**
     * The handshake was successful.
     * Native name: BDA_DrmPairing_Succeeded
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * A hardware failure occurred.
     * Native name: BDA_DrmPairing_HardwareFailure
     * @type {Integer (Int32)}
     */
    static HardwareFailure => 1

    /**
     * The tuner could not obtain the certificate revocation list.
     * Native name: BDA_DrmPairing_NeedRevocationData
     * @type {Integer (Int32)}
     */
    static NeedRevocationData => 2

    /**
     * The tuner could not perform individualization.
     * Native name: BDA_DrmPairing_NeedIndiv
     * @type {Integer (Int32)}
     */
    static NeedIndiv => 3

    /**
     * Network interface (SCTE 55-1).
     * Native name: BDA_DrmPairing_Other
     * @type {Integer (Int32)}
     */
    static Other => 4

    /**
     * The handshake failed during the initialization step.
     * Native name: BDA_DrmPairing_DrmInitFailed
     * @type {Integer (Int32)}
     */
    static DrmInitFailed => 5

    /**
     * The client has not requested a handshake or the handshake is still in progress.
     * Native name: BDA_DrmPairing_DrmNotPaired
     * @type {Integer (Int32)}
     */
    static DrmNotPaired => 6

    /**
     * The handshake was successful but will soon time out. The client should refresh the handshake soon.
     * Native name: BDA_DrmPairing_DrmRePairSoon
     * @type {Integer (Int32)}
     */
    static DrmRePairSoon => 7

    /**
     * Native name: BDA_DrmPairing_Aborted
     * @type {Integer (Int32)}
     */
    static Aborted => 8

    /**
     * Native name: BDA_DrmPairing_NeedSDKUpdate
     * @type {Integer (Int32)}
     */
    static NeedSDKUpdate => 9
}
