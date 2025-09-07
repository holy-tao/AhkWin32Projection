#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.Endpoints
 * @version v4.0.30319
 */
class EndpointConnectorType{

    /**
     * @type {Integer (Int32)}
     */
    static eHostProcessConnector => 0

    /**
     * @type {Integer (Int32)}
     */
    static eOffloadConnector => 1

    /**
     * @type {Integer (Int32)}
     */
    static eLoopbackConnector => 2

    /**
     * @type {Integer (Int32)}
     */
    static eKeywordDetectorConnector => 3

    /**
     * @type {Integer (Int32)}
     */
    static eConnectorCount => 4
}
