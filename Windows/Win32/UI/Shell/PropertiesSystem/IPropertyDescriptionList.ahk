#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that extract information from a collection of property descriptions presented as a list.
 * @remarks
 * 
 * Ordered lists of properties are used to select which properties are shown in various UI locations such as the details pane or an infotip.  The IPropertyDescriptionList interface provides access to the individual properties in such a list.  
 * 
 * 
 * 
 * To get an instance of the subsystem object that implements <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionlist">IPropertyDescriptionList</a>, obtain an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem2">IShellItem2</a> interface and call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertydescriptionlist">IShellItem2::GetPropertyDescriptionList</a>, or obtain the list in string form and call <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertydescriptionlistfromstring">PSGetPropertyDescriptionListFromString</a>. 
 * 
 * To obtain a property description list in string form, call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getstring">IShellItem2::GetString</a> with one of the PKEY_PropList keys.  For example, <c>PKEY_PropList_InfoTip</c> (<a href="https://docs.microsoft.com/windows/desktop/properties/props-system-proplist-infotip">System.PropList.InfoTip</a>) will return the string form of a list of properties suitable for showing in an infotip.  If you are reading multiple values from an item, it is more efficient to call <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertystore-getvalue">IPropertyStore::GetValue</a> with a PKEY_PropList key so that the item is not reopened multiple times.  See Property Lists for details on how to register a property list string for a file type.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-ipropertydescriptionlist
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IPropertyDescriptionList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyDescriptionList
     * @type {Guid}
     */
    static IID => Guid("{1f9fc1d0-c39b-4b26-817f-011967d3440e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAt"]

    /**
     * Gets the number of properties included in the property list.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * When this method returns, contains a pointer to the count of properties.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescriptionlist-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pcElem := 0, "HRESULT")
        return pcElem
    }

    /**
     * Gets the property description at the specified index in a property description list.
     * @param {Integer} iElem Type: <b>UINT</b>
     * 
     * The number of the property in the list string.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the requested property description interface, typically IID_IPropertyDescription.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the interface pointer requested in <i>riid</i>. Typically, this is <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a>.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescriptionlist-getat
     */
    GetAt(iElem, riid) {
        result := ComCall(4, this, "uint", iElem, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
