#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Base class for graphics effect sources.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.effects.igraphicseffectsource
 * @namespace Windows.Graphics.Effects
 * @version WindowsRuntime 1.4
 */
class IGraphicsEffectSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGraphicsEffectSource
     * @type {Guid}
     */
    static IID => Guid("{2d8f9ddc-4339-4eb9-9216-f9deb75658a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
