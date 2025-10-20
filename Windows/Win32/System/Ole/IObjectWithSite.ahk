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
     * 
     * @param {Pointer<IUnknown>} pUnkSite 
     * @returns {HRESULT} 
     */
    SetSite(pUnkSite) {
        result := ComCall(3, this, "ptr", pUnkSite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvSite 
     * @returns {HRESULT} 
     */
    GetSite(riid, ppvSite) {
        result := ComCall(4, this, "ptr", riid, "ptr", ppvSite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
