#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ActionEntity.ahk
#Include .\IPhotoActionEntity.ahk
#Include ..\..\..\Guid.ahk

/**
 * A subtype of [ActionEntity](actionentity.md) that represents a photo.
 * @remarks
 * Create an instance of this class by calling [ActionEntityFactory.CreatePhotoEntity](actionentityfactory_createphotoentity_1305223934.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.photoactionentity
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class PhotoActionEntity extends ActionEntity {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhotoActionEntity

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhotoActionEntity.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the full path to the photo image file.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.photoactionentity.fullpath
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
        if (!this.HasProp("__IPhotoActionEntity")) {
            if ((queryResult := this.QueryInterface(IPhotoActionEntity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoActionEntity := IPhotoActionEntity(outPtr)
        }

        return this.__IPhotoActionEntity.get_FullPath()
    }

;@endregion Instance Methods
}
