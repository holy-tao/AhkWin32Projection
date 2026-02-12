#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Shapes
 * @version WindowsRuntime 1.4
 */
class IEllipse extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEllipse
     * @type {Guid}
     */
    static IID => Guid("{70e05ac4-d38d-4bab-831f-4a22ef52ac86}")

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
