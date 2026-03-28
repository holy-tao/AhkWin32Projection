#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpeechAudioFormat.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechBaseStream extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechBaseStream
     * @type {Guid}
     */
    static IID => Guid("{6450336f-7d49-4ced-8097-49d6dee37294}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Format", "putref_Format", "Read", "Write", "Seek"]

    /**
     * @type {ISpeechAudioFormat} 
     */
    Format {
        get => this.get_Format()
    }

    /**
     * 
     * @returns {ISpeechAudioFormat} 
     */
    get_Format() {
        result := ComCall(7, this, "ptr*", &AudioFormat := 0, "HRESULT")
        return ISpeechAudioFormat(AudioFormat)
    }

    /**
     * 
     * @param {ISpeechAudioFormat} AudioFormat 
     * @returns {HRESULT} 
     */
    putref_Format(AudioFormat) {
        result := ComCall(8, this, "ptr", AudioFormat, "HRESULT")
        return result
    }

    /**
     * The ReadBlobFromFile function reads a BLOB in a file.
     * @param {Pointer<VARIANT>} _Buffer 
     * @param {Integer} NumberOfBytes 
     * @param {Pointer<Integer>} BytesRead 
     * @returns {HRESULT} If the function is successful, the return value is NMERR\_SUCCESS.
     * 
     * If the function is unsuccessful, the return value is a NMERR value that indicates the error.
     * @see https://learn.microsoft.com/windows/win32/NetMon2/readblobfromfile
     */
    Read(_Buffer, NumberOfBytes, BytesRead) {
        BytesReadMarshal := BytesRead is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "ptr", _Buffer, "int", NumberOfBytes, BytesReadMarshal, BytesRead, "HRESULT")
        return result
    }

    /**
     * The WriteBackRootHintDatafile method writes the RootHints back to the DNS Cache file.
     * @param {VARIANT} _Buffer 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/DNS/microsoftdns-roothints-writebackroothintdatafile
     */
    Write(_Buffer) {
        result := ComCall(10, this, "ptr", _Buffer, "int*", &BytesWritten := 0, "HRESULT")
        return BytesWritten
    }

    /**
     * The Seekable attribute is a file-level attribute specifying whether an application can seek to points within the content.
     * @remarks
     * This is a coded attribute.
     * 
     * This attribute cannot be duplicated at the file level. If this attribute is used for an individual stream, it will be treated as custom metadata and will not convey its normal meaning to the objects of the Windows Media Format SDK.
     * 
     * The value of this attribute for a file may vary depending upon the object exposing the [**IWMHeaderInfo**](/previous-versions/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmheaderinfo) or [**IWMHeaderInfo3**](/previous-versions/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmheaderinfo3) interface used to retrieve it. This is because the reader objects (both synchronous and asynchronous) perform a more thorough check than the metadata editor object does, to ascertain whether you can seek to a point in a file. The **Seekable** attribute value returned by a reader object is more accurate.
     * @param {VARIANT} Position 
     * @param {Integer} Origin 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/seekable
     */
    Seek(Position, Origin) {
        NewPosition := VARIANT()
        result := ComCall(11, this, "ptr", Position, "uint", Origin, "ptr", NewPosition, "HRESULT")
        return NewPosition
    }
}
