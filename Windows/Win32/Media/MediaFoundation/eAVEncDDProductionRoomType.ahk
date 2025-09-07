#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the room type for a Dolby Digital audio stream. This enumeration is used with the AVEncDDProductionRoomType property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencddproductionroomtype
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncDDProductionRoomType{

    /**
     * The room type is not indicated.
     * @type {Integer (Int32)}
     */
    static eAVEncDDProductionRoomType_NotIndicated => 0

    /**
     * Large room.
     * @type {Integer (Int32)}
     */
    static eAVEncDDProductionRoomType_Large => 1

    /**
     * Small room.
     * @type {Integer (Int32)}
     */
    static eAVEncDDProductionRoomType_Small => 2
}
