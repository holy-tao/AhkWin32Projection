#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Returns a view provider object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.iframeworkviewsource.createview
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IFrameworkViewSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFrameworkViewSource
     * @type {Guid}
     */
    static IID => Guid("{e3b077da-35ad-4b09-b5b2-27420041ba9f}")

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
