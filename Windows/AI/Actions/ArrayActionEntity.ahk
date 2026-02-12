#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ActionEntity.ahk
#Include .\IArrayActionEntity.ahk
#Include .\IArrayActionEntity2.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class ArrayActionEntity extends ActionEntity {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IArrayActionEntity

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IArrayActionEntity.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {Integer} 
     */
    ElementKind {
        get => this.get_ElementKind()
    }

    /**
     * @type {HSTRING} 
     */
    CustomElementKind {
        get => this.get_CustomElementKind()
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
    get_ElementKind() {
        if (!this.HasProp("__IArrayActionEntity")) {
            if ((queryResult := this.QueryInterface(IArrayActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IArrayActionEntity := IArrayActionEntity(outPtr)
        }

        return this.__IArrayActionEntity.get_ElementKind()
    }

    /**
     * 
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} 
     */
    GetAll(result_) {
        if (!this.HasProp("__IArrayActionEntity")) {
            if ((queryResult := this.QueryInterface(IArrayActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IArrayActionEntity := IArrayActionEntity(outPtr)
        }

        return this.__IArrayActionEntity.GetAll(result_)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CustomElementKind() {
        if (!this.HasProp("__IArrayActionEntity2")) {
            if ((queryResult := this.QueryInterface(IArrayActionEntity2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IArrayActionEntity2 := IArrayActionEntity2(outPtr)
        }

        return this.__IArrayActionEntity2.get_CustomElementKind()
    }

;@endregion Instance Methods
}
