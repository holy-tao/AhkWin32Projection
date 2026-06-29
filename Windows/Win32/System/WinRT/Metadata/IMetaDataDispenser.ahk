#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods to create a new metadata scope, or open an existing one.
 * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nn-rometadataapi-imetadatadispenser
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct IMetaDataDispenser extends IUnknown {
    /**
     * The interface identifier for IMetaDataDispenser
     * @type {Guid}
     */
    static IID := Guid("{809c652e-7396-11d2-9771-00a0c9b4d50c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMetaDataDispenser interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DefineScope       : IntPtr
        OpenScope         : IntPtr
        OpenScopeOnMemory : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMetaDataDispenser.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a new area in memory in which you can create new metadata.
     * @remarks
     * <b>DefineScope</b> creates a set of in-memory metadata tables, generates a unique GUID (module version identifier, or MVID) for the metadata, and creates an entry in the module table for the compilation unit being emitted.
     * @param {Pointer<Guid>} rclsid The CLSID of the version of metadata structures to be created.
     * @param {Integer} dwCreateFlags Flags that specify options.
     * @param {Pointer<Guid>} riid The IID of the desired metadata interface to be returned. The caller will use the interface to create the new metadata.
     * 
     * The value of riid must specify one of the "emit" interfaces. Valid values are <b>IID_IMetaDataEmit</b>, <b>IID_IMetaDataAssemblyEmit</b>, or <b>IID_IMetaDataEmit2</b>.
     * @returns {IUnknown} The pointer to the returned interface.
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatadispenser-definescope
     */
    DefineScope(rclsid, dwCreateFlags, riid) {
        result := ComCall(3, this, Guid.Ptr, rclsid, "uint", dwCreateFlags, Guid.Ptr, riid, "ptr*", &ppIUnk := 0, "HRESULT")
        return IUnknown(ppIUnk)
    }

    /**
     * Opens an existing file from disk, and maps its metadata into memory for reading.
     * @remarks
     * The in-memory copy of the metadata can be queried using methods from one of the "import" interfaces. If the target file doesn't contain CLR metadata, then the <b>OpenScope</b> method will fail.
     * @param {PWSTR} szScope The name of the file to be opened. The file must contain common language runtime (CLR) metadata.
     * @param {Integer} dwOpenFlags Specifies the mode (read, and so on) for opening. This is a value of the <a href="https://docs.microsoft.com/dotnet/framework/unmanaged-api/metadata/coropenflags-enumeration">CorOpenFlags</a> enumeration. You can only import (read) from the file, not emit (write) to it.
     * @param {Pointer<Guid>} riid The IID of the desired metadata interface to be returned; the caller will use the interface to import (read) metadata.
     * 
     * Valid values for *riid* include **IID_IUnknown**, **IID_IMetaDataImport**, **IID_IMetaDataImport2**, **IID_IMetaDataAssemblyImport**, **IID_IMetaDataTables**, and **IID_IMetaDataTables2**.
     * @returns {IUnknown} The pointer to the returned interface.
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatadispenser-openscope
     */
    OpenScope(szScope, dwOpenFlags, riid) {
        szScope := szScope is String ? StrPtr(szScope) : szScope

        result := ComCall(4, this, "ptr", szScope, "uint", dwOpenFlags, Guid.Ptr, riid, "ptr*", &ppIUnk := 0, "HRESULT")
        return IUnknown(ppIUnk)
    }

    /**
     * Opens an area of memory that contains existing metadata. That is, this method opens a specified area of memory in which the existing data is treated as metadata.
     * @remarks
     * The in-memory copy of the metadata can be queried using methods from one of the "import" interfaces, or added to using methods from the one of the "emit" interfaces.
     * 
     * The <b>OpenScopeOnMemory</b>  method is similar to the <a href="https://docs.microsoft.com/windows/desktop/api/rometadataapi/nf-rometadataapi-imetadatadispenser-openscope">OpenScope</a> method, except that the metadata of interest already exists in memory, rather than in a file on disk.
     * 
     * If the target area of memory does not contain common language runtime (CLR) metadata, the <b>OpenScopeOnMemory</b> method will fail.
     * @param {Pointer<Void>} pData A pointer that specifies the starting address of the memory area.
     * @param {Integer} cbData The size of the memory area, in bytes.
     * @param {Integer} dwOpenFlags A value of the <a href="https://docs.microsoft.com/dotnet/framework/unmanaged-api/metadata/coropenflags-enumeration">CorOpenFlags</a> enumeration to specify the mode (read, write, and so on) for opening.
     * @param {Pointer<Guid>} riid The IID of the desired metadata interface to be returned; the caller will use the interface to import (read) or emit (write) metadata.
     * 
     * The value of riid must specify one of the "import" or "emit" interfaces. Valid values are <b>IID_IMetaDataEmit</b>, <b>IID_IMetaDataImport</b>, <b>IID_IMetaDataAssemblyEmit</b>, <b>IID_IMetaDataAssemblyImport</b>, <b>IID_IMetaDataEmit2</b>, or <b>IID_IMetaDataImport2</b>.
     * @returns {IUnknown} The pointer to the returned interface.
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatadispenser-openscopeonmemory
     */
    OpenScopeOnMemory(pData, cbData, dwOpenFlags, riid) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pDataMarshal, pData, "uint", cbData, "uint", dwOpenFlags, Guid.Ptr, riid, "ptr*", &ppIUnk := 0, "HRESULT")
        return IUnknown(ppIUnk)
    }

    Query(iid) {
        if (IMetaDataDispenser.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DefineScope := CallbackCreate(GetMethod(implObj, "DefineScope"), flags, 5)
        this.vtbl.OpenScope := CallbackCreate(GetMethod(implObj, "OpenScope"), flags, 5)
        this.vtbl.OpenScopeOnMemory := CallbackCreate(GetMethod(implObj, "OpenScopeOnMemory"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DefineScope)
        CallbackFree(this.vtbl.OpenScope)
        CallbackFree(this.vtbl.OpenScopeOnMemory)
    }
}
