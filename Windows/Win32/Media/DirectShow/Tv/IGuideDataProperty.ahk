#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IGuideDataProperty interface represents the name, value, and language of a property associated with a service, program or schedule entry object.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IGuideDataProperty)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//bdatif/nn-bdatif-iguidedataproperty
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IGuideDataProperty extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGuideDataProperty
     * @type {Guid}
     */
    static IID => Guid("{88ec5e58-bb73-41d6-99ce-66c524b8b591}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Language", "get_Value"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {Integer} 
     */
    Language {
        get => this.get_Language()
    }

    /**
     * @type {VARIANT} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-iguidedataproperty-get_name
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(3, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-iguidedataproperty-get_language
     */
    get_Language() {
        result := ComCall(4, this, "int*", &idLang := 0, "HRESULT")
        return idLang
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-iguidedataproperty-get_value
     */
    get_Value() {
        pvar := VARIANT()
        result := ComCall(5, this, "ptr", pvar, "HRESULT")
        return pvar
    }
}
