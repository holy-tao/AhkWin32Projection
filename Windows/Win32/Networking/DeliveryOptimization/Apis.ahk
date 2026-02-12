#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\System\WinRT\Apis.ahk
#Include ..\..\System\WinRT\HSTRING.ahk

/**
 * @namespace Windows.Win32.Networking.DeliveryOptimization
 * @version v4.0.30319
 */
class DeliveryOptimization {

;@region Constants

    /**
     * @type {HSTRING}
     */
    static DecryptionInfo_KeyData => "KeyData"

    /**
     * @type {HSTRING}
     */
    static DecryptionInfo_EncryptionBufferSize => "EncryptionBufferSize"

    /**
     * @type {HSTRING}
     */
    static DecryptionInfo_AlgorithmName => "AlgorithmName"

    /**
     * @type {HSTRING}
     */
    static DecryptionInfo_ChainingMode => "ChainingMode"

    /**
     * @type {HSTRING}
     */
    static IntegrityCheckInfo_PiecesHashFileUrl => "PiecesHashFileUrl"

    /**
     * @type {HSTRING}
     */
    static IntegrityCheckInfo_PiecesHashFileDigest => "PiecesHashFileDigest"

    /**
     * @type {HSTRING}
     */
    static IntegrityCheckInfo_PiecesHashFileDigestAlgorithm => "PiecesHashFileDigestAlgorithm"

    /**
     * @type {HSTRING}
     */
    static IntegrityCheckInfo_HashOfHashes => "HashOfHashes"
;@endregion Constants

;@region Methods
;@endregion Methods
}
