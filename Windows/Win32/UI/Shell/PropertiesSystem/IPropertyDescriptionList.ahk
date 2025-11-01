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
     * 
     * @param {Pointer<Integer>} pcElem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescriptionlist-getcount
     */
    GetCount(pcElem) {
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pcElemMarshal, pcElem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iElem 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescriptionlist-getat
     */
    GetAt(iElem, riid, ppv) {
        result := ComCall(4, this, "uint", iElem, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }
}
