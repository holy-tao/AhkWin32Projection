#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxContentGroupMapReader.ahk
#Include .\IAppxSourceContentGroupMapReader.ahk
#Include .\IAppxContentGroupMapWriter.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Creates objects for reading and writing app packages.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxfactory2
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxFactory2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxFactory2
     * @type {Guid}
     */
    static IID => Guid("{f1346df2-c282-4e22-b918-743a929a8d55}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateContentGroupMapReader", "CreateSourceContentGroupMapReader", "CreateContentGroupMapWriter"]

    /**
     * Creates an IAppxContentGroupMapReader.
     * @param {IStream} inputStream The stream that delivers the content group map XML for reading.
     * @returns {IAppxContentGroupMapReader} The content group map reader.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxfactory2-createcontentgroupmapreader
     */
    CreateContentGroupMapReader(inputStream) {
        result := ComCall(3, this, "ptr", inputStream, "ptr*", &contentGroupMapReader := 0, "HRESULT")
        return IAppxContentGroupMapReader(contentGroupMapReader)
    }

    /**
     * Creates an IAppxSourceContentGroupMapReader.
     * @param {IStream} inputStream The stream that delivers the source content group map XML for reading.
     * @returns {IAppxSourceContentGroupMapReader} 
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxfactory2-createsourcecontentgroupmapreader
     */
    CreateSourceContentGroupMapReader(inputStream) {
        result := ComCall(4, this, "ptr", inputStream, "ptr*", &reader := 0, "HRESULT")
        return IAppxSourceContentGroupMapReader(reader)
    }

    /**
     * Creates an IAppxContentGroupMapWriter.
     * @param {IStream} stream The stream that receives the content group map.
     * @returns {IAppxContentGroupMapWriter} Provides a write-only object model for a content group map.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxfactory2-createcontentgroupmapwriter
     */
    CreateContentGroupMapWriter(stream) {
        result := ComCall(5, this, "ptr", stream, "ptr*", &contentGroupMapWriter := 0, "HRESULT")
        return IAppxContentGroupMapWriter(contentGroupMapWriter)
    }
}
