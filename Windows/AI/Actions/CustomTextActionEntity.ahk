#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ActionEntity.ahk
#Include .\ICustomTextActionEntity.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class CustomTextActionEntity extends ActionEntity {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICustomTextActionEntity

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICustomTextActionEntity.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {HSTRING} 
     */
    CustomTextKind {
        get => this.get_CustomTextKind()
    }

    /**
     * @type {HSTRING} 
     */
    KeyPhrase {
        get => this.get_KeyPhrase()
    }

    /**
     * @type {IMapView<HSTRING, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CustomTextKind() {
        if (!this.HasProp("__ICustomTextActionEntity")) {
            if ((queryResult := this.QueryInterface(ICustomTextActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomTextActionEntity := ICustomTextActionEntity(outPtr)
        }

        return this.__ICustomTextActionEntity.get_CustomTextKind()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KeyPhrase() {
        if (!this.HasProp("__ICustomTextActionEntity")) {
            if ((queryResult := this.QueryInterface(ICustomTextActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomTextActionEntity := ICustomTextActionEntity(outPtr)
        }

        return this.__ICustomTextActionEntity.get_KeyPhrase()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__ICustomTextActionEntity")) {
            if ((queryResult := this.QueryInterface(ICustomTextActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomTextActionEntity := ICustomTextActionEntity(outPtr)
        }

        return this.__ICustomTextActionEntity.get_Properties()
    }

;@endregion Instance Methods
}
