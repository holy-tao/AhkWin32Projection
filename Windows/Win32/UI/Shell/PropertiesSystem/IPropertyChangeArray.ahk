#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for several multiple change operations that may be passed to IFileOperation.
 * @remarks
 * 
  * Either call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> with a class identifier (CLSID) of <b>CLSID_PropertyChangeArray</b> or call <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-pscreatepropertychangearray">PSCreatePropertyChangeArray</a> to obtain a standard implementation of this interface. This is a container interface that allows multiple changes to be passed to a single file operation to prevent accessing a file multiple times.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-ipropertychangearray
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IPropertyChangeArray extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyChangeArray
     * @type {Guid}
     */
    static IID => Guid("{380f5cad-1b5e-42f2-805d-637fd392d31e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAt", "InsertAt", "Append", "AppendOrReplace", "RemoveAt", "IsKeyInArray"]

    /**
     * 
     * @param {Pointer<Integer>} pcOperations 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertychangearray-getcount
     */
    GetCount(pcOperations) {
        result := ComCall(3, this, "uint*", pcOperations, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertychangearray-getat
     */
    GetAt(iIndex, riid, ppv) {
        result := ComCall(4, this, "uint", iIndex, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {IPropertyChange} ppropChange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertychangearray-insertat
     */
    InsertAt(iIndex, ppropChange) {
        result := ComCall(5, this, "uint", iIndex, "ptr", ppropChange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPropertyChange} ppropChange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertychangearray-append
     */
    Append(ppropChange) {
        result := ComCall(6, this, "ptr", ppropChange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPropertyChange} ppropChange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertychangearray-appendorreplace
     */
    AppendOrReplace(ppropChange) {
        result := ComCall(7, this, "ptr", ppropChange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertychangearray-removeat
     */
    RemoveAt(iIndex) {
        result := ComCall(8, this, "uint", iIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertychangearray-iskeyinarray
     */
    IsKeyInArray(key) {
        result := ComCall(9, this, "ptr", key, "HRESULT")
        return result
    }
}
