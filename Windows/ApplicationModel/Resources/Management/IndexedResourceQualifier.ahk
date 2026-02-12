#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIndexedResourceQualifier.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an object that declares under what context a resource is appropriate.
  * 
  * > [!IMPORTANT]
  * > You can't use this class in a UWP app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.management.indexedresourcequalifier
 * @namespace Windows.ApplicationModel.Resources.Management
 * @version WindowsRuntime 1.4
 */
class IndexedResourceQualifier extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIndexedResourceQualifier

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIndexedResourceQualifier.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the qualifier.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.management.indexedresourcequalifier.qualifiername
     * @type {HSTRING} 
     */
    QualifierName {
        get => this.get_QualifierName()
    }

    /**
     * Gets the value of the qualifier.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.management.indexedresourcequalifier.qualifiervalue
     * @type {HSTRING} 
     */
    QualifierValue {
        get => this.get_QualifierValue()
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
    get_QualifierName() {
        if (!this.HasProp("__IIndexedResourceQualifier")) {
            if ((queryResult := this.QueryInterface(IIndexedResourceQualifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIndexedResourceQualifier := IIndexedResourceQualifier(outPtr)
        }

        return this.__IIndexedResourceQualifier.get_QualifierName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_QualifierValue() {
        if (!this.HasProp("__IIndexedResourceQualifier")) {
            if ((queryResult := this.QueryInterface(IIndexedResourceQualifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIndexedResourceQualifier := IIndexedResourceQualifier(outPtr)
        }

        return this.__IIndexedResourceQualifier.get_QualifierValue()
    }

;@endregion Instance Methods
}
