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
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IComponent)</c>.
 * @see https://learn.microsoft.com/windows/win32/api//content/tuner/nn-tuner-icomponent
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
     * @see https://learn.microsoft.com/windows/win32/api//content/tuner/nf-tuner-icomponent-get_type
     */
    get_Type() {
        result := ComCall(7, this, "ptr*", &CT := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IComponentType(CT)
    }

    /**
     * The put_Type method sets an IComponentType object describing the general characteristics of the component.
     * @remarks
     * Using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponent">IComponent</a> base class interface, it is possible to set the type to be <b>NULL</b>. If you try to do this with the derived <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-impeg2component">IMPEG2Component</a> class interface, this method will return E_POINTER. The <b>IMPEG2Component</b> object cannot have the base <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponenttype">IComponentType</a> class interface as the set type - this will return Type Mismatch (0x80020005).
     * @param {IComponentType} CT Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponenttype">IComponentType</a> object that specifies the new values for the component.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/tuner/nf-tuner-icomponent-put_type
     */
    put_Type(CT) {
        result := ComCall(8, this, "ptr", CT, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The get_DescLangID method retrieves the language identifier for the description property.
     * @remarks
     * The returned language identifier identifies the language of the description property, which is obtained by calling the <b>get_Description</b> method.
     * 
     * To get the language of the stream content, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-ilanguagecomponenttype-get_langid">ILanguageComponentType::get_LangID</a> method (only if the component object exposes the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ilanguagecomponenttype">ILanguageComponentType</a> interface).
     * @returns {Integer} Receives the language identifier.
     * @see https://learn.microsoft.com/windows/win32/api//content/tuner/nf-tuner-icomponent-get_desclangid
     */
    get_DescLangID() {
        result := ComCall(9, this, "int*", &LangID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LangID
    }

    /**
     * The put_DescLangID method sets the language for presentation of the description.
     * @remarks
     * This is the language of the descriptive info in the component object. It is not the same as the language ID in the language component type which defines the language of the stream content. An application can modify this value in order to activate a different language substream.
     * @param {Integer} LangID Specifies the language ID.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/tuner/nf-tuner-icomponent-put_desclangid
     */
    put_DescLangID(LangID) {
        result := ComCall(10, this, "int", LangID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The get_Status method retrieves the requested or actual status of the component.
     * @remarks
     * When the TIF adds a component to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponents">IComponents</a> collection, it can indicate whether the component is active or not. An application can attempt to set this status, and resubmit a tune request. The tuner will update the status from the enumeration: Active, Inactive, Unavailable. The Unavailable status is only set by a tuner in response to a request to activate, when the component is not really available.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/tuner/nf-tuner-icomponent-get_status
     */
    get_Status() {
        result := ComCall(11, this, "int*", &Status_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Status_
    }

    /**
     * The put_Status method sets the requested or actual status of the component.
     * @remarks
     * Use this method to activate or inactivate a stream component.
     * @param {Integer} Status_ A variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/componentstatus">ComponentStatus</a> that specifies the status value.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/tuner/nf-tuner-icomponent-put_status
     */
    put_Status(Status_) {
        result := ComCall(12, this, "int", Status_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The get_Description method retrieves the description of the component.
     * @remarks
     * The caller must release the returned <b>BSTR</b> by calling <b>SysFreeString</b>.
     * @returns {BSTR} Pointer to a variable that receives the description.
     * @see https://learn.microsoft.com/windows/win32/api//content/tuner/nf-tuner-icomponent-get_description
     */
    get_Description() {
        Description := BSTR()
        result := ComCall(13, this, "ptr", Description, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Description
    }

    /**
     * The put_Description method sets the description of the component.
     * @param {BSTR} Description Variable of type <b>BSTR</b> that contains the new description.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/tuner/nf-tuner-icomponent-put_description
     */
    put_Description(Description) {
        if(Description is String) {
            pin := BSTR.Alloc(Description)
            Description := pin.Value
        }

        result := ComCall(14, this, "ptr", Description, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Clone method creates a copy of the component.
     * @returns {IComponent} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponent">IComponent</a> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/tuner/nf-tuner-icomponent-clone
     */
    Clone() {
        result := ComCall(15, this, "ptr*", &NewComponent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IComponent(NewComponent)
    }
}
