#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\APPX_COMPRESSION_OPTION.ahk" { APPX_COMPRESSION_OPTION }
#Import "..\..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains the data and metadata of files to write into the app package.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/ns-appxpackaging-appx_package_writer_payload_stream
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct APPX_PACKAGE_WRITER_PAYLOAD_STREAM {
    #StructPack 8

    /**
     * The source of the payload file.
     */
    inputStream : IStream

    /**
     * Name of the payload file.
     */
    fileName : PWSTR

    /**
     * The content type of the payload file.
     */
    contentType : PWSTR

    /**
     * The degree of compression used for the file in the package.
     */
    compressionOption : APPX_COMPRESSION_OPTION

}
