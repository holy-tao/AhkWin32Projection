#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * Provides methods to create a new metadata scope, or open an existing one.
 * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nn-rometadataapi-imetadatadispenser
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IMetaDataDispenser extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMetaDataDispenser
     * @type {Guid}
     */
    static IID => Guid("{809c652e-7396-11d2-9771-00a0c9b4d50c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DefineScope", "OpenScope", "OpenScopeOnMemory"]

    /**
     * Creates a new area in memory in which you can create new metadata.
     * @param {Pointer<Guid>} rclsid The CLSID of the version of metadata structures to be created.
     * @param {Integer} dwCreateFlags Flags that specify options.
     * @param {Pointer<Guid>} riid The IID of the desired metadata interface to be returned. The caller will use the interface to create the new metadata.
     * 
     * The value of riid must specify one of the "emit" interfaces. Valid values are <b>IID_IMetaDataEmit</b>, <b>IID_IMetaDataAssemblyEmit</b>, or <b>IID_IMetaDataEmit2</b>.
     * @returns {IUnknown} The pointer to the returned interface.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatadispenser-definescope
     */
    DefineScope(rclsid, dwCreateFlags, riid) {
        result := ComCall(3, this, "ptr", rclsid, "uint", dwCreateFlags, "ptr", riid, "ptr*", &ppIUnk := 0, "HRESULT")
        return IUnknown(ppIUnk)
    }

    /**
     * Opens an existing file from disk, and maps its metadata into memory for reading.
     * @param {PWSTR} szScope `[in]`
     * 
     * The name of the file to be opened. The file must contain common language runtime (CLR) metadata.
     * @param {Integer} dwOpenFlags `[in]`
     * 
     * Specifies the mode (read, and so on) for opening. This is a value of the <a href="https://docs.microsoft.com/dotnet/framework/unmanaged-api/metadata/coropenflags-enumeration">CorOpenFlags</a> enumeration. You can only import (read) from the file, not emit (write) to it.
     * @param {Pointer<Guid>} riid `[in]`
     * 
     * The IID of the desired metadata interface to be returned; the caller will use the interface to import (read) metadata.
     * 
     * Valid values for *riid* include **IID_IUnknown**, **IID_IMetaDataImport**, **IID_IMetaDataImport2**, **IID_IMetaDataAssemblyImport**, **IID_IMetaDataTables**, and **IID_IMetaDataTables2**.
     * @returns {IUnknown} `[out]`
     * 
     * The pointer to the returned interface.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatadispenser-openscope
     */
    OpenScope(szScope, dwOpenFlags, riid) {
        szScope := szScope is String ? StrPtr(szScope) : szScope

        result := ComCall(4, this, "ptr", szScope, "uint", dwOpenFlags, "ptr", riid, "ptr*", &ppIUnk := 0, "HRESULT")
        return IUnknown(ppIUnk)
    }

    /**
     * Opens an area of memory that contains existing metadata. That is, this method opens a specified area of memory in which the existing data is treated as metadata.
     * @param {Pointer<Void>} pData A pointer that specifies the starting address of the memory area.
     * @param {Integer} cbData The size of the memory area, in bytes.
     * @param {Integer} dwOpenFlags A value of the <a href="https://docs.microsoft.com/dotnet/framework/unmanaged-api/metadata/coropenflags-enumeration">CorOpenFlags</a> enumeration to specify the mode (read, write, and so on) for opening.
     * @param {Pointer<Guid>} riid The IID of the desired metadata interface to be returned; the caller will use the interface to import (read) or emit (write) metadata.
     * 
     * The value of riid must specify one of the "import" or "emit" interfaces. Valid values are <b>IID_IMetaDataEmit</b>, <b>IID_IMetaDataImport</b>, <b>IID_IMetaDataAssemblyEmit</b>, <b>IID_IMetaDataAssemblyImport</b>, <b>IID_IMetaDataEmit2</b>, or <b>IID_IMetaDataImport2</b>.
     * @returns {IUnknown} The pointer to the returned interface.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatadispenser-openscopeonmemory
     */
    OpenScopeOnMemory(pData, cbData, dwOpenFlags, riid) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pDataMarshal, pData, "uint", cbData, "uint", dwOpenFlags, "ptr", riid, "ptr*", &ppIUnk := 0, "HRESULT")
        return IUnknown(ppIUnk)
    }
}
