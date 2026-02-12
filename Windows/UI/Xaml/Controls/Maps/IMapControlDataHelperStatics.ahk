#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\MapControl.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapControlDataHelperStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapControlDataHelperStatics
     * @type {Guid}
     */
    static IID => Guid("{7a6632d6-e944-4110-83cf-314d0722e2e5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMapControl"]

    /**
     * 
     * @param {Boolean} rasterRenderMode 
     * @returns {MapControl} 
     */
    CreateMapControl(rasterRenderMode) {
        result := ComCall(6, this, "int", rasterRenderMode, "ptr*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapControl(returnValue)
    }
}
