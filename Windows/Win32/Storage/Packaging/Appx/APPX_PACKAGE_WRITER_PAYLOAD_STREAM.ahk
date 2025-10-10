#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the data and metadata of files to write into the app package.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/ns-appxpackaging-appx_package_writer_payload_stream
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class APPX_PACKAGE_WRITER_PAYLOAD_STREAM extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The source of the payload file.
     * @type {Pointer<IStream>}
     */
    inputStream {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Name of the payload file.
     * @type {Pointer<Char>}
     */
    fileName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The content type of the payload file.
     * @type {Pointer<Char>}
     */
    contentType {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The degree of compression used for the file in the package.
     * @type {Integer}
     */
    compressionOption {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
