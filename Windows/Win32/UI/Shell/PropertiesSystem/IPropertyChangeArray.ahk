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
     * Gets the number of change operations in the array.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer to the number of change operations.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertychangearray-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pcOperations := 0, "HRESULT")
        return pcOperations
    }

    /**
     * Gets the change operation at a specified array index.
     * @param {Integer} iIndex Type: <b>UINT</b>
     * 
     * The index of the change to retrieve.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the desired IID.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * The address of a pointer to the interface specified by <i>riid</i>, usually <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertychange">IPropertyChange</a>.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertychangearray-getat
     */
    GetAt(iIndex, riid) {
        result := ComCall(4, this, "uint", iIndex, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Inserts a change operation into an array at the specified position.
     * @param {Integer} iIndex Type: <b>UINT</b>
     * 
     * The index at which the change is inserted.
     * @param {IPropertyChange} ppropChange Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertychange">IPropertyChange</a>*</b>
     * 
     * A pointer to the interface that contains the change.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertychangearray-insertat
     */
    InsertAt(iIndex, ppropChange) {
        result := ComCall(5, this, "uint", iIndex, "ptr", ppropChange, "HRESULT")
        return result
    }

    /**
     * Inserts a change operation at the end of an array.
     * @param {IPropertyChange} ppropChange Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertychange">IPropertyChange</a>*</b>
     * 
     * A pointer to the interface that contains the change.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertychangearray-append
     */
    Append(ppropChange) {
        result := ComCall(6, this, "ptr", ppropChange, "HRESULT")
        return result
    }

    /**
     * Replaces the first occurrence of a change that affects the same property key as the provided change. If the property key is not already in the array, this method appends the change to the end of the array.
     * @param {IPropertyChange} ppropChange Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertychange">IPropertyChange</a>*</b>
     * 
     * A pointer to the interface that contains the change
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertychangearray-appendorreplace
     */
    AppendOrReplace(ppropChange) {
        result := ComCall(7, this, "ptr", ppropChange, "HRESULT")
        return result
    }

    /**
     * Removes a specified change.
     * @param {Integer} iIndex Type: <b>UINT</b>
     * 
     * The index of the change to remove.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertychangearray-removeat
     */
    RemoveAt(iIndex) {
        result := ComCall(8, this, "uint", iIndex, "HRESULT")
        return result
    }

    /**
     * Specifies whether a particular property key exists in the change array.
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure of interest.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if key is found; otherwise, E_FAIL.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertychangearray-iskeyinarray
     */
    IsKeyInArray(key) {
        result := ComCall(9, this, "ptr", key, "HRESULT")
        return result
    }
}
