#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailIrmTemplate.ahk
#Include .\IEmailIrmTemplateFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a template that can be used to create new [EmailIrmInfo](emailirminfo.md) objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailirmtemplate
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailIrmTemplate extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailIrmTemplate

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailIrmTemplate.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new instance of the [EmailIrmTemplate](emailirmtemplate.md) class with the specified ID, name and description.
     * @param {HSTRING} id The ID for the new template.
     * @param {HSTRING} name The name of the new template.
     * @param {HSTRING} description The description of the new template.
     * @returns {EmailIrmTemplate} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailirmtemplate.#ctor
     */
    static Create(id, name, description) {
        if (!EmailIrmTemplate.HasProp("__IEmailIrmTemplateFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Email.EmailIrmTemplate")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEmailIrmTemplateFactory.IID)
            EmailIrmTemplate.__IEmailIrmTemplateFactory := IEmailIrmTemplateFactory(factoryPtr)
        }

        return EmailIrmTemplate.__IEmailIrmTemplateFactory.Create(id, name, description)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the ID for the template.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailirmtemplate.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

    /**
     * Gets or sets the description of the template.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailirmtemplate.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * Gets or sets the name for the template.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailirmtemplate.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [EmailIrmTemplate](emailirmtemplate.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Email.EmailIrmTemplate")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IEmailIrmTemplate")) {
            if ((queryResult := this.QueryInterface(IEmailIrmTemplate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmTemplate := IEmailIrmTemplate(outPtr)
        }

        return this.__IEmailIrmTemplate.get_Id()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Id(value) {
        if (!this.HasProp("__IEmailIrmTemplate")) {
            if ((queryResult := this.QueryInterface(IEmailIrmTemplate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmTemplate := IEmailIrmTemplate(outPtr)
        }

        return this.__IEmailIrmTemplate.put_Id(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IEmailIrmTemplate")) {
            if ((queryResult := this.QueryInterface(IEmailIrmTemplate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmTemplate := IEmailIrmTemplate(outPtr)
        }

        return this.__IEmailIrmTemplate.get_Description()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__IEmailIrmTemplate")) {
            if ((queryResult := this.QueryInterface(IEmailIrmTemplate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmTemplate := IEmailIrmTemplate(outPtr)
        }

        return this.__IEmailIrmTemplate.put_Description(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IEmailIrmTemplate")) {
            if ((queryResult := this.QueryInterface(IEmailIrmTemplate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmTemplate := IEmailIrmTemplate(outPtr)
        }

        return this.__IEmailIrmTemplate.get_Name()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if (!this.HasProp("__IEmailIrmTemplate")) {
            if ((queryResult := this.QueryInterface(IEmailIrmTemplate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailIrmTemplate := IEmailIrmTemplate(outPtr)
        }

        return this.__IEmailIrmTemplate.put_Name(value)
    }

;@endregion Instance Methods
}
