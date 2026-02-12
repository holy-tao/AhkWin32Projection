#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INDStorageFileHelper.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Manages PlayReady-ND storage files.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndstoragefilehelper
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class NDStorageFileHelper extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INDStorageFileHelper

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INDStorageFileHelper.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [NDStorageFileHelper](ndstoragefilehelper.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.NDStorageFileHelper")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Gets transmitter settings from the URLs associated with a **StorageFile** object if the URLs contain PlayReady-ND metadata.
     * @param {IStorageFile} file_ A storage file object that a media server has discovered.
     * @returns {IVector<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndstoragefilehelper.getfileurls
     */
    GetFileURLs(file_) {
        if (!this.HasProp("__INDStorageFileHelper")) {
            if ((queryResult := this.QueryInterface(INDStorageFileHelper.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INDStorageFileHelper := INDStorageFileHelper(outPtr)
        }

        return this.__INDStorageFileHelper.GetFileURLs(file_)
    }

;@endregion Instance Methods
}
