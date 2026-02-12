#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITargetedContentValue.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the content value object for a subscription.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentvalue
 * @namespace Windows.Services.TargetedContent
 * @version WindowsRuntime 1.4
 */
class TargetedContentValue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITargetedContentValue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITargetedContentValue.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [TargetedContentValueKind](targetedcontentvaluekind.md) for the [TargetedContentValue](targetedcontentvalue.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentvalue.valuekind
     * @type {Integer} 
     */
    ValueKind {
        get => this.get_ValueKind()
    }

    /**
     * Gets the string path for the TargetedContentValue object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentvalue.path
     * @type {HSTRING} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * Gets a string in a TargetedContentValue object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentvalue.string
     * @type {HSTRING} 
     */
    String {
        get => this.get_String()
    }

    /**
     * Gets a Uri object in a TargetedContentValue object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentvalue.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * Gets a double in a TargetedContentValue object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentvalue.number
     * @type {Float} 
     */
    Number {
        get => this.get_Number()
    }

    /**
     * Gets a Boolean in a TargetedContentValue object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentvalue.boolean
     * @type {Boolean} 
     */
    Boolean {
        get => this.get_Boolean()
    }

    /**
     * Gets a TargetedContentFile object in a TargetedContentValue object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentvalue.file
     * @type {TargetedContentFile} 
     */
    File {
        get => this.get_File()
    }

    /**
     * Gets a TargetedContentImage object in a TargetedContentValue object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentvalue.imagefile
     * @type {TargetedContentImage} 
     */
    ImageFile {
        get => this.get_ImageFile()
    }

    /**
     * Gets a TargetedContentAction object in a TargetedContentValue object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentvalue.action
     * @type {TargetedContentAction} 
     */
    Action {
        get => this.get_Action()
    }

    /**
     * Gets an array of strings in a TargetedContentValue object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentvalue.strings
     * @type {IVectorView<HSTRING>} 
     */
    Strings {
        get => this.get_Strings()
    }

    /**
     * Gets an array of Uri objects in a TargetedContentValue object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentvalue.uris
     * @type {IVectorView<Uri>} 
     */
    Uris {
        get => this.get_Uris()
    }

    /**
     * Gets an array of doubles in a TargetedContentValue object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentvalue.numbers
     * @type {IVectorView<Float>} 
     */
    Numbers {
        get => this.get_Numbers()
    }

    /**
     * Gets an array of Booleans in a TargetedContentValue object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentvalue.booleans
     * @type {IVectorView<Boolean>} 
     */
    Booleans {
        get => this.get_Booleans()
    }

    /**
     * Gets an array of TargetedContentFile objects in a TargetedContentValue object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentvalue.files
     * @type {IVectorView<TargetedContentFile>} 
     */
    Files {
        get => this.get_Files()
    }

    /**
     * Gets an array of TargetedContentImage objects in a TargetedContentValue object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentvalue.imagefiles
     * @type {IVectorView<TargetedContentImage>} 
     */
    ImageFiles {
        get => this.get_ImageFiles()
    }

    /**
     * Gets an array of TargetedContentAction objects in a TargetedContentValue object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentvalue.actions
     * @type {IVectorView<TargetedContentAction>} 
     */
    Actions {
        get => this.get_Actions()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ValueKind() {
        if (!this.HasProp("__ITargetedContentValue")) {
            if ((queryResult := this.QueryInterface(ITargetedContentValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentValue := ITargetedContentValue(outPtr)
        }

        return this.__ITargetedContentValue.get_ValueKind()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Path() {
        if (!this.HasProp("__ITargetedContentValue")) {
            if ((queryResult := this.QueryInterface(ITargetedContentValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentValue := ITargetedContentValue(outPtr)
        }

        return this.__ITargetedContentValue.get_Path()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_String() {
        if (!this.HasProp("__ITargetedContentValue")) {
            if ((queryResult := this.QueryInterface(ITargetedContentValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentValue := ITargetedContentValue(outPtr)
        }

        return this.__ITargetedContentValue.get_String()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        if (!this.HasProp("__ITargetedContentValue")) {
            if ((queryResult := this.QueryInterface(ITargetedContentValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentValue := ITargetedContentValue(outPtr)
        }

        return this.__ITargetedContentValue.get_Uri()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Number() {
        if (!this.HasProp("__ITargetedContentValue")) {
            if ((queryResult := this.QueryInterface(ITargetedContentValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentValue := ITargetedContentValue(outPtr)
        }

        return this.__ITargetedContentValue.get_Number()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Boolean() {
        if (!this.HasProp("__ITargetedContentValue")) {
            if ((queryResult := this.QueryInterface(ITargetedContentValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentValue := ITargetedContentValue(outPtr)
        }

        return this.__ITargetedContentValue.get_Boolean()
    }

    /**
     * 
     * @returns {TargetedContentFile} 
     */
    get_File() {
        if (!this.HasProp("__ITargetedContentValue")) {
            if ((queryResult := this.QueryInterface(ITargetedContentValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentValue := ITargetedContentValue(outPtr)
        }

        return this.__ITargetedContentValue.get_File()
    }

    /**
     * 
     * @returns {TargetedContentImage} 
     */
    get_ImageFile() {
        if (!this.HasProp("__ITargetedContentValue")) {
            if ((queryResult := this.QueryInterface(ITargetedContentValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentValue := ITargetedContentValue(outPtr)
        }

        return this.__ITargetedContentValue.get_ImageFile()
    }

    /**
     * 
     * @returns {TargetedContentAction} 
     */
    get_Action() {
        if (!this.HasProp("__ITargetedContentValue")) {
            if ((queryResult := this.QueryInterface(ITargetedContentValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentValue := ITargetedContentValue(outPtr)
        }

        return this.__ITargetedContentValue.get_Action()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Strings() {
        if (!this.HasProp("__ITargetedContentValue")) {
            if ((queryResult := this.QueryInterface(ITargetedContentValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentValue := ITargetedContentValue(outPtr)
        }

        return this.__ITargetedContentValue.get_Strings()
    }

    /**
     * 
     * @returns {IVectorView<Uri>} 
     */
    get_Uris() {
        if (!this.HasProp("__ITargetedContentValue")) {
            if ((queryResult := this.QueryInterface(ITargetedContentValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentValue := ITargetedContentValue(outPtr)
        }

        return this.__ITargetedContentValue.get_Uris()
    }

    /**
     * 
     * @returns {IVectorView<Float>} 
     */
    get_Numbers() {
        if (!this.HasProp("__ITargetedContentValue")) {
            if ((queryResult := this.QueryInterface(ITargetedContentValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentValue := ITargetedContentValue(outPtr)
        }

        return this.__ITargetedContentValue.get_Numbers()
    }

    /**
     * 
     * @returns {IVectorView<Boolean>} 
     */
    get_Booleans() {
        if (!this.HasProp("__ITargetedContentValue")) {
            if ((queryResult := this.QueryInterface(ITargetedContentValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentValue := ITargetedContentValue(outPtr)
        }

        return this.__ITargetedContentValue.get_Booleans()
    }

    /**
     * 
     * @returns {IVectorView<TargetedContentFile>} 
     */
    get_Files() {
        if (!this.HasProp("__ITargetedContentValue")) {
            if ((queryResult := this.QueryInterface(ITargetedContentValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentValue := ITargetedContentValue(outPtr)
        }

        return this.__ITargetedContentValue.get_Files()
    }

    /**
     * 
     * @returns {IVectorView<TargetedContentImage>} 
     */
    get_ImageFiles() {
        if (!this.HasProp("__ITargetedContentValue")) {
            if ((queryResult := this.QueryInterface(ITargetedContentValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentValue := ITargetedContentValue(outPtr)
        }

        return this.__ITargetedContentValue.get_ImageFiles()
    }

    /**
     * 
     * @returns {IVectorView<TargetedContentAction>} 
     */
    get_Actions() {
        if (!this.HasProp("__ITargetedContentValue")) {
            if ((queryResult := this.QueryInterface(ITargetedContentValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentValue := ITargetedContentValue(outPtr)
        }

        return this.__ITargetedContentValue.get_Actions()
    }

;@endregion Instance Methods
}
