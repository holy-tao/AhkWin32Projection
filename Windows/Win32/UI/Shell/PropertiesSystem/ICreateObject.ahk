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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateObject"]

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-icreateobject-createobject
     */
    CreateObject(clsid, pUnkOuter, riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", clsid, "ptr", pUnkOuter, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }
}
