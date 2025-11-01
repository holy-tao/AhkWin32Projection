#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IPropertyEnumType.ahk

/**
 * Exposes methods that extract data from enumeration information. IPropertyEnumType2 extends IPropertyEnumType.
 * @remarks
 * 
  * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertyenumtype">IPropertyEnumType</a> interface, from which it inherits.
  * 
  * For additional information, see <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-enumeratedlist">enumeratedList</a>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-ipropertyenumtype2
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IPropertyEnumType2 extends IPropertyEnumType{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyEnumType2
     * @type {Guid}
     */
    static IID => Guid("{9b6e051c-5ddd-4321-9070-fe2acb55e794}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetImageReference"]

    /**
     * 
     * @param {Pointer<PWSTR>} ppszImageRes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertyenumtype2-getimagereference
     */
    GetImageReference(ppszImageRes) {
        result := ComCall(8, this, "ptr", ppszImageRes, "HRESULT")
        return result
    }
}
