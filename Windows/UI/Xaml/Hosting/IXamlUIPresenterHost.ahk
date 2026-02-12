#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a service that resolves resources from an application. This interface is used for design tool hosting scenarios and is not intended for general use.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.ixamluipresenterhost
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class IXamlUIPresenterHost extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlUIPresenterHost
     * @type {Guid}
     */
    static IID => Guid("{aafb84cd-9f6d-4f80-ac2c-0e6cb9f31659}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ResolveFileResource"]

    /**
     * Resolves a resource that is specified by a path and returns a string filename.
     * @param {HSTRING} path_ The local path to resolve.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.ixamluipresenterhost.resolvefileresource
     */
    ResolveFileResource(path_) {
        if(path_ is String) {
            pin := HSTRING.Create(path_)
            path_ := pin.Value
        }
        path_ := path_ is Win32Handle ? NumGet(path_, "ptr") : path_

        result_ := HSTRING()
        result := ComCall(6, this, "ptr", path_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
