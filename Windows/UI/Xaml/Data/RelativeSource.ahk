#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IRelativeSource.ahk
#Include .\IRelativeSourceFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Implements a markup extension that describes the location of the binding source relative to the position of the binding target.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.relativesource
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class RelativeSource extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRelativeSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRelativeSource.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {RelativeSource} 
     */
    static CreateInstance() {
        if (!RelativeSource.HasProp("__IRelativeSourceFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Data.RelativeSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativeSourceFactory.IID)
            RelativeSource.__IRelativeSourceFactory := IRelativeSourceFactory(factoryPtr)
        }

        return RelativeSource.__IRelativeSourceFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that describes the location of the binding source relative to the position of the binding target.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.relativesource.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
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
    get_Mode() {
        if (!this.HasProp("__IRelativeSource")) {
            if ((queryResult := this.QueryInterface(IRelativeSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRelativeSource := IRelativeSource(outPtr)
        }

        return this.__IRelativeSource.get_Mode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Mode(value) {
        if (!this.HasProp("__IRelativeSource")) {
            if ((queryResult := this.QueryInterface(IRelativeSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRelativeSource := IRelativeSource(outPtr)
        }

        return this.__IRelativeSource.put_Mode(value)
    }

;@endregion Instance Methods
}
