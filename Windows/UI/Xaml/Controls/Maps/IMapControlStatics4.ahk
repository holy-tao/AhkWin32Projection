#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapControlStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapControlStatics4
     * @type {Guid}
     */
    static IID => Guid("{fe785d97-5d13-4fa1-bf1d-84061768c183}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BusinessLandmarksEnabledProperty", "get_TransitFeaturesEnabledProperty"]

    /**
     * @type {DependencyProperty} 
     */
    BusinessLandmarksEnabledProperty {
        get => this.get_BusinessLandmarksEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TransitFeaturesEnabledProperty {
        get => this.get_TransitFeaturesEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_BusinessLandmarksEnabledProperty() {
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
    get_TransitFeaturesEnabledProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
