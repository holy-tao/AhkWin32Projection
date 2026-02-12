#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\BitmapPropertySet.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes methods for reading image metadata and properties.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.ibitmappropertiesview
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class IBitmapPropertiesView extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBitmapPropertiesView
     * @type {Guid}
     */
    static IID => Guid("{7e0fe87a-3a70-48f8-9c55-196cf5a545f5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropertiesAsync"]

    /**
     * Asynchronously retrieves one or more bitmap properties.
     * @param {IIterable<HSTRING>} propertiesToRetrieve A collection of strings containing the specified property keys.
     * @returns {IAsyncOperation<BitmapPropertySet>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.ibitmappropertiesview.getpropertiesasync
     */
    GetPropertiesAsync(propertiesToRetrieve) {
        result := ComCall(6, this, "ptr", propertiesToRetrieve, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(BitmapPropertySet, asyncInfo)
    }
}
