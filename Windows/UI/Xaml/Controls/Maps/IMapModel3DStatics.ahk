#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include .\MapModel3D.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapModel3DStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapModel3DStatics
     * @type {Guid}
     */
    static IID => Guid("{4834a480-8e56-4b0f-872d-7ead103187cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFrom3MFAsync", "CreateFrom3MFWithShadingOptionAsync"]

    /**
     * 
     * @param {IRandomAccessStreamReference} source 
     * @returns {IAsyncOperation<MapModel3D>} 
     */
    CreateFrom3MFAsync(source) {
        result := ComCall(6, this, "ptr", source, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MapModel3D, operation)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} source 
     * @param {Integer} shadingOption 
     * @returns {IAsyncOperation<MapModel3D>} 
     */
    CreateFrom3MFWithShadingOptionAsync(source, shadingOption) {
        result := ComCall(7, this, "ptr", source, "int", shadingOption, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MapModel3D, operation)
    }
}
