#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * Contains the data and metadata of files to write into the app package.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/ns-appxpackaging-appx_package_writer_payload_stream
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
     * @type {PWSTR}
     */
    fileName{
        get {
            if(!this.HasProp("__fileName"))
                this.__fileName := PWSTR(this.ptr + 8)
            return this.__fileName
        }
    }

    /**
     * The content type of the payload file.
     * @type {PWSTR}
     */
    contentType{
        get {
            if(!this.HasProp("__contentType"))
                this.__contentType := PWSTR(this.ptr + 16)
            return this.__contentType
        }
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
