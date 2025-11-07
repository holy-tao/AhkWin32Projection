#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOleContainer.ahk

/**
 * Used by item monikers when they are bound to the objects they identify.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-ioleitemcontainer
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleItemContainer extends IOleContainer{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleItemContainer
     * @type {Guid}
     */
    static IID => Guid("{0000011c-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetObject", "GetObjectStorage", "IsRunning"]

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {PWSTR} pszItem 
     * @param {Integer} dwSpeedNeeded 
     * @param {IBindCtx} pbc 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject(pszItem, dwSpeedNeeded, pbc, riid) {
        pszItem := pszItem is String ? StrPtr(pszItem) : pszItem

        result := ComCall(6, this, "ptr", pszItem, "uint", dwSpeedNeeded, "ptr", pbc, "ptr", riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    /**
     * 
     * @param {PWSTR} pszItem 
     * @param {IBindCtx} pbc 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleitemcontainer-getobjectstorage
     */
    GetObjectStorage(pszItem, pbc, riid) {
        pszItem := pszItem is String ? StrPtr(pszItem) : pszItem

        result := ComCall(7, this, "ptr", pszItem, "ptr", pbc, "ptr", riid, "ptr*", &ppvStorage := 0, "HRESULT")
        return ppvStorage
    }

    /**
     * 
     * @param {PWSTR} pszItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleitemcontainer-isrunning
     */
    IsRunning(pszItem) {
        pszItem := pszItem is String ? StrPtr(pszItem) : pszItem

        result := ComCall(8, this, "ptr", pszItem, "HRESULT")
        return result
    }
}
