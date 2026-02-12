#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInkWorkspaceHostedAppManager.ahk
#Include .\IInkWorkspaceHostedAppManagerStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the manager for apps hosted in the Windows Ink Workspace.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.inkworkspace.inkworkspacehostedappmanager
 * @namespace Windows.ApplicationModel.Preview.InkWorkspace
 * @version WindowsRuntime 1.4
 */
class InkWorkspaceHostedAppManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkWorkspaceHostedAppManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkWorkspaceHostedAppManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves a reference to the Ink Workspace manager for this app.
     * @returns {InkWorkspaceHostedAppManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.inkworkspace.inkworkspacehostedappmanager.getforcurrentapp
     */
    static GetForCurrentApp() {
        if (!InkWorkspaceHostedAppManager.HasProp("__IInkWorkspaceHostedAppManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Preview.InkWorkspace.InkWorkspaceHostedAppManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkWorkspaceHostedAppManagerStatics.IID)
            InkWorkspaceHostedAppManager.__IInkWorkspaceHostedAppManagerStatics := IInkWorkspaceHostedAppManagerStatics(factoryPtr)
        }

        return InkWorkspaceHostedAppManager.__IInkWorkspaceHostedAppManagerStatics.GetForCurrentApp()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Asynchronously sets the thumbnail image for the Ink Workspace app.
     * @param {SoftwareBitmap} bitmap_ An uncompressed bitmap.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.inkworkspace.inkworkspacehostedappmanager.setthumbnailasync
     */
    SetThumbnailAsync(bitmap_) {
        if (!this.HasProp("__IInkWorkspaceHostedAppManager")) {
            if ((queryResult := this.QueryInterface(IInkWorkspaceHostedAppManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkWorkspaceHostedAppManager := IInkWorkspaceHostedAppManager(outPtr)
        }

        return this.__IInkWorkspaceHostedAppManager.SetThumbnailAsync(bitmap_)
    }

;@endregion Instance Methods
}
