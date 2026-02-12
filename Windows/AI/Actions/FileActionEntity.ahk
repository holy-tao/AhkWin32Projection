#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ActionEntity.ahk
#Include .\IFileActionEntity.ahk
#Include ..\..\..\Guid.ahk

/**
 * A subtype of [ActionEntity](actionentity.md) that represents a file.
 * @remarks
 * Create an instance of this class by calling [ActionEntityFactory.CreateDocumentEntity](actionentityfactory_createfileentity_660617564.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.fileactionentity
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class FileActionEntity extends ActionEntity {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFileActionEntity

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFileActionEntity.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the full path to the file.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.fileactionentity.fullpath
     * @type {HSTRING} 
     */
    FullPath {
        get => this.get_FullPath()
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
    get_FullPath() {
        if (!this.HasProp("__IFileActionEntity")) {
            if ((queryResult := this.QueryInterface(IFileActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileActionEntity := IFileActionEntity(outPtr)
        }

        return this.__IFileActionEntity.get_FullPath()
    }

;@endregion Instance Methods
}
