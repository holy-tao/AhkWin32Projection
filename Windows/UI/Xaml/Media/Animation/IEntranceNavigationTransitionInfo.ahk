#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IEntranceNavigationTransitionInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEntranceNavigationTransitionInfo
     * @type {Guid}
     */
    static IID => Guid("{720a256b-1c8a-41ee-82ec-8a87c0cf47da}")

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
