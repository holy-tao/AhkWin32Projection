#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that creates an object of a specified class.
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-icreateobject
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class ICreateObject extends IUnknown{
    /**
     * The interface identifier for ICreateObject
     * @type {Guid}
     */
    static IID => Guid("{75121952-e0d0-43e5-9380-1d80483acf72}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    CreateObject(clsid, pUnkOuter, riid, ppv) {
        result := ComCall(3, this, "ptr", clsid, "ptr", pUnkOuter, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
