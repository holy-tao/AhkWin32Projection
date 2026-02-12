#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\..\Services\Maps\LocalSearch\LocalLocation.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapControlBusinessLandmarkPointerEnteredEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapControlBusinessLandmarkPointerEnteredEventArgs
     * @type {Guid}
     */
    static IID => Guid("{5e4081a6-ea98-4f95-8caf-5b42696ff504}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LocalLocations"]

    /**
     * @type {IVectorView<LocalLocation>} 
     */
    LocalLocations {
        get => this.get_LocalLocations()
    }

    /**
     * 
     * @returns {IVectorView<LocalLocation>} 
     */
    get_LocalLocations() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(LocalLocation, value)
    }
}
