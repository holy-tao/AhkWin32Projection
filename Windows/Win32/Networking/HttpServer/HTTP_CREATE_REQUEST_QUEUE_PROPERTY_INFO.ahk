#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_CREATE_REQUEST_QUEUE_PROPERTY_ID.ahk" { HTTP_CREATE_REQUEST_QUEUE_PROPERTY_ID }

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_CREATE_REQUEST_QUEUE_PROPERTY_INFO {
    #StructPack 8

    PropertyId : HTTP_CREATE_REQUEST_QUEUE_PROPERTY_ID

    PropertyInfoLength : UInt32

    PropertyInfo : IntPtr

}
