#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class ISvgImageSourceOpenedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISvgImageSourceOpenedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{85ef4c16-748e-4008-95c7-6a23dd7316db}")

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
