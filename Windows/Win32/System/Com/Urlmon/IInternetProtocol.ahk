#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IInternetProtocolRoot.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetProtocol extends IInternetProtocolRoot{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInternetProtocol
     * @type {Guid}
     */
    static IID => Guid("{79eac9e4-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Read", "Seek", "LockRequest", "UnlockRequest"]

    /**
     * The ReadBlobFromFile function reads a BLOB in a file.
     * @param {Pointer<Void>} pv 
     * @param {Integer} cb 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/NetMon2/readblobfromfile
     */
    Read(pv, cb) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, pvMarshal, pv, "uint", cb, "uint*", &pcbRead := 0, "HRESULT")
        return pcbRead
    }

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
        result := ComCall(10, this, "int64", dlibMove, "uint", dwOrigin, "uint*", &plibNewPosition := 0, "HRESULT")
        return plibNewPosition
    }

    /**
     * 
     * @param {Integer} dwOptions 
     * @returns {HRESULT} 
     */
    LockRequest(dwOptions) {
        result := ComCall(11, this, "uint", dwOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnlockRequest() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
