#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFileSystemImage2.ahk

/**
 * Use this interface to set or check the metadata and metadata mirror files in a UDF file system (rev 2.50 and later) to determine redundancy.
 * @remarks
 * 
  * If the metadata and metadata mirror files are set for redundancy, IMAPI  creates identical copies of each in the file system image, which results in increased level of fault tolerance. In a scenario where the metadata files are not set for redundancy, IMAPI only creates a single copy in the file system image, which can save several MB of space on the burned disc.
  * 
  * The metadata redundancy option is set to <b>TRUE</b> by default.
  * 
  * <b>IFileSystemImage3</b> is the default interface of <b>MsftFileSystemImage3</b> objects.
  * 
  * This interface is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nn-imapi2fs-ifilesystemimage3
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IFileSystemImage3 extends IFileSystemImage2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileSystemImage3
     * @type {Guid}
     */
    static IID => Guid("{7cff842c-7e97-4807-8304-910dd8f7c051}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 59

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CreateRedundantUdfMetadataFiles", "put_CreateRedundantUdfMetadataFiles", "ProbeSpecificFileSystem"]

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage3-get_createredundantudfmetadatafiles
     */
    get_CreateRedundantUdfMetadataFiles() {
        result := ComCall(59, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage3-put_createredundantudfmetadatafiles
     */
    put_CreateRedundantUdfMetadataFiles(newVal) {
        result := ComCall(60, this, "short", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fileSystemToProbe 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifilesystemimage3-probespecificfilesystem
     */
    ProbeSpecificFileSystem(fileSystemToProbe) {
        result := ComCall(61, this, "int", fileSystemToProbe, "short*", &isAppendable := 0, "HRESULT")
        return isAppendable
    }
}
