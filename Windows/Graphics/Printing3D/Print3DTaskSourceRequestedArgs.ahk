#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrint3DTaskSourceRequestedArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [Print3DTaskSourceRequestedHandler](print3dtasksourcerequestedhandler.md) delegate.
 * @remarks
 * This API is designed for use with 3D Manufacturing Format (3MF) packages. For more info about 3MF, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.print3dtasksourcerequestedargs
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Print3DTaskSourceRequestedArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrint3DTaskSourceRequestedArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrint3DTaskSourceRequestedArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Specifies the 3D Manufacturing Format (3MF) package to use in the print job.
     * @param {Printing3D3MFPackage} source The 3D Manufacturing Format (3MF) package to use in the print job.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.print3dtasksourcerequestedargs.setsource
     */
    SetSource(source) {
        if (!this.HasProp("__IPrint3DTaskSourceRequestedArgs")) {
            if ((queryResult := this.QueryInterface(IPrint3DTaskSourceRequestedArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrint3DTaskSourceRequestedArgs := IPrint3DTaskSourceRequestedArgs(outPtr)
        }

        return this.__IPrint3DTaskSourceRequestedArgs.SetSource(source)
    }

;@endregion Instance Methods
}
