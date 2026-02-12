#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class IBitmapImageStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBitmapImageStatics2
     * @type {Guid}
     */
    static IID => Guid("{c5f5576a-75af-41a4-b893-8fe91fee2882}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DecodePixelTypeProperty"]

    /**
     * @type {DependencyProperty} 
     */
    DecodePixelTypeProperty {
        get => this.get_DecodePixelTypeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DecodePixelTypeProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
