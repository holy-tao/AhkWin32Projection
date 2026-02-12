#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IBasicConnectedAnimationConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBasicConnectedAnimationConfiguration
     * @type {Guid}
     */
    static IID => Guid("{e675f9b5-a4d6-5353-83e6-c89e7cf8d456}")

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
