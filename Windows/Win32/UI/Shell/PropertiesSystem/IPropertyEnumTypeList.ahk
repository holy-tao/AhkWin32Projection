#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that enumerate the possible values for a property.
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-ipropertyenumtypelist
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IPropertyEnumTypeList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyEnumTypeList
     * @type {Guid}
     */
    static IID => Guid("{a99400f4-3d84-4557-94ba-1242fb2cc9a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAt", "GetConditionAt", "FindMatchingIndex"]

    /**
     * Gets the number of elements in the list.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * When this method returns, contains a pointer to the number of list elements.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertyenumtypelist-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pctypes := 0, "HRESULT")
        return pctypes
    }

    /**
     * Gets the IPropertyEnumType object at the specified index in the list.
     * @param {Integer} itype Type: <b>UINT</b>
     * 
     * The index of the object in the list.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to retrieve through ppv, typically IID_IShellItem.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns successfully, contains the interface pointer requested in riid. This is typically [IPropertyEnumType](nn-propsys-ipropertyenumtype.md).
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertyenumtypelist-getat
     */
    GetAt(itype, riid) {
        result := ComCall(4, this, "uint", itype, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Not supported.Gets the condition at the specified index.
     * @param {Integer} nIndex Type: <b>UINT</b>
     * 
     * Index of the desired condition.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to retrieve.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the address of an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertyenumtypelist-getconditionat
     */
    GetConditionAt(nIndex, riid) {
        result := ComCall(5, this, "uint", nIndex, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Compares the specified property value against the enumerated values in a list and returns the matching index.
     * @param {Pointer<PROPVARIANT>} propvarCmp Type: <b>REFPROPVARIANT</b>
     * 
     * A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that represents the property value.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * When this method returns, contains a pointer to the index in the enumerated type list that matches the property value, if any.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertyenumtypelist-findmatchingindex
     */
    FindMatchingIndex(propvarCmp) {
        result := ComCall(6, this, "ptr", propvarCmp, "uint*", &pnIndex := 0, "HRESULT")
        return pnIndex
    }
}
