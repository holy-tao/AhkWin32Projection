#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class IBitmapImageStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBitmapImageStatics
     * @type {Guid}
     */
    static IID => Guid("{9e282143-70e8-437c-9fa4-2cbf295cff84}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CreateOptionsProperty", "get_UriSourceProperty", "get_DecodePixelWidthProperty", "get_DecodePixelHeightProperty"]

    /**
     * @type {DependencyProperty} 
     */
    CreateOptionsProperty {
        get => this.get_CreateOptionsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    UriSourceProperty {
        get => this.get_UriSourceProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DecodePixelWidthProperty {
        get => this.get_DecodePixelWidthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DecodePixelHeightProperty {
        get => this.get_DecodePixelHeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CreateOptionsProperty() {
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
    get_UriSourceProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DecodePixelWidthProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DecodePixelHeightProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
