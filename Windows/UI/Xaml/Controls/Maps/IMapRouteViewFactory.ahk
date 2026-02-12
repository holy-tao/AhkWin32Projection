#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\MapRouteView.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapRouteViewFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapRouteViewFactory
     * @type {Guid}
     */
    static IID => Guid("{f083addf-0066-4628-82fe-ea78c23cec1e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstanceWithMapRoute"]

    /**
     * 
     * @param {MapRoute} route 
     * @param {IInspectable} baseInterface 
     * @param {Pointer<Object>} innerInterface 
     * @returns {MapRouteView} 
     */
    CreateInstanceWithMapRoute(route, baseInterface, innerInterface) {
        result := ComCall(6, this, "ptr", route, "ptr", baseInterface, "ptr", innerInterface, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapRouteView(value)
    }
}
