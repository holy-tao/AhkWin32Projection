#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides the implementation of a large (greater than the screen size) shared surface for DirectX drawing.
 * @remarks
 * This interface provides the native implementation of the <a href="https://docs.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.virtualsurfaceimagesource">Windows::UI::Xaml::Media::Imaging::VirtualSurfaceImageSource</a> Windows runtime type. To obtain a pointer to <b>IVirtualSurfaceImageSourceNative</b>, you must cast a <b>VirtualSurfaceImageSource</b> instance to <a href="https://docs.microsoft.com/windows/desktop/api/inspectable/nn-inspectable-iinspectable">IInspectable</a> or <b>IUnknown</b>, and call <b>QueryInterface</b>.
 * 
 * 
 * ```cpp
 * 
 * Microsoft::WRL::ComPtr<IVirtualSurfaceImageSourceNative>	m_vsisNative;
 * // ...
 * IInspectable* vsisInspectable = (IInspectable*) reinterpret_cast<IInspectable*>(virtualSurfaceImageSource);
 * vsisInspectable->QueryInterface(__uuidof(IVirtualSurfaceImageSourceNative), (void **)&m_vsisNative)
 * 	
 * ```
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.xaml.media.dxinterop/nn-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class IVirtualSurfaceImageSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVirtualSurfaceImageSource
     * @type {Guid}
     */
    static IID => Guid("{4a711fea-bfac-11e0-a06a-9de44724019b}")

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
