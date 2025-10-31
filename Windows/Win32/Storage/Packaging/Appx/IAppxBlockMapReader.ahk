#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents a read-only object model for block maps that provides access to the file attributes and block hashes.
 * @remarks
 * 
  * The <b>IAppxBlockMapReader</b> represents the <b>BlockMap</b> root element of the block map. <b>File</b> elements are the child elements of the <b>BlockMap</b> element.
  * 
  * This object can be retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxfactory-createblockmapreader">CreateBlockMapReader</a> or <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxfactory-createvalidatedblockmapreader">CreateValidatedBlockMapReader</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxfactory">IAppxFactory</a> interface, or the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxpackagereader-getblockmap">GetBlockMap </a>method of the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxpackagereader">IAppxPackageReader</a> interface.
  * 
  * For a code example, see the [Query app package and app manifest sample](https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/AppxPackingDescribeAppx).
  * 
  * <div class="code"></div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxblockmapreader
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBlockMapReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxBlockMapReader
     * @type {Guid}
     */
    static IID => Guid("{5efec991-bca3-42d1-9ec2-e92d609ec22a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFile", "GetFiles", "GetHashMethod", "GetStream"]

    /**
     * 
     * @param {PWSTR} filename 
     * @param {Pointer<IAppxBlockMapFile>} file 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxblockmapreader-getfile
     */
    GetFile(filename, file) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(3, this, "ptr", filename, "ptr*", file, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IAppxBlockMapFilesEnumerator>} enumerator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxblockmapreader-getfiles
     */
    GetFiles(enumerator) {
        result := ComCall(4, this, "ptr*", enumerator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUri>} hashMethod 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxblockmapreader-gethashmethod
     */
    GetHashMethod(hashMethod) {
        result := ComCall(5, this, "ptr*", hashMethod, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} blockMapStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxblockmapreader-getstream
     */
    GetStream(blockMapStream) {
        result := ComCall(6, this, "ptr*", blockMapStream, "HRESULT")
        return result
    }
}
