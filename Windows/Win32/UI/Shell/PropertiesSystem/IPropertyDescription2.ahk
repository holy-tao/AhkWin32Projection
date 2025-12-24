#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IPropertyDescription.ahk

/**
 * Exposes methods that enumerate and retrieve individual property description details.
 * @remarks
 * 
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a> interface, from which it inherits.
 * 
 * To obtain this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertydescription">PSGetPropertyDescription</a>, <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertydescriptionbyname">PSGetPropertyDescriptionByName</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertydescriptionlist-getat">IPropertyDescriptionList::GetAt</a>.
 * 
 * Only one property description exists for each property in the system.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Do not implement this interface. There is only one implementation of <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a> in the system; it is provided by the Shell.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-ipropertydescription2
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IPropertyDescription2 extends IPropertyDescription{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyDescription2
     * @type {Guid}
     */
    static IID => Guid("{57d2eded-5062-400e-b107-5dae79fe57a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 24

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetImageReferenceForValue"]

    /**
     * Gets the image reference associated with a property value.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> for which to get an image.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * A pointer to a buffer that receives, when this method returns successfully, a string of the form &lt;dll name&gt;,-&lt;resid&gt; that is suitable to be passed to <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-pathparseiconlocationa">PathParseIconLocation</a>.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescription2-getimagereferenceforvalue
     */
    GetImageReferenceForValue(propvar) {
        result := ComCall(24, this, "ptr", propvar, "ptr*", &ppszImageRes := 0, "HRESULT")
        return ppszImageRes
    }
}
