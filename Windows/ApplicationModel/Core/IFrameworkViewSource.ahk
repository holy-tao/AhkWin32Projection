#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IFrameworkView.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines a factory for view provider objects.
 * @remarks
 * Instances of objects that implement this class are provided to the app object's [CoreApplication.Run](coreapplication_run_1480028297.md) method when the app starts, which uses it to create the views used by the app.
 * 
 * ```cppwinrt
 * struct App : implements<App, IFrameworkViewSource, IFrameworkView>
 * {
 * public:
 *     IFrameworkView CreateView()
 *     {
 *         return *this;
 *     }
 * };
 * 
 * ...
 * 
 * int __stdcall wWinMain(HINSTANCE, HINSTANCE, PWSTR, int)
 * {
 *     Windows::ApplicationModel::Core::CoreApplication::Run(App());
 * }
 * ```
 * 
 * If you're using C++/CX, then a view provider must be attributed as **MTAThread.**
 * 
 * ```cppcx
 * ref class MyFrameworkViewSource : IFrameworkViewSource
 * {
 * public:
 *     virtual IFrameworkView^ CreateView()
 *     {
 *         return ref new MyFrameworkView(); // See IFrameworkView for implementation specifics.
 *     }
 * };
 * 
 * // ...
 * 
 * [Platform::MTAThread]
 * int main(Platform::Array<Platform::String^>^)
 * {
 *     auto frameworkViewSource = ref new MyFrameworkViewSource();
 *     Windows::ApplicationModel::Core::CoreApplication::Run(frameworkViewSource);
 *     return 0;
 * }
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.iframeworkviewsource
 * @namespace Windows.ApplicationModel.Core
 * @version WindowsRuntime 1.4
 */
class IFrameworkViewSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFrameworkViewSource
     * @type {Guid}
     */
    static IID => Guid("{cd770614-65c4-426c-9494-34fc43554862}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateView"]

    /**
     * Returns a view provider object.
     * @returns {IFrameworkView} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.iframeworkviewsource.createview
     */
    CreateView() {
        result := ComCall(6, this, "ptr*", &viewProvider := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IFrameworkView(viewProvider)
    }
}
