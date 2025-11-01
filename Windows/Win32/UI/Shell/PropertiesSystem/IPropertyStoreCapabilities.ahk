#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that determines whether a property can be edited in the UI by the user.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * Property handlers implement this interface to disable a user's ability to edit specific properties. These properties are typically editable in the UI, but are not supported for writing by the property handler. For example, the property System.Author is typically editable. If a property handler author created a file type that exposed <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-author">System.Author</a> for reading, but could not support writing this property back, the handler author could return S_FALSE from <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertystorecapabilities-ispropertywritable">IPropertyStoreCapabilities::IsPropertyWritable</a> for System.Author.
  * 
  * The Shell user interfaces that allow property editing, such as the <b>Details Pane</b> and <b>Details Tab</b> of the Properties dialog, call this method as part of determining whether to allow editing of a specific property. This allows the Shell property editing UI to disable controls rather than showing errors when the property handler fails to set or commit the property value.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-ipropertystorecapabilities
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IPropertyStoreCapabilities extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyStoreCapabilities
     * @type {Guid}
     */
    static IID => Guid("{c8e2d566-186e-4d49-bf41-6909ead56acc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsPropertyWritable"]

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertystorecapabilities-ispropertywritable
     */
    IsPropertyWritable(key) {
        result := ComCall(3, this, "ptr", key, "int")
        return result
    }
}
