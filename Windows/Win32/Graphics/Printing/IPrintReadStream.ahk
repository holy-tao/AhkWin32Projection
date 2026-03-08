#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintReadStream extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintReadStream
     * @type {Guid}
     */
    static IID => Guid("{4d47a67c-66cc-4430-850e-daf466fe5bc4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Seek", "ReadBytes"]

    /**
     * The Seekable attribute is a file-level attribute specifying whether an application can seek to points within the content.
     * @remarks
     * This is a coded attribute.
     * 
     * This attribute cannot be duplicated at the file level. If this attribute is used for an individual stream, it will be treated as custom metadata and will not convey its normal meaning to the objects of the Windows Media Format SDK.
     * 
     * The value of this attribute for a file may vary depending upon the object exposing the [**IWMHeaderInfo**](/previous-versions/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmheaderinfo) or [**IWMHeaderInfo3**](/previous-versions/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmheaderinfo3) interface used to retrieve it. This is because the reader objects (both synchronous and asynchronous) perform a more thorough check than the metadata editor object does, to ascertain whether you can seek to a point in a file. The **Seekable** attribute value returned by a reader object is more accurate.
     * @param {Integer} dlibMove 
     * @param {Integer} dwOrigin 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/seekable
     */
    Seek(dlibMove, dwOrigin) {
        result := ComCall(3, this, "int64", dlibMove, "uint", dwOrigin, "uint*", &plibNewPosition := 0, "HRESULT")
        return plibNewPosition
    }

    /**
     * 
     * @param {Pointer} pvBuffer 
     * @param {Integer} cbRequested 
     * @param {Pointer<Integer>} pcbRead 
     * @param {Pointer<BOOL>} pbEndOfFile 
     * @returns {HRESULT} 
     */
    ReadBytes(pvBuffer, cbRequested, pcbRead, pbEndOfFile) {
        pcbReadMarshal := pcbRead is VarRef ? "uint*" : "ptr"
        pbEndOfFileMarshal := pbEndOfFile is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pvBuffer, "uint", cbRequested, pcbReadMarshal, pcbRead, pbEndOfFileMarshal, pbEndOfFile, "HRESULT")
        return result
    }
}
