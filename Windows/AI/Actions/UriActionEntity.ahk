#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ActionEntity.ahk
#Include .\IUriActionEntity.ahk
#Include ..\..\..\Guid.ahk

/**
 * A subtype of [ActionEntity](actionentity.md) that represents a URI.
 * @remarks
 * Create an instance of this class by calling [ActionEntityFactory.CreateUriEntity](actionentityfactory_createurientity_492063993.md).
 * 
 * Actions can use a *where* clause in their input combination declaration to specify that they are able to operate on one or more [Uri.Scheme](/dotnet/api/system.uri.scheme) values. For more information, see [Action definition JSON schema for App Actions on Windows](/windows/ai/app-actions/actions-json).
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.uriactionentity
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class UriActionEntity extends ActionEntity {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUriActionEntity

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUriActionEntity.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the URI associated with the **UriActionEntity**.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.uriactionentity.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        if (!this.HasProp("__IUriActionEntity")) {
            if ((queryResult := this.QueryInterface(IUriActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUriActionEntity := IUriActionEntity(outPtr)
        }

        return this.__IUriActionEntity.get_Uri()
    }

;@endregion Instance Methods
}
