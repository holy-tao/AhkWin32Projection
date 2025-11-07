#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsiDirectoryItem.ahk

/**
 * Use this interface to add a directory tree, which includes all sub-directories, files, and associated named streams to a file system image.
 * @remarks
 * 
 * All sub-directories, files, and associated named streams can only be added after the directory item has been  added to the file system image.
 * 
 * UDF must be enabled and set to UDF revision 2.00 or later in order to enable named stream support during the creation of the file system image.
 * 
 * This interface is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nn-imapi2fs-ifsidirectoryitem2
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IFsiDirectoryItem2 extends IFsiDirectoryItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsiDirectoryItem2
     * @type {Guid}
     */
    static IID => Guid("{f7fb4b9b-6d96-4d7b-9115-201b144811ef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 29

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddTreeWithNamedStreams"]

    /**
     * 
     * @param {BSTR} sourceDirectory 
     * @param {VARIANT_BOOL} includeBaseDirectory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsidirectoryitem2-addtreewithnamedstreams
     */
    AddTreeWithNamedStreams(sourceDirectory, includeBaseDirectory) {
        sourceDirectory := sourceDirectory is String ? BSTR.Alloc(sourceDirectory).Value : sourceDirectory

        result := ComCall(29, this, "ptr", sourceDirectory, "short", includeBaseDirectory, "HRESULT")
        return result
    }
}
