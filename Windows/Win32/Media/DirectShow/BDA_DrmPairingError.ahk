#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the status of a DRM handshake between a tuner and the user's computer.
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/ne-bdaiface-bda_drmpairingerror
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class BDA_DrmPairingError extends Win32Enum{

    /**
     * The handshake was successful.
     * @type {Integer (Int32)}
     */
    static BDA_DrmPairing_Succeeded => 0

    /**
     * A hardware failure occurred.
     * @type {Integer (Int32)}
     */
    static BDA_DrmPairing_HardwareFailure => 1

    /**
     * The tuner could not obtain the certificate revocation list.
     * @type {Integer (Int32)}
     */
    static BDA_DrmPairing_NeedRevocationData => 2

    /**
     * The tuner could not perform individualization.
     * @type {Integer (Int32)}
     */
    static BDA_DrmPairing_NeedIndiv => 3

    /**
     * Network interface (SCTE 55-1).
     * @type {Integer (Int32)}
     */
    static BDA_DrmPairing_Other => 4

    /**
     * The handshake failed during the initialization step.
     * @type {Integer (Int32)}
     */
    static BDA_DrmPairing_DrmInitFailed => 5

    /**
     * The client has not requested a handshake or the handshake is still in progress.
     * @type {Integer (Int32)}
     */
    static BDA_DrmPairing_DrmNotPaired => 6

    /**
     * The handshake was successful but will soon time out. The client should refresh the handshake soon.
     * @type {Integer (Int32)}
     */
    static BDA_DrmPairing_DrmRePairSoon => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static BDA_DrmPairing_Aborted => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static BDA_DrmPairing_NeedSDKUpdate => 9
}
