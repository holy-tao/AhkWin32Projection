#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to enable VDS to perform miscellaneous operations on provider objects.
 * @see https://docs.microsoft.com/windows/win32/api//vdshwprv/nn-vdshwprv-ivdsproviderprivate
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsProviderPrivate extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsProviderPrivate
     * @type {Guid}
     */
    static IID => Guid("{11f3cd41-b7e8-48ff-9472-9dff018aa292}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetObject", "OnLoad", "OnUnload"]

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {Guid} ObjectId 
     * @param {Integer} type 
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject(ObjectId, type) {
        result := ComCall(3, this, "ptr", ObjectId, "int", type, "ptr*", &ppObjectUnk := 0, "HRESULT")
        return IUnknown(ppObjectUnk)
    }

    /**
     * 
     * @param {PWSTR} pwszMachineName 
     * @param {IUnknown} pCallbackObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsproviderprivate-onload
     */
    OnLoad(pwszMachineName, pCallbackObject) {
        pwszMachineName := pwszMachineName is String ? StrPtr(pwszMachineName) : pwszMachineName

        result := ComCall(4, this, "ptr", pwszMachineName, "ptr", pCallbackObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bForceUnload 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsproviderprivate-onunload
     */
    OnUnload(bForceUnload) {
        result := ComCall(5, this, "int", bForceUnload, "HRESULT")
        return result
    }
}
