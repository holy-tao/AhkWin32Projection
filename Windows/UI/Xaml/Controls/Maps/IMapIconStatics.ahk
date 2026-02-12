#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapIconStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapIconStatics
     * @type {Guid}
     */
    static IID => Guid("{dcbc9e56-1190-4b5d-9e56-e5b6724aa328}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LocationProperty", "get_TitleProperty", "get_NormalizedAnchorPointProperty"]

    /**
     * @type {DependencyProperty} 
     */
    LocationProperty {
        get => this.get_LocationProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TitleProperty {
        get => this.get_TitleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    NormalizedAnchorPointProperty {
        get => this.get_NormalizedAnchorPointProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_LocationProperty() {
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
    get_TitleProperty() {
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
    get_NormalizedAnchorPointProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
