#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrinterScriptableSequentialStream.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterScriptableStream extends IPrinterScriptableSequentialStream{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinterScriptableStream
     * @type {Guid}
     */
    static IID => Guid("{7edf9a92-4750-41a5-a17f-879a6f4f7dcb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Commit", "Seek", "SetSize"]

    /**
     * Indicates that a resource manager (RM) has finished committing a transaction that was requested by the transaction manager (TM).
     * @returns {HRESULT} If the function succeeds, the return value is nonzero. 
     * 
     * 
     *   
     * 
     * If the function fails, the return value is zero (0). To get extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     *  The following list identifies the possible error codes:
     * @see https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-commitcomplete
     */
    Commit() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * The Seekable attribute is a file-level attribute specifying whether an application can seek to points within the content.
     * @remarks
     * This is a coded attribute.
     * 
     * This attribute cannot be duplicated at the file level. If this attribute is used for an individual stream, it will be treated as custom metadata and will not convey its normal meaning to the objects of the Windows Media Format SDK.
     * 
     * The value of this attribute for a file may vary depending upon the object exposing the [**IWMHeaderInfo**](/previous-versions/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmheaderinfo) or [**IWMHeaderInfo3**](/previous-versions/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmheaderinfo3) interface used to retrieve it. This is because the reader objects (both synchronous and asynchronous) perform a more thorough check than the metadata editor object does, to ascertain whether you can seek to a point in a file. The **Seekable** attribute value returned by a reader object is more accurate.
     * @param {Integer} lOffset 
     * @param {Integer} streamSeek 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/seekable
     */
    Seek(lOffset, streamSeek) {
        result := ComCall(10, this, "int", lOffset, "uint", streamSeek, "int*", &plPosition := 0, "HRESULT")
        return plPosition
    }

    /**
     * 
     * @param {Integer} lSize 
     * @returns {HRESULT} 
     */
    SetSize(lSize) {
        result := ComCall(11, this, "int", lSize, "HRESULT")
        return result
    }
}
