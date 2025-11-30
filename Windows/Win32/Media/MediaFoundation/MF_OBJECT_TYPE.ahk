#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the object types that are created by the source resolver.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mf_object_type
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_OBJECT_TYPE extends Win32Enum{

    /**
     * Media source. You can query the object for the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasource">IMFMediaSource</a> interface.
     * @type {Integer (Int32)}
     */
    static MF_OBJECT_MEDIASOURCE => 0

    /**
     * Byte stream. You can query the object for the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface.
     * @type {Integer (Int32)}
     */
    static MF_OBJECT_BYTESTREAM => 1

    /**
     * Invalid type.
     * @type {Integer (Int32)}
     */
    static MF_OBJECT_INVALID => 2
}
