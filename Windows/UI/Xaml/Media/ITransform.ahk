#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides access to controls that can be moved, resized, and/or rotated within a two-dimensional space.
 * @remarks
 * Implemented on a Microsoft UI Automation provider that must support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingtransform">Transform</a> control pattern.
 *             
 * 
 * Support for this  control pattern is not limited to objects on the desktop. 
 *             This  control pattern must also be implemented by the children of a 
 *             container object as long as the children can be moved, resized, or rotated freely within the boundaries of the container.
 * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nn-uiautomationcore-itransformprovider
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class ITransform extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransform
     * @type {Guid}
     */
    static IID => Guid("{4df74078-bfd6-4ed1-9682-d2fd8bf2fe6f}")

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
