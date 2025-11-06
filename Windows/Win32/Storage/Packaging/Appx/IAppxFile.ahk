#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IStream.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Retrieves information about a payload or footprint file in a package.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxfile
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxFile extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxFile
     * @type {Guid}
     */
    static IID => Guid("{91df827b-94fd-468f-827b-57f41b2f6f2e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCompressionOption", "GetContentType", "GetName", "GetSize", "GetStream"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxfile-getcompressionoption
     */
    GetCompressionOption() {
        result := ComCall(3, this, "int*", &compressionOption := 0, "HRESULT")
        return compressionOption
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxfile-getcontenttype
     */
    GetContentType() {
        result := ComCall(4, this, "ptr*", &contentType := 0, "HRESULT")
        return contentType
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxfile-getname
     */
    GetName() {
        result := ComCall(5, this, "ptr*", &fileName := 0, "HRESULT")
        return fileName
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxfile-getsize
     */
    GetSize() {
        result := ComCall(6, this, "uint*", &size := 0, "HRESULT")
        return size
    }

    /**
     * 
     * @returns {IStream} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxfile-getstream
     */
    GetStream() {
        result := ComCall(7, this, "ptr*", &stream := 0, "HRESULT")
        return IStream(stream)
    }
}
