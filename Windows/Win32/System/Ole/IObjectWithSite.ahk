#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides a simple way to support communication between an object and its site in the container.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-iobjectwithsite
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IObjectWithSite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectWithSite
     * @type {Guid}
     */
    static IID => Guid("{fc4801a3-2ba9-11cf-a229-00aa003d7352}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSite", "GetSite"]

    /**
     * 
     * @param {IUnknown} pUnkSite 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iobjectwithsite-setsite
     */
    SetSite(pUnkSite) {
        result := ComCall(3, this, "ptr", pUnkSite, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvSite 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iobjectwithsite-getsite
     */
    GetSite(riid, ppvSite) {
        result := ComCall(4, this, "ptr", riid, "ptr*", ppvSite, "HRESULT")
        return result
    }
}
