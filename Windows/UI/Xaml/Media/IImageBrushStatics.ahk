#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IImageBrushStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IImageBrushStatics
     * @type {Guid}
     */
    static IID => Guid("{1255b1b2-dd18-42e5-892c-eae30c305b8c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ImageSourceProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ImageSourceProperty {
        get => this.get_ImageSourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ImageSourceProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
