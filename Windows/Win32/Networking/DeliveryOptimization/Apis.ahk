#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Networking.DeliveryOptimization
 */
class DeliveryOptimization {

;@region Constants

    /**
     * @type {String}
     */
    static DecryptionInfo_KeyData => "KeyData"

    /**
     * @type {String}
     */
    static DecryptionInfo_EncryptionBufferSize => "EncryptionBufferSize"

    /**
     * @type {String}
     */
    static DecryptionInfo_AlgorithmName => "AlgorithmName"

    /**
     * @type {String}
     */
    static DecryptionInfo_ChainingMode => "ChainingMode"

    /**
     * @type {String}
     */
    static IntegrityCheckInfo_PiecesHashFileUrl => "PiecesHashFileUrl"

    /**
     * @type {String}
     */
    static IntegrityCheckInfo_PiecesHashFileDigest => "PiecesHashFileDigest"

    /**
     * @type {String}
     */
    static IntegrityCheckInfo_PiecesHashFileDigestAlgorithm => "PiecesHashFileDigestAlgorithm"

    /**
     * @type {String}
     */
    static IntegrityCheckInfo_HashOfHashes => "HashOfHashes"

    /**
     * @type {Guid}
     */
    static LIBID_DeliveryOptimization => Guid("{5b99fa76-721c-423c-adac-56d03c8a8007}")
;@endregion Constants

;@region Methods
;@endregion Methods
}
