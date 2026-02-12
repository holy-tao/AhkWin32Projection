#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines the navigation action for navigation hosts and navigation initiators.
 * @remarks
 * This interface is mainly infrastructure. It's not expected that typical UWP app will implement this interface. Most apps would use [Page](page.md) and [Frame](frame.md) for their navigation structure instead. The Visual Studio templates create this navigation structure for you both for apps/projects and for items/pages.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inavigate
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class INavigate extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INavigate
     * @type {Guid}
     */
    static IID => Guid("{bf2195a9-f4ea-4336-977c-f8fcf78b0d9e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Navigate"]

    /**
     * Causes the navigation host to load content that is specified by a type reference.
     * @remarks
     * The [INavigate](inavigate.md) interface is mainly infrastructure. It's not expected that typical UWP app will implement this interface.
     * 
     * > [!IMPORTANT]
     * > If you are programming using a Microsoft .NET language (C# or Microsoft Visual Basic), the [TypeName](../windows.ui.xaml.interop/typename.md) type projects as [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true).
     * @param {TypeName} sourcePageType A type reference for the content to load.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inavigate.navigate
     */
    Navigate(sourcePageType) {
        result := ComCall(6, this, "ptr", sourcePageType, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
