#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Visual.ahk
#Include .\IContainerVisual.ahk
#Include .\IContainerVisualFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * A node in the visual tree that can have children.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.containervisual
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ContainerVisual extends Visual {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContainerVisual

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContainerVisual.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The children of the [ContainerVisual](containervisual.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.containervisual.children
     * @type {VisualCollection} 
     */
    Children {
        get => this.get_Children()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {VisualCollection} 
     */
    get_Children() {
        if (!this.HasProp("__IContainerVisual")) {
            if ((queryResult := this.QueryInterface(IContainerVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContainerVisual := IContainerVisual(outPtr)
        }

        return this.__IContainerVisual.get_Children()
    }

;@endregion Instance Methods
}
