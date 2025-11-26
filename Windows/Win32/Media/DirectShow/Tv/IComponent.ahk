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
     * @type {IComponentType} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

    /**
     * @type {Integer} 
     */
    DescLangID {
        get => this.get_DescLangID()
        set => this.put_DescLangID(value)
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
        set => this.put_Status(value)
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * The get_Type method retrieves an IComponentType interface describing the general characteristics of the component.
     * @returns {IComponentType} Address of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponenttype">IComponentType</a> interface pointer that will be set to the retrieved component.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponent-get_type
     */
    get_Type() {
        result := ComCall(7, this, "ptr*", &CT := 0, "HRESULT")
        return IComponentType(CT)
    }

    /**
     * The put_Type method sets an IComponentType object describing the general characteristics of the component.
     * @param {IComponentType} CT Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponenttype">IComponentType</a> object that specifies the new values for the component.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponent-put_type
     */
    put_Type(CT) {
        result := ComCall(8, this, "ptr", CT, "HRESULT")
        return result
    }

    /**
     * The get_DescLangID method retrieves the language identifier for the description property.
     * @returns {Integer} Receives the language identifier.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponent-get_desclangid
     */
    get_DescLangID() {
        result := ComCall(9, this, "int*", &LangID := 0, "HRESULT")
        return LangID
    }

    /**
     * The put_DescLangID method sets the language for presentation of the description.
     * @param {Integer} LangID Specifies the language ID.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponent-put_desclangid
     */
    put_DescLangID(LangID) {
        result := ComCall(10, this, "int", LangID, "HRESULT")
        return result
    }

    /**
     * The get_Status method retrieves the requested or actual status of the component.
     * @returns {Integer} Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/componentstatus">ComponentStatus</a> enumeration that receives the status value.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponent-get_status
     */
    get_Status() {
        result := ComCall(11, this, "int*", &Status := 0, "HRESULT")
        return Status
    }

    /**
     * The put_Status method sets the requested or actual status of the component.
     * @param {Integer} Status A variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/componentstatus">ComponentStatus</a> that specifies the status value.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponent-put_status
     */
    put_Status(Status) {
        result := ComCall(12, this, "int", Status, "HRESULT")
        return result
    }

    /**
     * The get_Description method retrieves the description of the component.
     * @returns {BSTR} Pointer to a variable that receives the description.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponent-get_description
     */
    get_Description() {
        Description := BSTR()
        result := ComCall(13, this, "ptr", Description, "HRESULT")
        return Description
    }

    /**
     * The put_Description method sets the description of the component.
     * @param {BSTR} Description Variable of type <b>BSTR</b> that contains the new description.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponent-put_description
     */
    put_Description(Description) {
        Description := Description is String ? BSTR.Alloc(Description).Value : Description

        result := ComCall(14, this, "ptr", Description, "HRESULT")
        return result
    }

    /**
     * The Clone method creates a copy of the component.
     * @returns {IComponent} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponent">IComponent</a> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponent-clone
     */
    Clone() {
        result := ComCall(15, this, "ptr*", &NewComponent := 0, "HRESULT")
        return IComponent(NewComponent)
    }
}
