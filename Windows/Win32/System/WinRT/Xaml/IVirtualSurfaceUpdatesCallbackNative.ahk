#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * Provides an interface for the implementation of drawing behaviors when a VirtualSurfaceImageSource requests an update.
 * @remarks
 * This interface is implemented by the developer to provide specific drawing behaviors for updates to a <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nn-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative">VirtualSurfaceImageSource</a>. Classes that implement  this interface are provided to the <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative-registerforupdatesneeded">IVirtualSurfaceImageSourceNative::RegisterForUpdatesNeeded</a>, which calls the <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-ivirtualsurfaceupdatescallbacknative-updatesneeded">UpdatesNeeded</a> method implementation whenever an update is requested.
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.xaml.media.dxinterop/nn-windows-ui-xaml-media-dxinterop-ivirtualsurfaceupdatescallbacknative
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class IVirtualSurfaceUpdatesCallbackNative extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVirtualSurfaceUpdatesCallbackNative
     * @type {Guid}
     */
    static IID => Guid("{dbf2e947-8e6c-4254-9eee-7738f71386c9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UpdatesNeeded"]

    /**
     * 
     * @returns {HRESULT} 
     */
    UpdatesNeeded() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
