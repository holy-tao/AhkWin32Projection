#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IComponentType.ahk
#Include .\IComponent.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IComponent interface a base class for all derived interfaces such as IMPEG2Component and it describes the general characteristics of a component, which is an elementary stream within the program stream.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IComponent)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-icomponent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IComponent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComponent
     * @type {Guid}
     */
    static IID => Guid("{1a5576fc-0e19-11d3-9d8e-00c04f72d980}")

    /**
     * The class identifier for Component
     * @type {Guid}
     */
    static CLSID => Guid("{59dc47a8-116c-11d3-9d8e-00c04f72d980}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Type", "put_Type", "get_DescLangID", "put_DescLangID", "get_Status", "put_Status", "get_Description", "put_Description", "Clone"]

    /**
     * 
     * @returns {IComponentType} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponent-get_type
     */
    get_Type() {
        result := ComCall(7, this, "ptr*", &CT := 0, "HRESULT")
        return IComponentType(CT)
    }

    /**
     * 
     * @param {IComponentType} CT 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponent-put_type
     */
    put_Type(CT) {
        result := ComCall(8, this, "ptr", CT, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponent-get_desclangid
     */
    get_DescLangID() {
        result := ComCall(9, this, "int*", &LangID := 0, "HRESULT")
        return LangID
    }

    /**
     * 
     * @param {Integer} LangID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponent-put_desclangid
     */
    put_DescLangID(LangID) {
        result := ComCall(10, this, "int", LangID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponent-get_status
     */
    get_Status() {
        result := ComCall(11, this, "int*", &Status := 0, "HRESULT")
        return Status
    }

    /**
     * 
     * @param {Integer} Status 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponent-put_status
     */
    put_Status(Status) {
        result := ComCall(12, this, "int", Status, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponent-get_description
     */
    get_Description() {
        Description := BSTR()
        result := ComCall(13, this, "ptr", Description, "HRESULT")
        return Description
    }

    /**
     * 
     * @param {BSTR} Description 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponent-put_description
     */
    put_Description(Description) {
        Description := Description is String ? BSTR.Alloc(Description).Value : Description

        result := ComCall(14, this, "ptr", Description, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IComponent} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponent-clone
     */
    Clone() {
        result := ComCall(15, this, "ptr*", &NewComponent := 0, "HRESULT")
        return IComponent(NewComponent)
    }
}
