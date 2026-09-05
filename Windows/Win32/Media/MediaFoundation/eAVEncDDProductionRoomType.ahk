#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the room type for a Dolby Digital audio stream. This enumeration is used with the AVEncDDProductionRoomType property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencddproductionroomtype
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncDDProductionRoomType extends Win32Enum {

    /**
     * The room type is not indicated.
     * Native name: eAVEncDDProductionRoomType_NotIndicated
     * @type {Integer (Int32)}
     */
    static NotIndicated => 0

    /**
     * Large room.
     * Native name: eAVEncDDProductionRoomType_Large
     * @type {Integer (Int32)}
     */
    static Large => 1

    /**
     * Small room.
     * Native name: eAVEncDDProductionRoomType_Small
     * @type {Integer (Int32)}
     */
    static Small => 2
}
