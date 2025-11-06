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
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} dwCreateFlags 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatadispenser-definescope
     */
    DefineScope(rclsid, dwCreateFlags, riid) {
        result := ComCall(3, this, "ptr", rclsid, "uint", dwCreateFlags, "ptr", riid, "ptr*", &ppIUnk := 0, "HRESULT")
        return IUnknown(ppIUnk)
    }

    /**
     * 
     * @param {PWSTR} szScope 
     * @param {Integer} dwOpenFlags 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatadispenser-openscope
     */
    OpenScope(szScope, dwOpenFlags, riid) {
        szScope := szScope is String ? StrPtr(szScope) : szScope

        result := ComCall(4, this, "ptr", szScope, "uint", dwOpenFlags, "ptr", riid, "ptr*", &ppIUnk := 0, "HRESULT")
        return IUnknown(ppIUnk)
    }

    /**
     * 
     * @param {Pointer<Void>} pData 
     * @param {Integer} cbData 
     * @param {Integer} dwOpenFlags 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatadispenser-openscopeonmemory
     */
    OpenScopeOnMemory(pData, cbData, dwOpenFlags, riid) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pDataMarshal, pData, "uint", cbData, "uint", dwOpenFlags, "ptr", riid, "ptr*", &ppIUnk := 0, "HRESULT")
        return IUnknown(ppIUnk)
    }
}
