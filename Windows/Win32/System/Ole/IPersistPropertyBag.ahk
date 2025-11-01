#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IPersist.ahk

/**
 * Works with [IPropertyBag](../aoidl/nn-oaidl-ipropertybag.md) and [IErrorlog](../aoidl/nn-oaidl-ierrorlog.md) to define an individual property-based persistence mechanism.
 * @remarks
 * 
  * **IPersistPropertyBag** provides an object with an IPropertyBag interface through which it can save and load individual properties. The object that implements **IPropertyBag** can then save those properties in various ways, such as name/value pairs in a text file. Errors encountered in the process (on either side) are recorded in an error log through IErrorlog. This error reporting mechanism works on a per-property basis instead of on all properties at once.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-ipersistpropertybag
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IPersistPropertyBag extends IPersist{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPersistPropertyBag
     * @type {Guid}
     */
    static IID => Guid("{37d84f60-42cb-11ce-8135-00aa004bb851}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitNew", "Load", "Save"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipersistpropertybag-initnew
     */
    InitNew() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPropertyBag} pPropBag 
     * @param {IErrorLog} pErrorLog 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipersistpropertybag-load
     */
    Load(pPropBag, pErrorLog) {
        result := ComCall(5, this, "ptr", pPropBag, "ptr", pErrorLog, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPropertyBag} pPropBag 
     * @param {BOOL} fClearDirty 
     * @param {BOOL} fSaveAllProperties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipersistpropertybag-save
     */
    Save(pPropBag, fClearDirty, fSaveAllProperties) {
        result := ComCall(6, this, "ptr", pPropBag, "int", fClearDirty, "int", fSaveAllProperties, "HRESULT")
        return result
    }
}
