#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
class HTTP_CREATE_REQUEST_QUEUE_PROPERTY_ID extends Win32Enum {

    /**
     * Native name: CreateRequestQueueExternalIdProperty
     * @type {Integer (Int32)}
     */
    static ExternalIdProperty => 1

    /**
     * Native name: CreateRequestQueueMax
     * @type {Integer (Int32)}
     */
    static Max => 2
}
