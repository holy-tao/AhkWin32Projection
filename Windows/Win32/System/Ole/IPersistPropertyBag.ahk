#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IPersist.ahk

/**
 * Works with [IPropertyBag](/windows/win32/api/oaidl/nn-oaidl-ipropertybag) and [IErrorlog](/windows/win32/api/oaidl/nn-oaidl-ierrorlog) to define an individual property-based persistence mechanism.
 * @remarks
 * **IPersistPropertyBag** provides an object with an IPropertyBag interface through which it can save and load individual properties. The object that implements **IPropertyBag** can then save those properties in various ways, such as name/value pairs in a text file. Errors encountered in the process (on either side) are recorded in an error log through IErrorlog. This error reporting mechanism works on a per-property basis instead of on all properties at once.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-ipersistpropertybag
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
     * Informs the object that it is being initialized as a newly created object.
     * @remarks
     * E_NOTIMPL should not be returned. Return S_OK, even if the object does not perform any function in this method.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipersistpropertybag-initnew
     */
    InitNew() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Instructs the object to initialize itself using the properties available in the property bag, and to notify the provided error log object when errors occur.
     * @remarks
     * All property loading must take place in the **IPersistPropertyBag::Load** function call, because the object cannot hold the IPropertyBag pointer.
     * 
     * E_NOTIMPL is not a valid return code, because any object that implements this interface must support the entire functionality of the interface.
     * @param {IPropertyBag} pPropBag The address of the caller's property bag, through which the object can read properties. This cannot be NULL.
     * @param {IErrorLog} pErrorLog The address of the caller's error log, in which the object stores any errors that occur during initialization. This can be NULL; in which case, the caller does not receive errors.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipersistpropertybag-load
     */
    Load(pPropBag, pErrorLog) {
        result := ComCall(5, this, "ptr", pPropBag, "ptr", pErrorLog, "HRESULT")
        return result
    }

    /**
     * Instructs the object to save its properties to the given property bag, and optionally, to clear the object's dirty flag.
     * @remarks
     * The caller can request that the object save all properties, or save only those properties that have changed.
     * 
     * E_NOTIMPL is not a valid return code, because any object that implements this interface must support the entire functionality of the interface.
     * @param {IPropertyBag} pPropBag The address of the caller's property bag, through which the object can write properties. This cannot be NULL.
     * @param {BOOL} fClearDirty A flag indicating whether the object should clear its dirty flag when the "Save" operation is complete. TRUE means clear the flag, and FALSE means leave the flag unaffected. FALSE is used when the caller performs a "Save Copy As" operation.
     * @param {BOOL} fSaveAllProperties A flag indicating whether the object should save all its properties (TRUE), or save only those properties that have changed from the default value (FALSE).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipersistpropertybag-save
     */
    Save(pPropBag, fClearDirty, fSaveAllProperties) {
        result := ComCall(6, this, "ptr", pPropBag, "int", fClearDirty, "int", fSaveAllProperties, "HRESULT")
        return result
    }
}
