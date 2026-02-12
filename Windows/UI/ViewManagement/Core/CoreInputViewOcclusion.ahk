#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreInputViewOcclusion.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the area of the app that is currently occluded by the [CoreInputView](coreinputview.md).
  * 
  * > [!NOTE]
  * > Not supported on HoloLens.
 * @remarks
 * Used by frameworks (such as XAML) or custom text controls only.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputviewocclusion
 * @namespace Windows.UI.ViewManagement.Core
 * @version WindowsRuntime 1.4
 */
class CoreInputViewOcclusion extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreInputViewOcclusion

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreInputViewOcclusion.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the bounding rect of the occluding input pane.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputviewocclusion.occludingrect
     * @type {RECT} 
     */
    OccludingRect {
        get => this.get_OccludingRect()
    }

    /**
     * The type of occluding input pane.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputviewocclusion.occlusionkind
     * @type {Integer} 
     */
    OcclusionKind {
        get => this.get_OcclusionKind()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_OccludingRect() {
        if (!this.HasProp("__ICoreInputViewOcclusion")) {
            if ((queryResult := this.QueryInterface(ICoreInputViewOcclusion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputViewOcclusion := ICoreInputViewOcclusion(outPtr)
        }

        return this.__ICoreInputViewOcclusion.get_OccludingRect()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OcclusionKind() {
        if (!this.HasProp("__ICoreInputViewOcclusion")) {
            if ((queryResult := this.QueryInterface(ICoreInputViewOcclusion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputViewOcclusion := ICoreInputViewOcclusion(outPtr)
        }

        return this.__ICoreInputViewOcclusion.get_OcclusionKind()
    }

;@endregion Instance Methods
}
