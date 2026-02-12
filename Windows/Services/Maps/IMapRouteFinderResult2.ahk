#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\MapRoute.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class IMapRouteFinderResult2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapRouteFinderResult2
     * @type {Guid}
     */
    static IID => Guid("{20709c6d-d90c-46c8-91c6-7d4be4efb215}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AlternateRoutes"]

    /**
     * @type {IVectorView<MapRoute>} 
     */
    AlternateRoutes {
        get => this.get_AlternateRoutes()
    }

    /**
     * 
     * @returns {IVectorView<MapRoute>} 
     */
    get_AlternateRoutes() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MapRoute, value)
    }
}
