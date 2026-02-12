#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class IBitmapSourceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBitmapSourceStatics
     * @type {Guid}
     */
    static IID => Guid("{9a9c9981-827b-4e51-891b-8a15b511842d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PixelWidthProperty", "get_PixelHeightProperty"]

    /**
     * @type {DependencyProperty} 
     */
    PixelWidthProperty {
        get => this.get_PixelWidthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PixelHeightProperty {
        get => this.get_PixelHeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PixelWidthProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PixelHeightProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
